/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 28.10.2014
 */
using System;
using System.IO;
using System.Text;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of ReadableXfer.
	/// </summary>
	public struct ReadableXfer
	{
		public string Text;
		
		public static ReadableXfer FromMapObject(Map.Object obj)
		{
			ReadableXfer result = new ReadableXfer();
			result.Text = "";
			if (obj.modbuf.Length < 4) return result;
			using (BinaryReader br = new BinaryReader(new MemoryStream(obj.modbuf)))
			{
				int len = br.ReadInt32();
				result.Text = Encoding.ASCII.GetString(br.ReadBytes(len));
			}
			return result;
		}
		
		public void WriteToMapObject(Map.Object obj)
		{
			MemoryStream ms = new MemoryStream();
			BinaryWriter bw = new BinaryWriter(ms);
			if (!Text.EndsWith("\0")) Text += '\0';
			bw.Write((int) Text.Length);
			bw.Write(Encoding.ASCII.GetBytes(Text));
			obj.ReadRule1 = 0x3C;
			obj.modbuf = ms.ToArray();
			bw.Close();
		}
	}
}
