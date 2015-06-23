/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 13.11.2014
 */
using System;
using System.IO;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of DoorXfer.
	/// </summary>
	public struct DoorXfer
	{
		public DOORS_DIR Direction;
		public DOORS_LOCK LockType;
		
		public enum DOORS_DIR : int
		{
			South = 00,
			North = 0x10,
			East = 0x18,
			West = 0x08
		}

		public enum DOORS_LOCK : int
		{
			None = 0,
			Silver = 1,
			Gold = 2,
			Ruby = 3,
			Saphire = 4,
			Mechanism = 5
		}
		
		public static DoorXfer FromMapObject(Map.Object obj)
		{
			DoorXfer result = new DoorXfer();
			using (BinaryReader rdr = new BinaryReader(new MemoryStream(obj.modbuf)))
			{
				rdr.ReadInt32(); // current direction
				result.LockType = (DOORS_LOCK) rdr.ReadInt32();
				result.Direction = (DOORS_DIR) rdr.ReadInt32();
			}
			return result;
		}
		
		public void WriteToMapObject(Map.Object obj)
		{
			MemoryStream ms = new MemoryStream(5);
			BinaryWriter bw = new BinaryWriter(ms);
			bw.Write((int) Direction);
			bw.Write((int) LockType);
			bw.Write((int) Direction);
			obj.modbuf = ms.ToArray();
			obj.ReadRule1 = 0x3C;
			bw.Close();
		}
	}
}
