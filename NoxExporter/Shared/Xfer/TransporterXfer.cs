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
	/// Description of TransporterXfer.
	/// </summary>
	public struct TransporterXfer
	{
		public int ExtentLink; // 0 = unlinked
		
		public static TransporterXfer FromMapObject(Map.Object obj)
		{
			TransporterXfer result = new TransporterXfer();
			using (BinaryReader rdr = new BinaryReader(new MemoryStream(obj.modbuf)))
			{
				result.ExtentLink = rdr.ReadInt32();
			}
			return result;
		}
		
		public void WriteToMapObject(Map.Object obj)
		{
			obj.modbuf = BitConverter.GetBytes(ExtentLink);
			obj.ReadRule1 = 0x3C;
		}
	}
}
