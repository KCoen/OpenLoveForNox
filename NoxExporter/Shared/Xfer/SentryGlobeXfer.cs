/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 14.11.2014
 */
using System;
using System.IO;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of SentryGlobeXfer.
	/// </summary>
	public struct SentryGlobeXfer
	{
		public float BasePosRadian;
		public float RotateSpeed;
		public float CurrentPosRadian; // только в сохраненных картах
		
		public static SentryGlobeXfer FromMapObject(Map.Object obj)
		{
			SentryGlobeXfer result = new SentryGlobeXfer();
			using (BinaryReader rdr = new BinaryReader(new MemoryStream(obj.modbuf)))
			{
				result.BasePosRadian = rdr.ReadSingle();
				result.RotateSpeed = rdr.ReadSingle();
				if (obj.ReadRule1 >= 0x3D) result.CurrentPosRadian = rdr.ReadSingle();
			}
			return result;
		}
		
		public void WriteToMapObject(Map.Object obj)
		{
			using (MemoryStream ms = new MemoryStream())
			{
				BinaryWriter bw = new BinaryWriter(ms);
				bw.Write(BasePosRadian);
				bw.Write(RotateSpeed);
				obj.modbuf = ms.ToArray();
				obj.ReadRule1 = 0x3C;
				bw.Close();
			}
		}
	}
}
