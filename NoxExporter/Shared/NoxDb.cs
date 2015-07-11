using System;
using System.IO;
using Microsoft.Win32;
using System.Windows.Forms;

namespace NoxShared
{
	public class NoxDb
	{
		public static string NoxPath;
		protected static string dbFile;//set this before calling GetStream()
		protected static FileStream GetStream() { return File.OpenRead(NoxPath + dbFile); }
		private static RegistryKey installPathKey;
		private const string REGISTRY_PATH = "SOFTWARE\\Westwood\\Nox";
		private static string directorySeparator = Path.DirectorySeparatorChar.ToString();
		
		/// <summary>
		/// Запилено для совместимости
		/// </summary>
		static void FindNoxPath()
		{
			FolderBrowserDialog fbd = new FolderBrowserDialog();
			fbd.Description = "Please select your Nox install directory";
			if (fbd.ShowDialog() == DialogResult.OK)
			{
				string path = Path.GetFullPath(fbd.SelectedPath);
				if (installPathKey == null)
					installPathKey = Registry.LocalMachine.CreateSubKey(REGISTRY_PATH);
				
				installPathKey.SetValue("InstallPath", path);
				NoxPath = path;
			}
			else
			{
				//NoxPath = directorySeparator;
				MessageBox.Show("Failed to find Nox install directory. The program will now exit.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
				Environment.Exit(0);
			}
		}
		
		static NoxDb()
		{
			installPathKey = Registry.LocalMachine.OpenSubKey(REGISTRY_PATH);
			
			if (installPathKey == null) FindNoxPath();
			object val = installPathKey.GetValue("InstallPath");
			if (val == null) FindNoxPath();
			
			NoxPath = (string) val;
			if (Path.HasExtension(NoxPath))
			{
				NoxPath = Path.GetDirectoryName(NoxPath);
			}
			/*int index = NoxPath.LastIndexOf(directorySeparator);
			if (index >= 0 && NoxPath.EndsWith(directorySeparator))
			{
				NoxPath = NoxPath.Substring(0, index);
			}*/
			if (!NoxPath.EndsWith(directorySeparator)) NoxPath += directorySeparator;
		}
	}
}
