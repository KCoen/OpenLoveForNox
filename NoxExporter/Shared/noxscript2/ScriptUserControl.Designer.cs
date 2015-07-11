/*
 * MapEditor
 * Пользователь: AngryKirC
 * Дата: 01.12.2014
 */
namespace MapEditor.noxscript2
{
	partial class ScriptUserControl
	{
		/// <summary>
		/// Designer variable used to keep track of non-visual components.
		/// </summary>
		private System.ComponentModel.IContainer components = null;
		
		/// <summary>
		/// Disposes resources used by the control.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing) {
				if (components != null) {
					components.Dispose();
				}
			}
			base.Dispose(disposing);
		}
		
		/// <summary>
		/// This method is required for Windows Forms designer support.
		/// Do not change the method contents inside the source code editor. The Forms designer might
		/// not be able to load this method if it was changed manually.
		/// </summary>
		private void InitializeComponent()
		{
			this.functionsListBox = new System.Windows.Forms.ListBox();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.button2 = new System.Windows.Forms.Button();
			this.button1 = new System.Windows.Forms.Button();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.numOfArgs = new System.Windows.Forms.NumericUpDown();
			this.label2 = new System.Windows.Forms.Label();
			this.checkBoxReturn = new System.Windows.Forms.CheckBox();
			this.textBoxFuncName = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.groupBox3 = new System.Windows.Forms.GroupBox();
			this.varSizeBox = new System.Windows.Forms.NumericUpDown();
			this.label6 = new System.Windows.Forms.Label();
			this.buttonDelVar = new System.Windows.Forms.Button();
			this.buttonNewVar = new System.Windows.Forms.Button();
			this.varTypeComboBox = new System.Windows.Forms.ComboBox();
			this.varNameTextBox = new System.Windows.Forms.TextBox();
			this.label4 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.variablesListBox = new System.Windows.Forms.ListBox();
			this.label5 = new System.Windows.Forms.Label();
			this.richTextBoxCode = new MapEditor.noxscript2.CodeTextBox();
			this.groupBox1.SuspendLayout();
			this.groupBox2.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.numOfArgs)).BeginInit();
			this.groupBox3.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.varSizeBox)).BeginInit();
			this.SuspendLayout();
			// 
			// functionsListBox
			// 
			this.functionsListBox.FormattingEnabled = true;
			this.functionsListBox.Location = new System.Drawing.Point(8, 16);
			this.functionsListBox.Name = "functionsListBox";
			this.functionsListBox.ScrollAlwaysVisible = true;
			this.functionsListBox.Size = new System.Drawing.Size(136, 368);
			this.functionsListBox.TabIndex = 1;
			this.functionsListBox.SelectedIndexChanged += new System.EventHandler(this.FunctionsListBoxSelectedIndexChanged);
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.Add(this.button2);
			this.groupBox1.Controls.Add(this.button1);
			this.groupBox1.Controls.Add(this.functionsListBox);
			this.groupBox1.Location = new System.Drawing.Point(8, 8);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(152, 448);
			this.groupBox1.TabIndex = 2;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Script Functions";
			// 
			// button2
			// 
			this.button2.Location = new System.Drawing.Point(40, 416);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(75, 23);
			this.button2.TabIndex = 3;
			this.button2.Text = "Delete";
			this.button2.UseVisualStyleBackColor = true;
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(40, 392);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(75, 23);
			this.button1.TabIndex = 2;
			this.button1.Text = "Create New";
			this.button1.UseVisualStyleBackColor = true;
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.Add(this.numOfArgs);
			this.groupBox2.Controls.Add(this.label2);
			this.groupBox2.Controls.Add(this.checkBoxReturn);
			this.groupBox2.Controls.Add(this.textBoxFuncName);
			this.groupBox2.Controls.Add(this.label1);
			this.groupBox2.Location = new System.Drawing.Point(168, 8);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(168, 112);
			this.groupBox2.TabIndex = 3;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Function Info";
			// 
			// numOfArgs
			// 
			this.numOfArgs.Location = new System.Drawing.Point(96, 56);
			this.numOfArgs.Maximum = new decimal(new int[] {
									9,
									0,
									0,
									0});
			this.numOfArgs.Name = "numOfArgs";
			this.numOfArgs.Size = new System.Drawing.Size(48, 20);
			this.numOfArgs.TabIndex = 5;
			this.numOfArgs.ValueChanged += new System.EventHandler(this.NumOfArgsValueChanged);
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(8, 56);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(88, 23);
			this.label2.TabIndex = 4;
			this.label2.Text = "N of arguments:";
			// 
			// checkBoxReturn
			// 
			this.checkBoxReturn.Location = new System.Drawing.Point(8, 80);
			this.checkBoxReturn.Name = "checkBoxReturn";
			this.checkBoxReturn.Size = new System.Drawing.Size(72, 24);
			this.checkBoxReturn.TabIndex = 2;
			this.checkBoxReturn.Text = "Returns";
			this.checkBoxReturn.UseVisualStyleBackColor = true;
			this.checkBoxReturn.CheckedChanged += new System.EventHandler(this.CheckBoxReturnCheckedChanged);
			// 
			// textBoxFuncName
			// 
			this.textBoxFuncName.Location = new System.Drawing.Point(56, 24);
			this.textBoxFuncName.Name = "textBoxFuncName";
			this.textBoxFuncName.Size = new System.Drawing.Size(104, 20);
			this.textBoxFuncName.TabIndex = 1;
			this.textBoxFuncName.TextChanged += new System.EventHandler(this.TextBoxFuncNameTextChanged);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 24);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(40, 23);
			this.label1.TabIndex = 0;
			this.label1.Text = "Name";
			// 
			// groupBox3
			// 
			this.groupBox3.Controls.Add(this.varSizeBox);
			this.groupBox3.Controls.Add(this.label6);
			this.groupBox3.Controls.Add(this.buttonDelVar);
			this.groupBox3.Controls.Add(this.buttonNewVar);
			this.groupBox3.Controls.Add(this.varTypeComboBox);
			this.groupBox3.Controls.Add(this.varNameTextBox);
			this.groupBox3.Controls.Add(this.label4);
			this.groupBox3.Controls.Add(this.label3);
			this.groupBox3.Controls.Add(this.variablesListBox);
			this.groupBox3.Location = new System.Drawing.Point(168, 128);
			this.groupBox3.Name = "groupBox3";
			this.groupBox3.Size = new System.Drawing.Size(136, 224);
			this.groupBox3.TabIndex = 3;
			this.groupBox3.TabStop = false;
			this.groupBox3.Text = "Variables";
			// 
			// varSizeBox
			// 
			this.varSizeBox.Location = new System.Drawing.Point(64, 168);
			this.varSizeBox.Maximum = new decimal(new int[] {
									128,
									0,
									0,
									0});
			this.varSizeBox.Name = "varSizeBox";
			this.varSizeBox.Size = new System.Drawing.Size(64, 20);
			this.varSizeBox.TabIndex = 8;
			this.varSizeBox.ValueChanged += new System.EventHandler(this.VarSizeBoxValueChanged);
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(8, 168);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(48, 23);
			this.label6.TabIndex = 7;
			this.label6.Text = "Arr. Size";
			// 
			// buttonDelVar
			// 
			this.buttonDelVar.Location = new System.Drawing.Point(72, 192);
			this.buttonDelVar.Name = "buttonDelVar";
			this.buttonDelVar.Size = new System.Drawing.Size(56, 23);
			this.buttonDelVar.TabIndex = 6;
			this.buttonDelVar.Text = "Delete";
			this.buttonDelVar.UseVisualStyleBackColor = true;
			// 
			// buttonNewVar
			// 
			this.buttonNewVar.Location = new System.Drawing.Point(8, 192);
			this.buttonNewVar.Name = "buttonNewVar";
			this.buttonNewVar.Size = new System.Drawing.Size(56, 23);
			this.buttonNewVar.TabIndex = 5;
			this.buttonNewVar.Text = "New";
			this.buttonNewVar.UseVisualStyleBackColor = true;
			// 
			// varTypeComboBox
			// 
			this.varTypeComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.varTypeComboBox.FormattingEnabled = true;
			this.varTypeComboBox.Items.AddRange(new object[] {
									"int",
									"float",
									"string"});
			this.varTypeComboBox.Location = new System.Drawing.Point(48, 144);
			this.varTypeComboBox.Name = "varTypeComboBox";
			this.varTypeComboBox.Size = new System.Drawing.Size(80, 21);
			this.varTypeComboBox.TabIndex = 4;
			this.varTypeComboBox.SelectedIndexChanged += new System.EventHandler(this.VarTypeComboBoxSelectedIndexChanged);
			// 
			// varNameTextBox
			// 
			this.varNameTextBox.Location = new System.Drawing.Point(48, 120);
			this.varNameTextBox.Name = "varNameTextBox";
			this.varNameTextBox.Size = new System.Drawing.Size(80, 20);
			this.varNameTextBox.TabIndex = 3;
			this.varNameTextBox.TextChanged += new System.EventHandler(this.VarNameTextBoxTextChanged);
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(8, 144);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(40, 23);
			this.label4.TabIndex = 2;
			this.label4.Text = "Type";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(8, 120);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(40, 23);
			this.label3.TabIndex = 1;
			this.label3.Text = "Name";
			// 
			// variablesListBox
			// 
			this.variablesListBox.FormattingEnabled = true;
			this.variablesListBox.Location = new System.Drawing.Point(8, 16);
			this.variablesListBox.Name = "variablesListBox";
			this.variablesListBox.ScrollAlwaysVisible = true;
			this.variablesListBox.Size = new System.Drawing.Size(120, 95);
			this.variablesListBox.TabIndex = 0;
			this.variablesListBox.SelectedIndexChanged += new System.EventHandler(this.VariablesListBoxSelectedIndexChanged);
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(352, 8);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(100, 23);
			this.label5.TabIndex = 4;
			this.label5.Text = "Function Code";
			// 
			// richTextBoxCode
			// 
			this.richTextBoxCode.Location = new System.Drawing.Point(344, 32);
			this.richTextBoxCode.Name = "richTextBoxCode";
			this.richTextBoxCode.Size = new System.Drawing.Size(368, 432);
			this.richTextBoxCode.TabIndex = 5;
			this.richTextBoxCode.Text = "";
			this.richTextBoxCode.WordWrap = false;
			// 
			// ScriptUserControl
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.richTextBoxCode);
			this.Controls.Add(this.label5);
			this.Controls.Add(this.groupBox2);
			this.Controls.Add(this.groupBox1);
			this.Controls.Add(this.groupBox3);
			this.Name = "ScriptUserControl";
			this.Size = new System.Drawing.Size(720, 470);
			this.groupBox1.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
			this.groupBox2.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this.numOfArgs)).EndInit();
			this.groupBox3.ResumeLayout(false);
			this.groupBox3.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this.varSizeBox)).EndInit();
			this.ResumeLayout(false);
		}
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.NumericUpDown varSizeBox;
		private System.Windows.Forms.Label label5;
		private MapEditor.noxscript2.CodeTextBox richTextBoxCode;
		private System.Windows.Forms.Button buttonNewVar;
		private System.Windows.Forms.Button buttonDelVar;
		private System.Windows.Forms.TextBox varNameTextBox;
		private System.Windows.Forms.ComboBox varTypeComboBox;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.ListBox variablesListBox;
		private System.Windows.Forms.GroupBox groupBox3;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.NumericUpDown numOfArgs;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox textBoxFuncName;
		private System.Windows.Forms.CheckBox checkBoxReturn;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.ListBox functionsListBox;
	}
}
