using System;
using System.IO;
using System.Diagnostics;
using System.Collections.Generic;
using System.Drawing;
using System.Reflection;

namespace NoxShared
{
	public class SoundsetDb : NoxDb
	{
		public SoundsetDb()
		{

			dbFile = "soundset.bin";
			using (StreamReader rdr = new StreamReader(CryptApi.DecryptStream(GetStream(), CryptApi.NoxCryptFormat.SOUNDSET)))//using (StreamReader rdr = new StreamReader(GetStream()))//new StreamReader(CryptApi.DecryptStream(, CryptApi.NoxCryptFormat.MODIFIER)))
			{
				//var fileStream = File.Create("soundsettest.txt");
				//System.IO.File.WriteAllText("soundsettest.txt", rdr.ReadToEnd());
				//fileStream.Write();
				
				/*
				while (rdr.BaseStream.Position < rdr.BaseStream.Length)
				{
					string line = rdr.ReadLine().Trim();

					
				}*/
			}
		}
	}
}
