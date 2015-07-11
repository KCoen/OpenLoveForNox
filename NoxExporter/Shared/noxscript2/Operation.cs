/*
 * MapEditor
 * Пользователь: AngryKirC
 * Дата: 10.04.2015
 */
using System;

namespace MapEditor.noxscript2
{
	/// <summary>
	/// Description of AbstractOperation.
	/// </summary>
	public class Operation
	{
		//public Operation[] Child;
		public string Human;
		public bool AssignIsGlobal;
		public int AssignedVariable;
		public int TokenStreamIndex;
		
		public Operation(string human)
		{
			Human = human;
			AssignIsGlobal = false;
			AssignedVariable = -1;
			TokenStreamIndex = -1;
		}
	}
}
