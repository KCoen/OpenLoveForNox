/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 27.10.2014
 */
using System;
using System.IO;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of ObeliskXfer.
	/// </summary>
	public struct ObeliskXfer
	{
		public int ManaPool; // 50 normally
		private byte Unused;
		
		public ObeliskXfer(int mana)
		{
			ManaPool = mana;
			Unused = 0;
		}
		
		public static ObeliskXfer FromMapObject(Map.Object obj)
		{
			ObeliskXfer result = new ObeliskXfer();
			using (BinaryReader rdr = new BinaryReader(new MemoryStream(obj.modbuf)))
			{
				result.ManaPool = rdr.ReadInt32();
				result.Unused = rdr.ReadByte();
			}
			return result;
		}
		
		public void WriteToMapObject(Map.Object obj)
		{
			MemoryStream ms = new MemoryStream(5);
			BinaryWriter bw = new BinaryWriter(ms);
			bw.Write(ManaPool);
			bw.Write(Unused);
			obj.modbuf = ms.ToArray();
			obj.ReadRule1 = 0x3D;
			bw.Close();
		}
	}
}
