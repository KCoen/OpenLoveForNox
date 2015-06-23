/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 05.11.2014
 */
using System;
using System.IO;
using System.Text;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of HoleXfer.
	/// </summary>
	public struct HoleXfer
	{
		public string UnknownScriptHandler;
		public int FallX;
		public int FallY;
		public int ScriptTime1;
		public short ScriptTimeout;
		public int ScriptActivated;
	
		public static HoleXfer FromStream(Stream mstream, short ParsingRule)
		{
			HoleXfer result = new HoleXfer();
			NoxBinaryReader br = new NoxBinaryReader(mstream);
			
			if (ParsingRule < 42) throw new NotSupportedException("Where did you find this map?");
			result.ScriptActivated = br.ReadInt32();
			// какой-то скриптовый обработчик
			result.UnknownScriptHandler = br.ReadScriptEventString();
			// координаты места падения
			result.FallX = br.ReadInt32();
			result.FallY = br.ReadInt32();
			// таймаут вызова скрипта
			result.ScriptTime1 = br.ReadInt32();
			result.ScriptTimeout = br.ReadInt16();
			return result;
		}
		
		public static HoleXfer FromMapObject(Map.Object obj)
		{
			using (MemoryStream ms = new MemoryStream(obj.modbuf))
			{
				return FromStream(ms, obj.ReadRule1);
			}
			throw new ApplicationException("Failed to parse");
		}
		
		public void WriteToMapObject(Map.Object obj)
		{
			using (MemoryStream ms = new MemoryStream())
			{
				NoxBinaryWriter bw = new NoxBinaryWriter(ms, CryptApi.NoxCryptFormat.NONE);
				bw.Write(ScriptActivated);
				// script event
				bw.Write((short) 1);
				bw.Write(UnknownScriptHandler.Length);
				bw.Write(Encoding.ASCII.GetBytes(UnknownScriptHandler));
				bw.Write((int) 0);
				// coordinates
				bw.Write(FallX);
				bw.Write(FallY);
				// script delay
				bw.Write(ScriptTime1);
				bw.Write(ScriptTimeout);
				bw.Flush();
				obj.modbuf = ms.ToArray();
				obj.ReadRule1 = 0x3C;
			}
		}
	}
}
