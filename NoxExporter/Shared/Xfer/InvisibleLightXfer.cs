/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 20.11.2014
 */
using System;
using System.IO;
using System.Drawing;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of InvisibleLightXfer.
	/// </summary>
	public struct InvisibleLightXfer
	{
		public int StateMB; // 0x88
		public float LightIntensity;
		public int LightRadius;
		public int UnknownVal; // 0x94
		public Color BaseColor;
		public short Unknown3; // 0xA4
		public short Unknown4; // 0xA6
		public int Unknown5; // 0xA8
		public short Unknown6; // 0xB0
		public Color[] ChangeColors; // [16]
		public byte[] ChangeIntensity; // [16]
		public byte[] ChangeRadius; // [16]
		public short ColorChangeIndex; // 0x102
		public short IntensityChangeIndex; // 0x104
		public short RadiusChangeIndex; // 0x106
		public int ObjExtentID; // 0x108
		public short Unknown13; // 0x10E
		public short Unknown14; // 0x110
		public byte Unknown15; // 0x112
		public int Unknown16; // 0xAC Emits light?
		
		public static InvisibleLightXfer FromMapObject(Map.Object obj)
		{
			InvisibleLightXfer result = new InvisibleLightXfer();
			using (NoxBinaryReader br = new NoxBinaryReader(new MemoryStream(obj.modbuf)))
			{
				result.StateMB = br.ReadInt32(); // 2 normally
				result.LightIntensity = br.ReadSingle();
				result.LightRadius = br.ReadInt32();
				result.UnknownVal = br.ReadInt32(); // unused?
				result.BaseColor = br.ReadColor(); // ChangeColors is used normally
				result.Unknown3 = br.ReadInt16(); // Color Flags?
				result.Unknown4 = br.ReadInt16();
				result.Unknown5 = br.ReadInt32(); // Flags2?
				result.Unknown6 = br.ReadInt16(); // Some flag
				result.ChangeColors = new Color[16];
				for (int i = 0; i < 16; i++) result.ChangeColors[i] = br.ReadColor();
				result.ChangeIntensity = new byte[16];
				for (int i = 0; i < 16; i++) result.ChangeIntensity[i] = br.ReadByte();
				result.ChangeRadius = new byte[16];
				for (int i = 0; i < 16; i++) result.ChangeRadius[i] = br.ReadByte();
				result.ColorChangeIndex = br.ReadInt16();
				result.IntensityChangeIndex = br.ReadInt16();
				result.RadiusChangeIndex = br.ReadInt16(); 
				result.ObjExtentID = br.ReadInt32();
				result.Unknown13 = br.ReadInt16(); // some flags
				result.Unknown14 = br.ReadInt16();
				result.Unknown15 = br.ReadByte();
				if (obj.ReadRule1 > 40)
				{
					if (obj.ReadRule1 < 42) br.ReadByte();
					else result.Unknown16 = br.ReadInt32(); // unused?
				}
			}
			return result;
		}
	}
}
