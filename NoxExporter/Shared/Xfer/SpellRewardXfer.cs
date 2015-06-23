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
	/// Description of SpellRewardXfer.
	/// </summary>
	public struct SpellRewardXfer
	{
		public string SpellName;
		
		public static SpellRewardXfer FromMapObject(Map.Object obj)
		{
			SpellRewardXfer result = new SpellRewardXfer();
			using (NoxBinaryReader br = new NoxBinaryReader(new MemoryStream(obj.modbuf)))
			{
				result.SpellName = br.ReadString();
			}
			return result;
		}
		
		public void WriteToMapObject(Map.Object obj)
		{
			byte[] result = new byte[SpellName.Length + 1];
			result[0] = (byte) SpellName.Length;
			byte[] str = Encoding.ASCII.GetBytes(SpellName);
			Array.Copy(str, 0, result, 1, str.Length);
			obj.modbuf = result;
			obj.ReadRule1 = 0x3C;
		}
	}
}
