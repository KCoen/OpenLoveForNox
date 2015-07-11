/*
 * MapEditor
 * Пользователь: AngryKirC
 * Дата: 01.12.2014
 */
using System;
using System.Collections.Generic;
using System.IO;

namespace MapEditor.noxscript2
{
	/// <summary>
	/// Description of ScriptObjContainer.
	/// </summary>
	public class ScriptObjContainer
	{
		public List<ScriptFunction> Functions;
		public string[] ScriptStringTable;
		private BinaryReader br;
		private Decompiler scriptDecompiler;
		
		public enum VarType : int
		{
			GENERIC = -1, // unexistence
			INTEGER = 0,
			FLOAT = 1,
			STRING = 2,
		}
		
		public ScriptObjContainer(NoxShared.Map.ScriptObject obj)
		{
			if (obj.NCObj.Length > 0)
			{
				br = new BinaryReader(new MemoryStream(obj.NCObj));
				ParseHeader();
				br.Close();
				br = null;
			}
			else
			{
				// Scripts were not included
				Functions = new List<ScriptObjContainer.ScriptFunction>(0);
				ScriptStringTable = new string[0];
			}
			scriptDecompiler = new Decompiler(this);
		}
		
		public string Decompile(int funcID)
		{
			return scriptDecompiler.Decompile(funcID);
		}
		
		private void Error(string text)
		{
			throw new ApplicationException(text);
		}
		
		private void ValidateToken(string token)
		{
			string test = new string(br.ReadChars(4));
			if (token != test)
				Error(String.Format("ScriptObject: {0} token expected", token));
		}
		
		/// <summary>
		/// Parse scriptobject header, without decompiling the code
		/// </summary>
		private void ParseHeader()
		{
			string magic1 = new string(br.ReadChars(8));
			if (magic1 != "SCRIPT03") Error("Invalid magic in ScriptObject header, SCRIPT03 expected");
			
			int count;
			// String table
			ValidateToken("STRG");
			count = br.ReadInt32();
			ScriptStringTable = new string[count];
			for (int i = 0; i < count; i++) ScriptStringTable[i] = new string(br.ReadChars(br.ReadInt32()));
		
			// Functions
			ValidateToken("CODE");
			count = br.ReadInt32();
			Functions = new List<ScriptFunction>(count);
			for (int i = 0; i < count; i++)
			{
				// Function header
				ValidateToken("FUNC");
				string fname = new string(br.ReadChars(br.ReadInt32()));
				int returns = br.ReadInt32();
				int numargs = br.ReadInt32();
				if (returns > 1) Error("Return is not a boolean! O_o");
				
				ScriptFunction func = new ScriptFunction(fname, numargs, (returns == 1 ? true : false));
				// Variables (symbols)
				ValidateToken("SYMB");
				int scount = br.ReadInt32();
				br.ReadInt32(); // always ignored
				for (int s = 0; s < scount; s++)
				{
					string format = "var_{0}";
					if (numargs > 0)
					{
						numargs--;
						format = "arg_{0}";
					}
					if (i == 1) // GLOBAL
					{
						if (s > 3)
							format = "Gvar_{0}";
						else if (s == 0)
							format = "Trigger";
						else if (s == 1)
							format = "Caller";
						else if (s == 2)
							format = "true";
						else if (s == 3)
							format = "false";
					}
					func.Variables.Add(new ScriptFunction.ScriptVariable(
						String.Format(format, s), VarType.INTEGER, br.ReadInt32()));
				}
				// Binary code
				ValidateToken("DATA");
				func.CompiledCode = br.ReadBytes(br.ReadInt32());
				// Add to list
				Functions.Add(func);
			}
			// Finish
			ValidateToken("DONE");
		}
		
		public class ScriptFunction
		{
			public string Name;
			public int NumArgs;
			public bool Returns;
			public List<ScriptVariable> Variables;
			public byte[] CompiledCode;
				
			public ScriptFunction(string name, int nArgs, bool returns)
			{
				Name = name;
				NumArgs = nArgs;
				Returns = returns;
				Variables = new List<ScriptVariable>();
				CompiledCode = null;
			}
			
			public class ScriptVariable
			{
				public string Name;
				public VarType Type;
				public int ArraySize;
				
				public ScriptVariable(string name, VarType type, int asize)
				{
					Name = name;
					Type = type;
					ArraySize = asize;
				}
			}
		}
	}
}
