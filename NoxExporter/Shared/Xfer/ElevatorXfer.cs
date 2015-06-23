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
	/// Description of ElevatorXfer.
	/// </summary>
	public struct ElevatorXfer 
	{
		public int ExtentLink; // 0 = unlinked
		public int Height; // max 64
		public byte Status; // 0 - waiting down, 1 - moving down, 2 - waiting up, 3 - moving up
		
		
		public static ElevatorXfer FromMapObject(Map.Object obj)
		{
			ElevatorXfer result = new ElevatorXfer();
			using (BinaryReader rdr = new BinaryReader(new MemoryStream(obj.modbuf)))
			{
				result.ExtentLink = rdr.ReadInt32();

				if (ThingDb.thingdb.Things[obj.Name].HasClassFlag(ThingDb.Thing.ClassFlags.ELEVATOR))
				{
					if (obj.ReadRule1 >= 0x29)
						result.Height = rdr.ReadInt32();
					if (obj.ReadRule1 >= 0x3D)
						result.Status = rdr.ReadByte();
				}
				
			}
			return result;
		}
		
		/*public void WriteToMapObject(Map.Object obj)
		{
			bool notShaft = ThingDb.Things[obj.Name].HasClassFlag(ThingDb.Thing.ClassFlags.ELEVATOR);
			MemoryStream ms = new MemoryStream();
			BinaryWriter bw = new BinaryWriter(ms);
			bw.Write(ExtentLink);
			if (notShaft)
			{
				bw.Write(Height);
				bw.Write(Status);
			}
			obj.modbuf = ms.ToArray();
			if (notShaft) obj.ReadRule1 = 0x3D;
			else obj.ReadRule1 = 0x3C; // ElevatorShaftXfer
			bw.Close();
		}*/
	}
}
