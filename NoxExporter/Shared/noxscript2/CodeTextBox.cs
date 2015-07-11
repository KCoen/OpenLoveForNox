/*
 * MapEditor
 * Пользователь: AngryKirC
 * Дата: 14.04.2015
 */
using System;
using System.Drawing;
using System.Windows.Forms;
using System.Collections.Generic;

namespace MapEditor.noxscript2
{
	/// <summary>
	/// Description of CodeTextBox.
	/// </summary>
	public class CodeTextBox : RichTextBox
	{
		ScriptObjContainer scripts = null;
		bool allowRepaint = true;
		
		public Color DefaultColor = Color.Black;
		public Color FunctionColor = Color.DarkBlue;
		public Color KeywordColor = Color.Purple;
		public Color StringColor = Color.Green;
		public Color ErrorColor = Color.Red;
		
		public CodeTextBox()
		{
		}
		
		public void SetScriptContainer(ScriptObjContainer soc)
		{
			scripts = soc;
		}
		
		private bool IsVariableName(string text)
		{
			foreach (ScriptObjContainer.ScriptFunction.ScriptVariable sv in scripts.Functions[1].Variables)
			{
				if (sv.Name == text)
				{
					return true;
				}
			}
			return false;
		}
		
		private void ColorTextArea(int startIndex, int length, Color color)
		{
			SelectionStart = startIndex;
			SelectionLength = length;
			SelectionColor = color;
		}
		
		/// <summary>
		/// WndProc hook
		/// </summary>
		protected override void WndProc(ref Message m)
		{
			if (m.Msg == 0x00f)
			{
				if (allowRepaint)
					base.WndProc(ref m);
				else
					m.Result = IntPtr.Zero;
			}
			else
				base.WndProc(ref m);
		}

		/// <summary>
		/// TextChanged hook. Format script syntax
		/// </summary>
		protected override void OnTextChanged(EventArgs e)
		{
			base.OnTextChanged(e);
			allowRepaint = false; // selection flicker fix
			string codeString = Text;
			string chunk = "";
			int charIndex = 0;
			int lineCounter = 0;
			char nextChar;
			bool handled = false;
			bool rstring = false;
			int stringIndex = 0;
			
			// force normal color
			int css = SelectionStart;
			int csl = SelectionLength;
			SelectAll();
			SelectionColor = DefaultColor;
			
			while (codeString.Length > charIndex)
			{
				nextChar = codeString[charIndex];
				charIndex++;
				
				handled = true;
				if (chunk == "if" || chunk == "jump" || chunk == "return")
				{
					//int fn = charIndex - chunk.Length - 1;
					//ColorTextArea(fn, chunk.Length, KeywordColor);
				}
				else
				{
					switch (nextChar)
					{
						case '\n':
						case '\r':
							lineCounter++;
							break;
						case '(':
							// function call start
							int fn = charIndex - chunk.Length - 1;
							ColorTextArea(fn, chunk.Length, FunctionColor);
							break;
						case ',':
							// argument separator
							break;
						case ')':
							// function call end
							break;
						case '=':
						case '-':
						case '+':
						case '*':
						case '/':
						case '<':
						case '>':
						case '%':
						case '&':
						case '^':
						case '|':
							// handled
							break;
						case '"':
							if (rstring)
							{
								// Finish string
								int len = charIndex - stringIndex;
								ColorTextArea(stringIndex, len, StringColor);
								rstring = false;
							}
							else
							{
								// Start string
								stringIndex = charIndex - 1;
								rstring = true;
							}
							break;
						default:
							handled = false;
							break;
/*
						case '=':
						case '-':
						case '+':
						case '*':
						case '/':
						case '<':
						case '>':
						case '%':
						case '&':
						case '^':
						case '|':
							// arithmetics
							if (arithmReadingRh)
							{
								leftHand += operation + rightHand;
								arithmReadingRh = false;
							}
							if (!arithmReadingOp)
							{
								arithmReadingOp = true;
								operation = "";
								leftHand = chunk;
								rightHand = "";
							}
							if (arithmReadingOp)
							{
								operation += nextChar;
							}
							break;
						default:
							if (arithmReadingOp) arithmReadingRh = true;
							if (arithmReadingRh)
							{
								arithmReadingOp = false;
								rightHand += nextChar;
							}
							else 
*/
					}
				}
				
				if (handled)
					chunk = "";
				else if (nextChar != ' ')
					chunk += nextChar;
			}
			
			Select(css, csl);
			allowRepaint = true;
		}
	}
}
