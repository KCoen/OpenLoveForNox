/*
 * MapEditor
 * Пользователь: AngryKirC
 * Дата: 01.12.2014
 */
using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using ScriptFunction = MapEditor.noxscript2.ScriptObjContainer.ScriptFunction;

namespace MapEditor.noxscript2
{
	/// <summary>
	/// Description of ScriptUserControl.
	/// </summary>
	public partial class ScriptUserControl : UserControl
	{
		private ScriptObjContainer scriptContainer;
		private int selectedFunctionIndex = -1;
		private int selectedVariableIndex = -1;
		
		public ScriptUserControl()
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
			
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
		}
		
		private void UpdateFunctionsList()
		{			
			functionsListBox.Items.Clear();
			// Repopulate list
			foreach (ScriptFunction sf in scriptContainer.Functions)
				functionsListBox.Items.Add(sf.Name);
			
			// Update selection
			int limit = functionsListBox.Items.Count - 1;
			if (selectedFunctionIndex > limit) selectedFunctionIndex = limit; 
			functionsListBox.SelectedIndex = selectedFunctionIndex;
		}
		
		private void UpdateVariablesList()
		{
			ScriptFunction sf = scriptContainer.Functions[selectedFunctionIndex];
			
			variablesListBox.Items.Clear();
			// Repopulate list
			foreach (ScriptFunction.ScriptVariable v in sf.Variables)
				variablesListBox.Items.Add(v.Name);
			
			// Update selection
			int limit = variablesListBox.Items.Count - 1;
			if (selectedVariableIndex > limit) selectedVariableIndex = limit; 
			variablesListBox.SelectedIndex = selectedVariableIndex;
		}
		
		public void UpdateForMap(NoxShared.Map map)
		{
			scriptContainer = new ScriptObjContainer(map.Scripts);
			UpdateFunctionsList();
			richTextBoxCode.SetScriptContainer(scriptContainer);
		}
		
		/// <summary>
		/// User selected function from the list. Update function info and variables list
		/// </summary>
		void FunctionsListBoxSelectedIndexChanged(object sender, EventArgs e)
		{
			int index = functionsListBox.SelectedIndex;
			if (index < 0) return;
			selectedFunctionIndex = index;
			
			// Which one is selected
			ScriptFunction sf = scriptContainer.Functions[index];
			// Update data
			textBoxFuncName.Text = sf.Name;
			numOfArgs.Value = sf.NumArgs;
			checkBoxReturn.Checked = sf.Returns;
			UpdateVariablesList();
			richTextBoxCode.Text = scriptContainer.Decompile(index);
		}
		
		/// <summary>
		/// User selected variable from the list. Update variable info
		/// </summary>
		void VariablesListBoxSelectedIndexChanged(object sender, EventArgs e)
		{
			int index = variablesListBox.SelectedIndex;
			if (index < 0) return;
			selectedVariableIndex = index;
			
			// Which variable
			ScriptFunction sf = scriptContainer.Functions[selectedFunctionIndex];
			ScriptFunction.ScriptVariable sv = sf.Variables[index];
			
			// Update data
			varNameTextBox.Text = sv.Name;
			varTypeComboBox.SelectedIndex = (int) sv.Type;
			varSizeBox.Value = sv.ArraySize;
		}
		
		void VarNameTextBoxTextChanged(object sender, EventArgs e)
		{
			if (selectedFunctionIndex < 0) return;
			if (selectedVariableIndex < 0) return;
			ScriptFunction sf = scriptContainer.Functions[selectedFunctionIndex];
			ScriptFunction.ScriptVariable sv = sf.Variables[selectedVariableIndex];
			sv.Name = varNameTextBox.Text;
			variablesListBox.Items[selectedVariableIndex] = sv.Name;
		}
		
		void VarTypeComboBoxSelectedIndexChanged(object sender, EventArgs e)
		{
			if (selectedFunctionIndex < 0) return;
			if (selectedVariableIndex < 0) return;
			ScriptFunction sf = scriptContainer.Functions[selectedFunctionIndex];
			ScriptFunction.ScriptVariable sv = sf.Variables[selectedVariableIndex];
			sv.Type = (ScriptObjContainer.VarType) varTypeComboBox.SelectedIndex;
		}
		
		void VarSizeBoxValueChanged(object sender, EventArgs e)
		{
			if (selectedFunctionIndex < 0) return;
			if (selectedVariableIndex < 0) return;
			ScriptFunction sf = scriptContainer.Functions[selectedFunctionIndex];
			ScriptFunction.ScriptVariable sv = sf.Variables[selectedVariableIndex];
			sv.ArraySize = (int) varSizeBox.Value;
		}
		
		void CheckBoxReturnCheckedChanged(object sender, EventArgs e)
		{
			if (selectedFunctionIndex < 0) return;
			ScriptFunction sf = scriptContainer.Functions[selectedFunctionIndex];
			sf.Returns = checkBoxReturn.Checked;
		}
		
		void NumOfArgsValueChanged(object sender, EventArgs e)
		{
			if (selectedFunctionIndex < 0) return;
			ScriptFunction sf = scriptContainer.Functions[selectedFunctionIndex];
			sf.NumArgs = (int) numOfArgs.Value;
		}
		
		void TextBoxFuncNameTextChanged(object sender, EventArgs e)
		{
			if (selectedFunctionIndex < 0) return;
			ScriptFunction sf = scriptContainer.Functions[selectedFunctionIndex];
			sf.Name = textBoxFuncName.Text;
			functionsListBox.Items[selectedFunctionIndex] = sf.Name;
		}
	}
}
