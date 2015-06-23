/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - PUBLIC DOMAIN
 * Дата: 02.10.2014
 */
using System;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.Drawing;
using System.Web.Script.Serialization;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Структура содержит данные, хранимые MonsterXFer, в упорядоченной форме.
	/// </summary>
	public struct MonsterXfer
	{
		[ScriptIgnore]
		public DirectionEncoded Direction; // направление
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
		public string EscortObjName; // "скриптовое" имя сопровождаемого монстра 
		// описываем логику кастования (вызова заклинаний)
		public List<SpellEntry> KnownSpells; // список заклинаний которые может кастовать монстр (в общем то тоже флаги)
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
		public int SpellPowerLevel; // от 1 до 3
		public float AimSkillLevel; // от 1.0F до 0F - влияет на точность заклинаний
		public bool Immortal; // делает монстра неубиваемым (точнее ставит ему максхп на 0)
		public string TrapSpell1; // бомберы при взрыве их активируют
		public string TrapSpell2;
		public string TrapSpell3;
		public ShopkeeperInfoStruct ShopkeeperInfo; // торговцы
		public uint MagicNumber; // 0xDEADFACE
		public uint AddedSubclass;
		public short Health; // вроде как здоровье
		public bool SetDefaultResumeRatio; 
		public bool SetDefaultRetreatRatio;
        public bool SetDefaultMonsterStatus;
		public bool LearnDefaultSpells; // если true монстр получает стандартные заклинания и spellpower
		public Color[] MaidenBodyColors;
		public string MaidenVoiceSet;
		public string WoundedNPCVoiceSet;
		public BuffEntry[] BuffList;
		public byte PoisonLevel; // сила яда, обычно 0 (не отравлен)
		private const string ENCHANT_SHIELD = "ENCHANT_SHIELD";
		
		public enum DirectionEncoded : ulong
        {
        	South = (ulong)(0x0000000100000000),
        	North = (ulong)(0xFFFFFFFF00000000),
        	East =  (ulong)(0x0000000000000001),
        	West =  (ulong)(0x00000000FFFFFFFF),
        	SouthWest = (ulong)(0x00000001FFFFFFFF),
        	NorthWest = (ulong)(0xFFFFFFFFFFFFFFFF),
        	SouthEast = (ulong)(0x0000000100000001),
        	NorthEast = (ulong)(0xFFFFFFFF00000001)
        }
		
		public struct ShopkeeperInfoStruct
		{
			public float BuyValueMultiplier; // 0x6B4
			public float SellValueMultiplier; // 0x6B8
			public string ShopkeeperGreetingText; // 0x694
			public ShopItemInfo[] ShopItems;
		}
		
		public struct ShopItemInfo
		{
			public string Name;
			public byte Count;
			public string SpellID;
			public string Ench1;
			public string Ench2;
			public string Ench3;
			public string Ench4;
			
			public override string ToString()
			{
				return string.Format("x{0} {1}", Count, Name);
			}
		}
		
		public struct BuffEntry
		{
			public string Name;
			public byte Power;
			public int Duration;
			public int ShieldHealth; // only for ENCHANT_SHIELD (0x1A)
		}
		
		public struct SpellEntry
		{
			public string SpellName;
			public uint UseFlags;
			public NoxEnums.NPCSpellCastFlags UseFlagsEnum
			{
				get
				{
					return (NoxEnums.NPCSpellCastFlags) UseFlags;
				}
			}
			
			public SpellEntry(string name, uint flags)
			{
				SpellName = name; UseFlags = flags;
			}
			
			public override string ToString()
			{
				if (ThingDb.thingdb.Spells.ContainsKey(SpellName))
				{
					ThingDb.Spell spell = ThingDb.thingdb.Spells[SpellName];
					string result = spell.NameString;
					int e = result.IndexOf(':') + 1;
					result = result.Remove(0, e);
					return result;
				}
				return base.ToString();
			}
		}

		private NoxEnums.MonsterStatus GetFlagsFromString(string str)
		{
			NoxEnums.MonsterStatus result = (NoxEnums.MonsterStatus) 0;
			// смотрим что в строке
			string[] statusflags = str.Split('+');
			foreach (string s in statusflags)
			{
				switch (s)
				{
					case "DESTROY_WHEN_DEAD":
						result |= NoxEnums.MonsterStatus.DESTROY_WHEN_DEAD;
						break;
					case "CAN_BLOCK":
						result |= NoxEnums.MonsterStatus.CAN_BLOCK;
						break;
					case "CAN_DODGE":
						result |= NoxEnums.MonsterStatus.CAN_DODGE;
						break;
					case "CAN_CAST_SPELLS":
						result |= NoxEnums.MonsterStatus.CAN_CAST_SPELLS;
						break;
					case "NEVER_RUN":
						result |= NoxEnums.MonsterStatus.NEVER_RUN;
						break;
				}
			}
			return result;
		}
		
		/// <summary>
		/// Возвращает стандартный Xfer для указанного монстра
		/// </summary>
		public MonsterXfer(string monsterID)
		{
			
			ThingDb.Thing tt = ThingDb.thingdb.Things[monsterID];
			bool isShopkeeper = tt.Subclass[(int) ThingDb.Thing.SubclassBitIndex.SHOPKEEPER];
			bool isFemaleNPC = tt.Subclass[(int) ThingDb.Thing.SubclassBitIndex.FEMALE_NPC];
			bool isWoundNPC = tt.Subclass[(int) ThingDb.Thing.SubclassBitIndex.WOUNDED_NPC];
			bool isFriendly = isShopkeeper || isFemaleNPC || isWoundNPC || (tt.Name == "AirshipCaptain");
			
			Direction = DirectionEncoded.South;
			ScriptEvents = new string[10];
			for (int i = 0; i < 10; i++) ScriptEvents[i] = "";
			DetectEventTimeout = 1;
			ActionRoamPathFlag = 0xFF;
			StatusFlags = (NoxEnums.MonsterStatus) 0;
			HealthMultiplier = 1F;
			RetreatRatio = 0.05F;
			ResumeRatio = 0.5F;
			SightRange = 300F;
			Aggressiveness = 0F;
			if (!isFriendly) Aggressiveness = 0.83F;
			DefaultAction = 0;
			EscortObjName = "";
			KnownSpells = new List<MonsterXfer.SpellEntry>();
			ReactionCastingDelayMin = 15;
			ReactionCastingDelayMax = 30;
			BuffCastingDelayMin = 120;
			BuffCastingDelayMax = 180;
			DebuffCastingDelayMin = 45;
			DebuffCastingDelayMax = 60;
			OffensiveCastingDelayMin = 30;
			OffensiveCastingDelayMax = 60;
			BlinkCastingDelayMin = 150;
			BlinkCastingDelayMax = 300;
			LockPathDistance = 30F;
			SpellPowerLevel = 3;
			AimSkillLevel = 0.5F;
			Immortal = false;
			TrapSpell1 = "SPELL_INVALID";
			TrapSpell2 = "SPELL_INVALID";
			TrapSpell3 = "SPELL_INVALID";
			ShopkeeperInfo = new MonsterXfer.ShopkeeperInfoStruct();
			if (isShopkeeper)
			{
				ShopkeeperInfo.ShopkeeperGreetingText = "";
				ShopkeeperInfo.ShopItems = new MonsterXfer.ShopItemInfo[0];
			}
			MagicNumber = 0xDEADFACE;
			AddedSubclass = 0;
			Health = 1;
			SetDefaultResumeRatio = true;
			SetDefaultRetreatRatio = true;
			SetDefaultMonsterStatus = true;
			LearnDefaultSpells = true;
			MaidenBodyColors = new Color[6];
			MaidenVoiceSet = "Maiden";
			if (isFemaleNPC)
			{
				for (int i = 0; i < 6; i++) MaidenBodyColors[i] = Color.FromArgb(0xD2, 0xAE, 0x79);
			}
			WoundedNPCVoiceSet = monsterID;
			BuffList = new MonsterXfer.BuffEntry[0];
			PoisonLevel = 0;
			if (MonsterDb.MonsterDict.ContainsKey(monsterID))
			{
				MonsterDb.MonsterInfo info = MonsterDb.MonsterDict[monsterID];
				StatusFlags = GetFlagsFromString(info.Status);
				Health = (short) info.Health;
				RetreatRatio = info.RetreatRatio;
				ResumeRatio = info.ResumeRatio;
			}
		}
		
		public static MonsterXfer FromStream(Stream mstream, ThingDb.Thing tt, short ParsingRule)
		{
			MonsterXfer result = new MonsterXfer();
			
			NoxBinaryReader br = new NoxBinaryReader(mstream);
			result.Direction = (DirectionEncoded) br.ReadUInt64();
			result.ScriptEvents = new string[10];
			// Читаем имена обработчиков скриптовых событий
			for (int i = 0; i < 10; i++)
			{
				if (i == 2)
					result.DetectEventTimeout = br.ReadUInt16();
				
				result.ScriptEvents[i] = br.ReadScriptEventString();
			}
			// Пропуск (0)
			if (ParsingRule >= 11)
				br.ReadInt32();
			if (ParsingRule >= 31)
			{
				result.ActionRoamPathFlag = br.ReadByte();
				if (ParsingRule < 51)
					result.StatusFlags = (NoxEnums.MonsterStatus) br.ReadUInt16();
				else
					result.StatusFlags = (NoxEnums.MonsterStatus) br.ReadUInt32();
				
				result.HealthMultiplier = br.ReadSingle();
				result.RetreatRatio = br.ReadSingle();
				result.ResumeRatio = br.ReadSingle();
				result.SightRange = br.ReadSingle();
				if (ParsingRule < 33)
					br.BaseStream.Seek(2, SeekOrigin.Current);
				result.Aggressiveness = br.ReadSingle();
				if (ParsingRule < 34)
					result.DefaultAction = br.ReadInt32();
				result.EscortObjName = br.ReadString();
				if (ParsingRule >= 34)
				{
					int spells = br.ReadInt32();
					result.KnownSpells = new List<SpellEntry>();
					string spellName = null;
					uint spellFlags = 0;
					
					for (int i = 0; i < spells; i++)
					{
						spellName = br.ReadString();
						spellFlags = br.ReadUInt32();
						if (ThingDb.thingdb.Spells.Keys.Contains(spellName))
							result.KnownSpells.Add(new SpellEntry(spellName, spellFlags));
					}
				}
				else
					br.BaseStream.Seek(0x224, SeekOrigin.Current);
				// Задержки между заклинаниями
				if (ParsingRule < 46)
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
				if (ParsingRule > 32)
					result.LockPathDistance = br.ReadSingle();

				if (ParsingRule >= 33)
				{
					result.SpellPowerLevel = br.ReadInt32();
					result.AimSkillLevel = br.ReadSingle();
					if (ParsingRule < 42)
					{
						if (br.ReadInt16() == 0)
							result.Immortal = true;
					}
					if (ParsingRule < 53)
					{
						int spellIndex = br.ReadInt32();
						result.TrapSpell1 = ThingDb.thingdb.Spells.Values[spellIndex].Name;
						spellIndex = br.ReadInt32();
						result.TrapSpell2 = ThingDb.thingdb.Spells.Values[spellIndex].Name;
						spellIndex = br.ReadInt32();
						result.TrapSpell3 = ThingDb.thingdb.Spells.Values[spellIndex].Name;
					}
					else
					{
						result.TrapSpell1 = br.ReadString();
						result.TrapSpell2 = br.ReadString();
						result.TrapSpell3 = br.ReadString();
					}
				}
				if (ParsingRule >= 34)
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
				{
                    result.Immortal = br.ReadBoolean();
				}
				if (ParsingRule >= 43 && tt.Subclass[(int) ThingDb.Thing.SubclassBitIndex.SHOPKEEPER])
				{
					// Информация о содержании магазина
					ShopkeeperInfoStruct si = new ShopkeeperInfoStruct();
					if (ParsingRule >= 50)
						si.BuyValueMultiplier = br.ReadSingle();
					if (ParsingRule >= 61)
						si.SellValueMultiplier = br.ReadSingle();
					if (ParsingRule >= 48)
						si.ShopkeeperGreetingText = br.ReadString();
					byte items = br.ReadByte();
					si.ShopItems = new ShopItemInfo[items];
					for (int i = 0; i < items; i++)
					{
						ShopItemInfo item = new ShopItemInfo();
						if (ParsingRule < 50) br.ReadInt32();
						item.Count = br.ReadByte();
						item.Name = br.ReadString();
						if (ParsingRule >= 47)
						{
							item.SpellID = br.ReadString();
							item.Ench1 = br.ReadString();
							item.Ench2 = br.ReadString();
							item.Ench3 = br.ReadString();
							item.Ench4 = br.ReadString();
						}
						si.ShopItems[i] = item;
					}
					result.ShopkeeperInfo = si;
				}
				if (ParsingRule >= 44)
					result.MagicNumber = br.ReadUInt32();
				if (ParsingRule >= 45)
					result.AddedSubclass = br.ReadUInt32();
				if (ParsingRule >= 49)
					result.Health = br.ReadInt16();
				if (ParsingRule >= 51)
				{
					result.SetDefaultResumeRatio = br.ReadBoolean();
					result.SetDefaultRetreatRatio = br.ReadBoolean();
                    result.SetDefaultMonsterStatus = br.ReadBoolean();
					result.LearnDefaultSpells = br.ReadBoolean();
				}
				if (ParsingRule >= 54 && tt.Subclass[(int) ThingDb.Thing.SubclassBitIndex.FEMALE_NPC])
				{
					result.MaidenBodyColors = new Color[6];
					byte R, G, B;
					for (int i = 0; i < 6; i++)
					{
						R = br.ReadByte();
						G = br.ReadByte();
						B = br.ReadByte();
						result.MaidenBodyColors[i] = Color.FromArgb(R, G, B);
					}
					if (ParsingRule >= 55)
						result.MaidenVoiceSet = br.ReadString();
				}
				if (ParsingRule >= 62)
				{
					short entryType = br.ReadInt16();
					if (entryType > 2 || entryType <= 0) return result;
						
					byte count = br.ReadByte();
					result.BuffList = new BuffEntry[count];
					while (count > 0)
					{
						BuffEntry be = new BuffEntry();
						be.Name = br.ReadString();
						be.Power = br.ReadByte();
						be.Duration = br.ReadInt32();
						if (be.Name == ENCHANT_SHIELD && entryType >= 2)
							be.ShieldHealth = br.ReadInt32();
							
						result.BuffList[count] = be;
						count--;
					}
					Array.Reverse(result.BuffList);
				}
				if (ParsingRule >= 63 && tt.Subclass[(int) ThingDb.Thing.SubclassBitIndex.WOUNDED_NPC])
					result.WoundedNPCVoiceSet = br.ReadString();
				if (ParsingRule >= 64)
					result.PoisonLevel = br.ReadByte();
			}
			return result;
		}
		
		/// <summary>
		/// Собирает данные в структуру из Map.Object
		/// </summary>
		public static MonsterXfer FromMapObject(Map.Object obj)
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
			ThingDb.Thing tt = ThingDb.thingdb.Things[obj.Name];
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
			// Основная инфа
			bw.Write(ActionRoamPathFlag);
			bw.Write((uint) StatusFlags);
			bw.Write(HealthMultiplier);
			bw.Write(RetreatRatio);
			bw.Write(ResumeRatio);
			bw.Write(SightRange);
			bw.Write(Aggressiveness);
			bw.Write(EscortObjName);
			// Записываем заклинания
			int knownSpellsCount = KnownSpells.Count;
			bw.Write(knownSpellsCount);
			foreach (SpellEntry se in KnownSpells)
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
			bw.Write(AimSkillLevel);
			bw.Write(TrapSpell1);
			bw.Write(TrapSpell2);
			bw.Write(TrapSpell3);
			bw.Write(NoxEnums.AIActionStrings[DefaultAction]);
			// данные ИИ - пропускаем
			bw.Write((short) 4);
			bw.Write((byte) 0);
			// Бессмертие - в общем то bool
			bw.Write(Immortal);
			// Магазин
			if (tt.Subclass[(int) ThingDb.Thing.SubclassBitIndex.SHOPKEEPER])
			{
				bw.Write(ShopkeeperInfo.BuyValueMultiplier);
				bw.Write(ShopkeeperInfo.SellValueMultiplier);
				bw.Write(ShopkeeperInfo.ShopkeeperGreetingText);
				byte itemsCount = (byte) ShopkeeperInfo.ShopItems.Length;
				ShopItemInfo item;
				bw.Write(itemsCount);
				for (int i = 0; i < itemsCount; i++)
				{
					item = ShopkeeperInfo.ShopItems[i];
					bw.Write(item.Count);
					bw.Write(item.Name);
					bw.Write(item.SpellID);
					bw.Write(item.Ench1);
					bw.Write(item.Ench2);
					bw.Write(item.Ench3);
					bw.Write(item.Ench4);
				}
			}
			//
			bw.Write(MagicNumber);
			bw.Write(AddedSubclass);
			bw.Write(Health);
			bw.Write(SetDefaultResumeRatio);
			bw.Write(SetDefaultRetreatRatio);
			bw.Write(SetDefaultMonsterStatus);
			//
			bw.Write(LearnDefaultSpells);
			if (tt.Subclass[(int) ThingDb.Thing.SubclassBitIndex.FEMALE_NPC])
			{
				Color color;
				for (int i = 0; i < 6; i++)
				{
					color = MaidenBodyColors[i];
					bw.Write(color.R);
					bw.Write(color.G);
					bw.Write(color.B);
				}
				bw.Write(MaidenVoiceSet);
			}
			// Список бафов
			bw.Write((short) 2);
			byte buffsNum = (byte) BuffList.Length;
			BuffEntry buff;
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
			//
			if (tt.Subclass[(int) ThingDb.Thing.SubclassBitIndex.WOUNDED_NPC])
				bw.Write(WoundedNPCVoiceSet);
			bw.Write(PoisonLevel);
			// Теперь нам нужен byte array
			byte[] xfer = memStream.ToArray();
			bw.Close();
			obj.modbuf = xfer;
			obj.ReadRule1 = 0x40;
		}
	}
}
