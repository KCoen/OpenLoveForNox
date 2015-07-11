/*
 * MapEditor
 * Пользователь: AngryKirC
 * Дата: 12.04.2015
 */
using System;

namespace MapEditor.noxscript2
{
	/// <summary>
	/// Description of Compiler.
	/// </summary>
	public class Compiler
	{
		// First, before compiling, we need to validate following things:
		// Variable/function names are correct (not empty/spaces/duplicates)
		// There are no unused strings in strings table
		
		// throw warning if:
		// Type mismatch in function call (probably type detection fail)
		// Local variables override GLOBAL
		
		// throw error if:
		// invalid #arguments in function call
		// Script function has equal name to Nox function
		public Compiler()
		{
		}
	}
}
