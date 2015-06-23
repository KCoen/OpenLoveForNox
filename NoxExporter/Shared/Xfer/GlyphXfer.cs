/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 03.11.2014
 */
using System;
using System.IO;
using System.Collections.Generic;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of GlyphXfer.
	/// </summary>
	public struct GlyphXfer
	{
		public byte Angle;
		public float TargX;
		public float TargY;
		public List<string> Spells;
		
		public static GlyphXfer FromStream(Stream stream, short ParsingRule)
		{
			GlyphXfer result = new GlyphXfer();
			NoxBinaryReader br = new NoxBinaryReader(stream);
			
			if (ParsingRule < 41) br.ReadInt32();
			result.Angle = br.ReadByte();
			result.TargX = br.ReadSingle();
			result.TargY = br.ReadSingle();
			byte spells = br.ReadByte();
			while (spells > 0)
			{
				result.Spells.Add(br.ReadString());
				spells--;
			}
			
			return result;
		}
		
		public static GlyphXfer FromMapObject(Map.Object obj)
		{
			using (MemoryStream ms = new MemoryStream(obj.modbuf))
			{
				return FromStream(ms, obj.ReadRule1);
			}
			throw new ApplicationException("Failed to parse");
		}
	}
}
