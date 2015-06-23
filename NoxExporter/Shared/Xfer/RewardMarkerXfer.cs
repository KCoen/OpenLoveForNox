/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 28.10.2014
 */
using System;
using System.Collections.Generic;
using System.IO;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of RewardMarkerXfer.
	/// </summary>
	public struct RewardMarkerXfer
	{
		public RewardFlags RewardType;
		public int Unknown1;
		// short count; byte prefixed strings
		public List<string> Spells; 
		public List<string> Abilities; // AbilityBook
		public List<string> Monsters; // FieldGuide
		// 5 unknown integers
		public int Unknown2;
		public int Unknown3;
		public int Unknown4;
		public int Unknown5;
		public int Unknown6;
		// chance switch table
		// 1: 25% 2: 50% 3: 75% 4: 95% else: 100%
		public int ActivateChance;
		public bool RareOrSpecial;
		
		[Flags]
		public enum RewardFlags : uint
		{
			SPELL_BOOK = 1,
			ABILITY_BOOK = 2,
			FIELD_GUIDE = 4,
			WEAPON = 8,
			ARMOR = 0x10,
			GEM = 0x20,
			POTION = 0x40,
			GEM2 = 0x80
		}
		
		public static RewardMarkerXfer FromStream(Stream stream, short ParsingRule)
		{
			RewardMarkerXfer result = new RewardMarkerXfer();
			NoxBinaryReader br = new NoxBinaryReader(stream);
			
			result.RewardType = (RewardFlags) br.ReadUInt32();
			result.Unknown1 = br.ReadInt32();
			// spells
			short count = br.ReadInt16();
			result.Spells = new List<string>(count);
			while (count > 0)
			{
				result.Spells.Add(br.ReadString());
				count--;
			}
			// abilities
			count = br.ReadInt16();
			result.Abilities = new List<string>(count);
			while (count > 0)
			{
				result.Abilities.Add(br.ReadString());
				count--;
			}
			// monster scrolls
			count = br.ReadInt16();
			result.Monsters = new List<string>(count);
			while (count > 0)
			{
				result.Monsters.Add(br.ReadString());
				count--;
			}
			result.Unknown2 = br.ReadInt32();
			result.Unknown3 = br.ReadInt32();
			result.Unknown4 = br.ReadInt32();
			result.Unknown5 = br.ReadInt32();
			result.Unknown6 = br.ReadInt32();
			if (ParsingRule >= 62)
				result.ActivateChance = br.ReadInt32();
			if (ParsingRule >= 63)
				result.RareOrSpecial = br.ReadBoolean();
			
			return result;
		}
		
		public static RewardMarkerXfer FromMapObject(Map.Object obj)
		{
			using (MemoryStream ms = new MemoryStream(obj.modbuf))
			{
				return FromStream(ms, obj.ReadRule1);
			}
			throw new ApplicationException("Failed to parse");
		}
		
		public void WriteToMapObject(Map.Object obj)
		{
			MemoryStream ms = new MemoryStream();
			NoxBinaryWriter bw = new NoxBinaryWriter(ms, CryptApi.NoxCryptFormat.NONE);
			
			bw.Write((uint) RewardType);
			bw.Write(Unknown1);
			bw.Write((short) Spells.Count);
			foreach (string spell in Spells)
				bw.Write(spell);
			bw.Write((short) Abilities.Count);
			foreach (string ability in Abilities)
				bw.Write(ability);
			bw.Write((short) Monsters.Count);
			foreach (string scroll in Monsters)
				bw.Write(scroll);
			bw.Write(Unknown2);
			bw.Write(Unknown3);
			bw.Write(Unknown4);
			bw.Write(Unknown5);
			bw.Write(Unknown6);
			bw.Write(ActivateChance);
			bw.Write(RareOrSpecial);
			
			obj.ReadRule1 = 0x3F;
			obj.modbuf = ms.ToArray();
			bw.Close();
		}
	}
}
