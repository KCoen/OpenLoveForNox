/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 28.10.2014
 */
using System;
using System.Drawing;
using System.IO;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of NPCXfer.
	/// </summary>
	public struct NPCXfer
	{
		[ScriptIgnore]
		public MonsterXfer.DirectionEncoded Direction; // направление
		public string DirectionS
		{
			get
			{
				return Direction.ToString();
			}
		}
		public string[] ScriptEvents; // 10
		public ushort DetectEventTimeout; // задержка во фреймах между вызовами скрипта
		public byte ActionRoamPathFlag; // монстр будет следовать только вейпоинтам с этим флагом
		public NoxEnums.MonsterStatus StatusFlags; // статус флаги
		public float HealthMultiplier; // множитель запаса здоровья
		public float RetreatRatio; // коэфф. здоровья при котором кастеры будут убегать
		public float ResumeRatio; // коэфф. здоровья при котором после отступления кастеры будут снова нападать
		public float SightRange; // радиус (дистанция) обзора монстра
		public float Aggressiveness; // агрессивность монстра, от 0.0F до 0.83F
		public int DefaultAction; // что будет делать монстр сразу после загрузки карты
		public string EscortObjName; // что-то связанное с подконтрольными существами (мб игрок?)
		// описываем логику кастования (вызова заклинаний)
		public List<MonsterXfer.SpellEntry> KnownSpells; // список заклинаний которые может кастовать монстр (в общем то тоже флаги)
		public ushort ReactionCastingDelayMin; // ждёт столько фреймов перед Inversion/Counterspell
		public ushort ReactionCastingDelayMax; 
		public ushort BuffCastingDelayMin; // ждёт столько фреймов между между защитными заклинаниями
		public ushort BuffCastingDelayMax;
		public ushort DebuffCastingDelayMin; // ждёт столько фреймов между атакующими заклинаниями
		public ushort DebuffCastingDelayMax;
		public ushort OffensiveCastingDelayMin; // ждёт столько фреймов между вызовом монстров?
		public ushort OffensiveCastingDelayMax;
		public ushort BlinkCastingDelayMin; // ждёт столько фреймов между телепортацией
		public ushort BlinkCastingDelayMax;
		public float LockPathDistance; 
		public byte NPCStrength;
		public float NPCSpeed;
		public int SpellPowerLevel; // от 1 до 3
		public float AimSkillLevel; // от 1.0F до 0F - влияет на точность заклинаний
		public bool Immortal; // делает монстра неубиваемым (точнее ставит ему максхп на 0)
		public string TrapSpell1; // бомберы при взрыве их активируют
		public string TrapSpell2;
		public string TrapSpell3;
		public uint MagicNumber; // 0xDEADFACE
		public uint AddedSubclass;
		public short Health; // текущее здоровье
		public short MaxHealth;
		public Color[] NPCColors;
		public string NPCVoiceSet;
		public MonsterXfer.BuffEntry[] BuffList;
		public float Experience; // сколько опыта дают после убийства NPC
		public byte PoisonLevel; // сила яда, обычно 0 (не отравлен)
		private const string ENCHANT_SHIELD = "ENCHANT_SHIELD";
		
		public static NPCXfer FromStream(Stream mstream, ThingDb.Thing tt, short ParsingRule)
		{
			NPCXfer result = new NPCXfer();
			
			NoxBinaryReader br = new NoxBinaryReader(mstream);
			result.Direction = (MonsterXfer.DirectionEncoded) br.ReadUInt64();
			result.ScriptEvents = new string[10];
			// Читаем имена обработчиков скриптовых событий
			for (int i = 0; i < 10; i++)
			{
				if (i == 2)
					result.DetectEventTimeout = br.ReadUInt16();
				
				result.ScriptEvents[i] = br.ReadScriptEventString();
			}
			// Пропуск (0)
			br.ReadInt32();
			// цвета
			result.NPCColors = new Color[6];
			byte R, G, B;
			for (int i = 0; i < 6; i++)
			{
				R = br.ReadByte();
				G = br.ReadByte();
				B = br.ReadByte();
				result.NPCColors[i] = Color.FromArgb(R, G, B);
			}
			// основной блок инфы
			if (ParsingRule >= 32)
			{
				result.ActionRoamPathFlag = br.ReadByte();
				if (ParsingRule < 49)
					result.StatusFlags = (NoxEnums.MonsterStatus) br.ReadUInt16();
				else
					result.StatusFlags = (NoxEnums.MonsterStatus) br.ReadUInt32();
				
				result.HealthMultiplier = br.ReadSingle();
				result.RetreatRatio = br.ReadSingle();
				result.ResumeRatio = br.ReadSingle();
				result.SightRange = br.ReadSingle();
				result.Health = br.ReadInt16();
				result.Aggressiveness = br.ReadSingle();
				if (ParsingRule < 35)
					result.DefaultAction = br.ReadInt32();
				result.EscortObjName = br.ReadString();
				if (ParsingRule >= 34)
				{
					int spells = br.ReadInt32();
					result.KnownSpells = new List<MonsterXfer.SpellEntry>();
					string spellName = null;
					uint spellFlags = 0;
					
					for (int i = 0; i < spells; i++)
					{
						spellName = br.ReadString();
						spellFlags = br.ReadUInt32();
						if (ThingDb.thingdb.Spells.Keys.Contains(spellName))
							result.KnownSpells.Add(new MonsterXfer.SpellEntry(spellName, spellFlags));
					}
				}
				else
					br.BaseStream.Seek(0x224, SeekOrigin.Current);
				// Задержки между заклинаниями
				if (ParsingRule < 47)
				{
					result.ReactionCastingDelayMin = (ushort) br.ReadByte();
					result.ReactionCastingDelayMax = (ushort) br.ReadByte();
					if (ParsingRule <= 32) br.ReadInt32();
					result.BuffCastingDelayMin = (ushort) br.ReadByte();
					result.BuffCastingDelayMax = (ushort) br.ReadByte();
					if (ParsingRule <= 32) br.ReadInt32();
					result.DebuffCastingDelayMin = (ushort) br.ReadByte();
					result.DebuffCastingDelayMax = (ushort) br.ReadByte();
					if (ParsingRule <= 32) br.ReadInt32();
					result.OffensiveCastingDelayMin = (ushort) br.ReadByte();
					result.OffensiveCastingDelayMax = (ushort) br.ReadByte();
					if (ParsingRule <= 32) br.ReadInt32();
					result.BlinkCastingDelayMin = (ushort) br.ReadByte();
					result.BlinkCastingDelayMax = (ushort) br.ReadByte();
					if (ParsingRule <= 32) br.ReadInt32();
				}
				else
				{
					result.ReactionCastingDelayMin = br.ReadUInt16();
					result.ReactionCastingDelayMax = br.ReadUInt16();
					result.BuffCastingDelayMin = br.ReadUInt16();
					result.BuffCastingDelayMax = br.ReadUInt16();
					result.DebuffCastingDelayMin = br.ReadUInt16();
					result.DebuffCastingDelayMax = br.ReadUInt16();
					result.OffensiveCastingDelayMin = br.ReadUInt16();
					result.OffensiveCastingDelayMax = br.ReadUInt16();
					result.BlinkCastingDelayMin = br.ReadUInt16();
					result.BlinkCastingDelayMax = br.ReadUInt16();
				}
				if (ParsingRule < 34)
					result.MagicNumber = br.ReadUInt32();
				if (ParsingRule >= 33)
					result.LockPathDistance = br.ReadSingle();
				if (ParsingRule >= 34)
				{
					result.SpellPowerLevel = br.ReadInt32();
					result.NPCStrength = br.ReadByte();
					result.NPCSpeed = br.ReadSingle();
					result.AimSkillLevel = br.ReadSingle();
					if (ParsingRule < 42)
					{
						if (br.ReadInt16() == 0)
							result.Immortal = true;
					}
					result.TrapSpell1 = br.ReadString();
					result.TrapSpell2 = br.ReadString();
					result.TrapSpell3 = br.ReadString();
				}
				if (ParsingRule >= 35)
				{
					string action = br.ReadString();
					result.DefaultAction = Array.IndexOf(NoxEnums.AIActionStrings, action);
				}
				if (ParsingRule >= 41)
				{
					// здесь придётся читать просто огромное кол-во инфы
					// однако она используется очень редко, обычно entryType = 4; forced = 0
					short entryType = br.ReadInt16();
					if (entryType <= 4)
					{
						byte forced = 1;
						if (entryType >= 2)
							forced = br.ReadByte();
						if (forced == 1 || entryType < 2)
						{
							return result;
							// TODO для ПОЛНОЙ совместимости, придётся
						}
					}
				}
				if (ParsingRule >= 42)
                    result.Immortal = br.ReadBoolean();
				if (ParsingRule >= 44)
					result.MagicNumber = br.ReadUInt32();
				if (ParsingRule >= 45)
					result.MaxHealth = (short) br.ReadInt32();
				if (ParsingRule >= 46)
					result.AddedSubclass = br.ReadUInt32();
				if (ParsingRule >= 48)
					result.Health = br.ReadInt16();
				if (ParsingRule >= 51)
					result.Experience = br.ReadSingle();
				if (ParsingRule >= 52)
					result.NPCVoiceSet = br.ReadString();
				
				if (ParsingRule < 61) return result;
				// энчанты 
				short buffsType = br.ReadInt16();
				if (buffsType > 2 || buffsType <= 0) return result;
				
				byte count = br.ReadByte();
				result.BuffList = new MonsterXfer.BuffEntry[count];
				while (count > 0)
				{
					MonsterXfer.BuffEntry be = new MonsterXfer.BuffEntry();
					be.Name = br.ReadString();
					be.Power = br.ReadByte();
					be.Duration = br.ReadInt32();
					if (be.Name == ENCHANT_SHIELD && buffsType >= 2)
						be.ShieldHealth = br.ReadInt32();
					
					result.BuffList[count] = be;
					count--;
				}
				Array.Reverse(result.BuffList);
				
				if (ParsingRule >= 62)
					result.PoisonLevel = br.ReadByte();
			}
			return result;
		}
		
		/// <summary>
		/// Собирает данные в структуру из Map.Object
		/// </summary>
		public static NPCXfer FromMapObject(Map.Object obj)
		{
			using (MemoryStream ms = new MemoryStream(obj.modbuf))
			{
				return FromStream(ms, ThingDb.thingdb.Things[obj.Name], obj.ReadRule1);
			}
			throw new ApplicationException("Failed to parse");
		}
		
		/// <summary>
		/// Преобразует структуру обратно в массив байтов, и сохраняет в Map.Object
		/// </summary>
		public void WriteToObjectMod(Map.Object obj)
		{
			MemoryStream memStream = new MemoryStream();
			NoxBinaryWriter bw = new NoxBinaryWriter(memStream, CryptApi.NoxCryptFormat.NONE);
			// Направление
			bw.Write((ulong) Direction);
			// Записываем обработчики
			for (int i = 0; i < 10; i++)
			{
				if (i == 2)
					bw.Write(DetectEventTimeout);
				
				bw.WriteScriptEvent(ScriptEvents[i]);
			}
			bw.Write((int) 0);
			// цвета частей тела
			Color color;
			for (int i = 0; i < 6; i++)
			{
				color = NPCColors[i];
				bw.Write(color.R);
				bw.Write(color.G);
				bw.Write(color.B);
			}
			// основная инфа
			bw.Write(ActionRoamPathFlag);
			bw.Write((uint) StatusFlags);
			bw.Write(HealthMultiplier);
			bw.Write(RetreatRatio);
			bw.Write(ResumeRatio);
			bw.Write(SightRange);
			bw.Write(Health);
			bw.Write(Aggressiveness);
			bw.Write(EscortObjName);
			// Записываем заклинания
			int knownSpellsCount = KnownSpells.Count;
			bw.Write(knownSpellsCount);
			foreach (MonsterXfer.SpellEntry se in KnownSpells)
			{
				bw.Write(se.SpellName);
				bw.Write(se.UseFlags);
			}
			bw.Write(ReactionCastingDelayMin);
			bw.Write(ReactionCastingDelayMax);
			bw.Write(BuffCastingDelayMin);
			bw.Write(BuffCastingDelayMax);
			bw.Write(DebuffCastingDelayMin);
			bw.Write(DebuffCastingDelayMax);
			bw.Write(OffensiveCastingDelayMin);
			bw.Write(OffensiveCastingDelayMax);
			bw.Write(BlinkCastingDelayMin);
			bw.Write(BlinkCastingDelayMax);
			//
			bw.Write(LockPathDistance);
			bw.Write(SpellPowerLevel);
			bw.Write(NPCStrength);
			bw.Write(NPCSpeed);
			bw.Write(AimSkillLevel);
			bw.Write(TrapSpell1);
			bw.Write(TrapSpell2);
			bw.Write(TrapSpell3);
			bw.Write(NoxEnums.AIActionStrings[DefaultAction]);
			// данные ИИ - пропускаем
			bw.Write((short) 4);
			bw.Write((byte) 0);
			// бессмертие
			bw.Write(Immortal);
			// MaxHealth - 4 bytes
			bw.Write(MagicNumber);
			bw.Write((int) MaxHealth);
			bw.Write(AddedSubclass);
			bw.Write(Health);
			bw.Write(Experience);
			bw.Write(NPCVoiceSet);
			// Список бафов
			bw.Write((short) 2);
			byte buffsNum = (byte) BuffList.Length;
			MonsterXfer.BuffEntry buff;
			bw.Write(buffsNum);
			for (int i = 0; i < buffsNum; i++)
			{
				buff = BuffList[i];
				bw.Write(buff.Name);
				bw.Write(buff.Power);
				bw.Write(buff.Duration);
				if (buff.Name == ENCHANT_SHIELD)
					bw.Write(buff.ShieldHealth);
			}
			bw.Write(PoisonLevel);
			// byte array
			byte[] xfer = memStream.ToArray();
			bw.Close();
			obj.modbuf = xfer;
			obj.ReadRule1 = 0x3E;
		}
	}
}
