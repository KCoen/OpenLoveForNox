/*
 * MapEditor
 * Пользователь: AngryKirC
 * Дата: 10.04.2015
 */
using System;
using System.Globalization;
using System.Collections.Generic;
using System.IO;
using TVariableType = MapEditor.noxscript2.ScriptObjContainer.VarType;

namespace MapEditor.noxscript2
{
    /// <summary>
    /// Description of Decompiler.
    /// </summary>
    public class Decompiler
    {
        static NumberFormatInfo floatFormat = NumberFormatInfo.InvariantInfo;

        private ScriptObjContainer scriptContainer;
        private string decompileResult;
        private BinaryReader br;
        private Stack<Operation> opstack;
        private Stack<int> jumps;
        private ScriptObjContainer.ScriptFunction function;

        public Decompiler(ScriptObjContainer soc)
        {
            scriptContainer = soc;
        }

        private void Error(string text)
        {
            throw new ApplicationException(text);
        }

        public string Decompile(int funcid)
        {
            decompileResult = "";
            function = scriptContainer.Functions[funcid];
            br = new BinaryReader(new MemoryStream(function.CompiledCode));
            opstack = new Stack<Operation>();
            jumps = new Stack<int>();
            DecompileImpl();
            br.Close();
            // opstack -> string
            FormatFinish();
            return decompileResult;
        }

        private void FormatFinish()
        {
            Operation[] orev = opstack.ToArray();
            Array.Reverse(orev);
            Queue<string> fin = new Queue<string>();
            for (int i = 0; i < orev.Length; i++)
            {
                fin.Enqueue(orev[i].Human);
                if (jumps.Contains(orev[i].TokenStreamIndex))
                {
                    fin.Enqueue("::" + MakeJumpLabel(orev[i].TokenStreamIndex) + "::");
                }
            }
            foreach (string op in fin)
            {
                decompileResult += op + "\n";
            }
        }

        private void DecompileImpl()
        {
            long length = br.BaseStream.Length;
            long pos = 0;
            Operation op;
            if (length > 0) // чтобы не получить EndOfStreamException
            {
                while (pos < length)
                {
                    op = ParseOperation(br.ReadInt32());
                    pos = br.BaseStream.Position;
                    op.TokenStreamIndex = (int)pos / 4;
                    opstack.Push(op);
                }
            }
        }

        private Operation AddFetch(TVariableType type, bool assign)
        {
            Operation result = new Operation("");
            int varSrc = br.ReadInt32(); // 0 = current fn, 1 = GLOBAL fn
            if (varSrc > 1) Error("varSrc > 1 this is possible?");
            int varn = br.ReadInt32();
            if ((varSrc == 1))
            {
                result.Human = scriptContainer.Functions[1].Variables[varn].Name;
                result.AssignIsGlobal = true;
            }
            else
            {
                result.Human = function.Variables[varn].Name;
            }
            // Mark as assignment for future use in type detection routine
            if (assign) result.AssignedVariable = varn;

            return result;
        }

        private Operation AddArray(TVariableType type, bool assign)
        {
            Operation b = opstack.Pop();
            Operation a = opstack.Pop();
            Operation result = new Operation(a.Human + "[" + b.Human + "]");
            if (assign)
            {
                result.AssignedVariable = a.AssignedVariable;
                result.AssignIsGlobal = a.AssignIsGlobal;
            }
            return result;
        }

        private Operation AddImmediate(TVariableType type)
        {
            Operation result = null;
            switch (type)
            {
                case TVariableType.INTEGER:
                    result = new Operation(br.ReadInt32().ToString());
                    break;
                case TVariableType.FLOAT:
                    result = new Operation(br.ReadSingle().ToString(floatFormat));
                    break;
                case TVariableType.STRING:
                    result = new Operation(String.Format("\"{0}\"", scriptContainer.ScriptStringTable[br.ReadInt32()]));
                    break;
            }
            return result;
        }

        private Operation AddArithmetic(TVariableType type, string opt)
        {
            Operation b = opstack.Pop();
            Operation a = opstack.Pop();
            Operation result = new Operation(String.Format("{0} {1} {2}", a.Human, opt, b.Human));

            int assign = a.AssignedVariable;
            if (assign >= 0)
            {
                // Тут мы нашли тип..
                if (a.AssignIsGlobal)
                    scriptContainer.Functions[1].Variables[assign].Type = type;
                else
                    function.Variables[assign].Type = type;
            }
            return result;
        }

