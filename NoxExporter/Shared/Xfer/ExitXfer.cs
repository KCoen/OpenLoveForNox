/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 03.11.2014
 */
using System;
using System.IO;
using System.Text;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of ExitXfer.
	/// </summary>
	public struct ExitXfer
	{
		public string MapName;
		public float ExitX;
		public float ExitY;
		
		public static ExitXfer FromMapObject(Map.Object obj)
		{
			using (MemoryStream ms = new MemoryStream(obj.modbuf))
			{
				return FromStream(ms, obj.ReadRule1);
			}
			throw new ApplicationException("Failed to parse");
		}
		
		public static ExitXfer FromStream(Stream stream, short ParsingRule)
		{
			ExitXfer result = new ExitXfer();
			BinaryReader br = new BinaryReader(stream);
			
			int nameLen = br.ReadInt32();
			result.MapName = Encoding.ASCII.GetString(br.ReadBytes(nameLen));
			result.MapName.TrimEnd('\0');
			if (ParsingRule >= 31)
			{
				result.ExitX = br.ReadSingle();
				result.ExitY = br.ReadSingle();
			}
			return result;
		}
		
		public void WriteToObjectMod(Map.Object obj)
		{
			MemoryStream ms = new MemoryStream();
			NoxBinaryWriter bw = new NoxBinaryWriter(ms, CryptApi.NoxCryptFormat.NONE);
			
			bw.Write(MapName.Length + 1);
			bw.Write(Encoding.ASCII.GetBytes(MapName));
			bw.Write((byte) 0); // null terminator
			bw.Write(ExitX);
			bw.Write(ExitY);
			
			obj.modbuf = ms.ToArray();
			obj.ReadRule1 = 0x3C;
			bw.Close();
		}
	}
}
