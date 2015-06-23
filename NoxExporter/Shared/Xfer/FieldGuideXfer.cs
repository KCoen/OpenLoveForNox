/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 10.11.2014
 */
using System;
using System.IO;
using System.Text;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of FieldGuideXfer.
	/// </summary>
	public struct FieldGuideXfer
	{
		public string MonsterSID;
		
		public static FieldGuideXfer FromMapObject(Map.Object obj)
		{
			FieldGuideXfer result = new FieldGuideXfer();
			using (NoxBinaryReader br = new NoxBinaryReader(new MemoryStream(obj.modbuf)))
			{
				result.MonsterSID = br.ReadString();
			}
			return result;
		}
		
		public void WriteToMapObject(Map.Object obj)
		{
			byte[] result = new byte[MonsterSID.Length + 1];
			result[0] = (byte) MonsterSID.Length;
			byte[] str = Encoding.ASCII.GetBytes(MonsterSID);
			Array.Copy(str, 0, result, 1, str.Length);
			obj.modbuf = result;
			obj.ReadRule1 = 0x3C;
		}
	}
}