		private Operation AddBitwiseArithmetic(TVariableType type, string opt)
		{
			Operation b = opstack.Pop();
			Operation a = opstack.Pop();
			string strOpt = String.Format(opt, a.Human, b.Human);
			Operation result = new Operation(strOpt);

			int assign = a.AssignedVariable;
			if (assign >= 0)
			{
				// Тут мы нашли тип..
				if (a.AssignIsGlobal)
					scriptContainer.Functions[1].Variables[assign].Type = type;
				else
					function.Variables[assign].Type = type;
			}
			return result;
		}

		private Operation AddDeltaArithmetic(TVariableType type, string opt)
		{
			Operation b = opstack.Pop();
			Operation a = opstack.Pop();
			Operation result = new Operation(String.Format("{0} = {1} {2} {3}", a.Human, a.Human, opt, b.Human));

			int assign = a.AssignedVariable;
			if (assign >= 0)
			{
				// Тут мы нашли тип..
				if (a.AssignIsGlobal)
					scriptContainer.Functions[1].Variables[assign].Type = type;
				else
					function.Variables[assign].Type = type;
			}
			return result;
		}

		// A = opt({0}, {1})
		private Operation AddBitwiseDeltaArithmetic(TVariableType type, string opt)
		{ 
			Operation b = opstack.Pop();
			Operation a = opstack.Pop();
			string strOpt = String.Format(opt, a.Human, b.Human);
			Operation result = new Operation(String.Format("{0} = {1} {2} {3}", a.Human, strOpt));

			int assign = a.AssignedVariable;
			if (assign >= 0)
			{
				// Тут мы нашли тип..
				if (a.AssignIsGlobal)
					scriptContainer.Functions[1].Variables[assign].Type = type;
				else
					function.Variables[assign].Type = type;
			}
			return result;
		}

        private string MakeJumpLabel(int addr)
        {
            return String.Format("l{0}", addr);
        }

        private Operation ParseOperation(int op)
        {
            Operation result;
            int jaddr; int nargs; string[] args;
            switch (op)
            {
                case 2: // это значит присваивание
                    result = AddFetch(TVariableType.INTEGER, true);
                    break;
                // Fetching values
                case 0:
                    result = AddFetch(TVariableType.INTEGER, false);
                    break;
                case 1:
                    result = AddFetch(TVariableType.FLOAT, false);
                    break;
                case 3:
                    result = AddFetch(TVariableType.STRING, false);
                    break;
                // Immediate values
                case 4:
                    result = AddImmediate(TVariableType.INTEGER);
                    break;
                case 5:
                    result = AddImmediate(TVariableType.FLOAT);
                    break;
                case 6:
                    result = AddImmediate(TVariableType.STRING);
                    break;
                // Arithmetic operations
                case 7:
                    result = AddArithmetic(TVariableType.INTEGER, "+");
                    break;
                case 8:
                    result = AddArithmetic(TVariableType.FLOAT, "+");
                    break;
                case 0x49:
                    result = AddArithmetic(TVariableType.STRING, "+");
                    break;
                case 9:
                    result = AddArithmetic(TVariableType.INTEGER, "-");
                    break;
                case 0xA:
                    result = AddArithmetic(TVariableType.FLOAT, "-");
                    break;
                case 0xB:
                    result = AddArithmetic(TVariableType.INTEGER, "*");
                    break;
                case 0xC:
                    result = AddArithmetic(TVariableType.FLOAT, "*");
                    break;
                case 0xD:
                    result = AddArithmetic(TVariableType.INTEGER, "/");
                    break;
                case 0xE:
                    result = AddArithmetic(TVariableType.FLOAT, "/");
                    break;
                case 0xF:
                    result = AddArithmetic(TVariableType.INTEGER, "%");
                    break;
                case 0x10:
					result = AddBitwiseArithmetic(TVariableType.INTEGER, "bit.band({0}, {1}");
                    break;
                case 0x11:
					result = AddBitwiseArithmetic(TVariableType.INTEGER, "bit.bor({0}, {1})");
                    break;
                case 0x12:
					result = AddBitwiseArithmetic(TVariableType.INTEGER, "bit.bxor({0}, {1})");
                    break;
                case 0x26:
					result = AddBitwiseArithmetic(TVariableType.INTEGER, "bit.lshift({0}, {1}");
                    break;
                case 0x27:
					result = AddBitwiseArithmetic(TVariableType.INTEGER, "bit.rshift({0}, {1}");
                    break;
                // Goto (jump) operations
                case 0x13:
                    jaddr = br.ReadInt32();
                    jumps.Push(jaddr);
                    result = new Operation("goto " + MakeJumpLabel(jaddr));
                    break;
                case 0x14:
                    jaddr = br.ReadInt32();
                    jumps.Push(jaddr);

					string popped = opstack.Pop().Human;
					if (popped.Contains(" = ")) // Lua can't have assignments in if statements so unroll this into 2 lines
					{
						var substrs = popped.Split(new string[] { " = " }, StringSplitOptions.None);

						result = new Operation(popped + "\r\nif (" + substrs[0] + ") then \r\n\tgoto " + MakeJumpLabel(jaddr) + "\r\nend");
					}
					else
					{
						result = new Operation("if (" + popped + ") then \r\n\tgoto " + MakeJumpLabel(jaddr) + "\r\nend");
					}

					
                    break;
                case 0x15:
                    jaddr = br.ReadInt32();
                    jumps.Push(jaddr);
					string str = opstack.Pop().Human;
					if (str.Contains(" = ")) // Lua can't have assignments in if statements so unroll this into 2 lines
					{
						var substrs = str.Split(new string[] { " = " }, StringSplitOptions.None);

						result = new Operation(str + "\r\nif not (" + substrs[0] + ") then \r\n\tgoto " + MakeJumpLabel(jaddr) + "\r\nend");
					}
					else
					{
						result = new Operation("if not (" + str + ") then \r\n\tgoto " + MakeJumpLabel(jaddr) + "\r\nend");
					}
					//result = new Operation("if not " + str + " then \r\n\tgoto " + MakeJumpLabel(jaddr) + "\r\nend");
                    break;
                // Assignment
                case 0x16:
                    result = AddArithmetic(TVariableType.INTEGER, "=");
                    break;
                case 0x17:
                    result = AddArithmetic(TVariableType.FLOAT, "=");
                    break;
                case 0x18:
                    result = AddArithmetic(TVariableType.STRING, "=");
                    break;
                case 0x1D:
					result = AddDeltaArithmetic(TVariableType.INTEGER, "+");
                    break;
                case 0x1E:
					result = AddDeltaArithmetic(TVariableType.FLOAT, "+");
                    break;
                case 0x1F:
					result = AddDeltaArithmetic(TVariableType.STRING, "+");
                    break;
                case 0x20:
					result = AddDeltaArithmetic(TVariableType.INTEGER, "-");
                    break;
                case 0x21:
					result = AddDeltaArithmetic(TVariableType.FLOAT, "-");
                    break;
                case 0x19:
					result = AddDeltaArithmetic(TVariableType.INTEGER, "*");
                    break;
                case 0x1A:
					result = AddDeltaArithmetic(TVariableType.FLOAT, "*");
                    break;
                case 0x1B:
					result = AddDeltaArithmetic(TVariableType.INTEGER, "/");
                    break;
                case 0x1C:
					result = AddDeltaArithmetic(TVariableType.FLOAT, "/");
                    break;
                case 0x22:
					result = AddDeltaArithmetic(TVariableType.INTEGER, "%");
                    break;
                case 0x39:
					result = AddBitwiseDeltaArithmetic(TVariableType.INTEGER, "bit.lshift({0}, {1}");//AddDeltaArithmetic(TVariableType.INTEGER, "<<");
                    break;
                case 0x3A:
					result = AddBitwiseDeltaArithmetic(TVariableType.INTEGER, "bit.rshift({0}, {1}");
					
                    break;
                case 0x3B:
					result = AddDeltaArithmetic(TVariableType.INTEGER, "bit.band({0}, {1}");
                    break;
                case 0x3C:
					result = AddDeltaArithmetic(TVariableType.INTEGER, "bit.bor({0}, {1}");
                    break;
                case 0x3D:
					result = AddDeltaArithmetic(TVariableType.INTEGER, "bit.bxor({0}, {1}");
                    break;
                // Comparsions
                case 0x23:
                    result = AddArithmetic(TVariableType.INTEGER, "==");
                    break;
                case 0x24:
                    result = AddArithmetic(TVariableType.FLOAT, "==");
                    break;
                case 0x25:
                    result = AddArithmetic(TVariableType.STRING, "==");
                    break;
                case 0x28:
                    result = AddArithmetic(TVariableType.INTEGER, "<");
                    break;
                case 0x29:
                    result = AddArithmetic(TVariableType.FLOAT, "<");
                    break;
                case 0x2A:
                    result = AddArithmetic(TVariableType.STRING, "<");
                    break;
                case 0x2B:
                    result = AddArithmetic(TVariableType.INTEGER, ">");
                    break;
                case 0x2C:
                    result = AddArithmetic(TVariableType.FLOAT, ">");
                    break;
                case 0x2D:
                    result = AddArithmetic(TVariableType.STRING, ">");
                    break;
                case 0x2E:
                    result = AddArithmetic(TVariableType.INTEGER, "<=");
                    break;
                case 0x2F:
                    result = AddArithmetic(TVariableType.FLOAT, "<=");
                    break;
                case 0x30:
                    result = AddArithmetic(TVariableType.STRING, "<=");
                    break;
                case 0x31:
                    result = AddArithmetic(TVariableType.INTEGER, ">=");
                    break;
                case 0x32:
                    result = AddArithmetic(TVariableType.FLOAT, ">=");
                    break;
                case 0x33:
                    result = AddArithmetic(TVariableType.STRING, ">=");
                    break;
                case 0x34:
                    result = AddArithmetic(TVariableType.INTEGER, "~=");
                    break;
                case 0x35:
                    result = AddArithmetic(TVariableType.FLOAT, "~=");
                    break;
                case 0x36:
                    result = AddArithmetic(TVariableType.STRING, "~=");
                    break;
                case 0x37:
                    result = AddArithmetic(TVariableType.INTEGER, "and");
                    break;
                case 0x38:
                    result = AddArithmetic(TVariableType.INTEGER, "or");
                    break;
                // Array Assignments
                case 0x42: // ммм тут и строки так же?
                    result = AddArray(TVariableType.INTEGER, false);
                    break;
                case 0x43:
                    result = AddArray(TVariableType.FLOAT, false);
                    break;
                case 0x44: // присваивание
                    result = AddArray(TVariableType.INTEGER, true);
                    break;
                // Inversing
                case 0x3E:
                    result = new Operation(opstack.Pop().Human + " == 0");
                    break;
                case 0x3F:
                    result = new Operation("~" + opstack.Pop().Human); // int, binary
                    break;
                case 0x40:
                    result = new Operation("-" + opstack.Pop().Human); // int
                    break;
                case 0x41:
                    result = new Operation("-" + opstack.Pop().Human); // float
                    break;
                // Call special
                case 0x45:
                    int fnIndex = br.ReadInt32();
                    nargs = NoxFuncs.AllFunctions[fnIndex].ArgsCount;

                    string cs = "";
                    args = new string[nargs];
                    for (int i = 0; i < nargs; i++) args[i] = opstack.Pop().Human;
                    Array.Reverse(args);
                    foreach (string s in args) cs += s + ",";
                    if (cs.EndsWith(",")) cs = cs.Substring(0, cs.Length - 1);

                    result = new Operation(String.Format("{0}({1})", NoxFuncs.FunctionNames[fnIndex], cs));
                    break;
                case 0x46:
                    // в квестовых картах иногда передаются аргументы!
                    int scriptN = br.ReadInt32();
                    string cf = scriptContainer.Functions[scriptN].Name;

                    cf += "(";
                    nargs = scriptContainer.Functions[scriptN].NumArgs;
                    args = new string[nargs];
                    for (int i = 0; i < nargs; i++) args[i] = opstack.Pop().Human;
                    Array.Reverse(args);
                    foreach (string s in args) cf += s + ",";
                    if (cf.EndsWith(",")) cf = cf.Substring(0, cf.Length - 1);

                    result = new Operation(cf + ")");
                    break;
                case 0x47: // war07a.map
                case 0x48:
                    string rarg = "if true then return";
                    // returns something
                    if (function.Returns && op == 0x47)
                    {
                        rarg += " " + opstack.Pop().Human;
                    }
					rarg += " end";
                    result = new Operation(rarg);
                    break;
                default:
                    throw new NotImplementedException();
            }
            return result;
        }
    }
}
