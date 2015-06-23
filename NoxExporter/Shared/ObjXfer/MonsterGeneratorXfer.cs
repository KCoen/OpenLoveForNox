/*
 * NoxShared
 * Пользователь: AngryKirC
 * Дата: 19.04.2015
 */
using System;
using System.IO;
using System.Collections.Generic;

namespace NoxShared.ObjXfer
{
	/// <summary>
	/// Description of MonsterGeneratorXfer.
	/// </summary>
	public class MonsterGeneratorXfer
	{
		public byte[] MonsterSpawnRate; // 0 - 4 for each monster
		public byte[] MonsterSpawnLimit;
		public string[] MonsterNames;
		public byte[][] MonsterData;
		// максимальное число зверушек кажись 3
		
		public byte SpawnedMonsters;
		public byte SavedSpawnLimit; // реальное значение берется из MonsterSpawnLimit
		public uint LastSpawnFrame;
		public int GenerationFlags;
		
		public string ScriptOnDamage;
		public string ScriptOnDestroy;
		public string ScriptOnCollide;
		public string ScriptOnSpawn;
		
		public MonsterGeneratorXfer()
		{
			MonsterSpawnRate = new byte[] { 1, 1, 1 };
			MonsterSpawnLimit = new byte[] { 1, 1, 1 };
			MonsterData = new byte[3][];
			MonsterNames = new string[] { null, null, null };
		}
		
		public static MonsterGeneratorXfer FromStream(Stream mstream, short ParsingRule)
		{
			MonsterGeneratorXfer result = new MonsterGeneratorXfer();
			
			NoxBinaryReader br = new NoxBinaryReader(mstream);
			// частота появления монстров
			int spawnRateNum = (int) br.ReadByte();
			result.MonsterSpawnRate = new byte[spawnRateNum];
			for (int i = 0; i < spawnRateNum; i++)
				result.MonsterSpawnRate[i] = br.ReadByte();
			// число уже созданных монстров
			result.SpawnedMonsters = br.ReadByte();
			// заменяется при загрузке на MonsterSpawnLimit
			result.SavedSpawnLimit = br.ReadByte();
			// должно быть 0 если карта не была сохранена игрой
			result.LastSpawnFrame = br.ReadUInt32();
			// скриптовые обработчики
			result.ScriptOnDamage = br.ReadScriptEventString();
			result.ScriptOnDestroy = br.ReadScriptEventString();
			result.ScriptOnCollide = br.ReadScriptEventString();
			result.ScriptOnSpawn = br.ReadScriptEventString();
			// монстры
			int monsters = (int) br.ReadByte();
			byte spawnLimitNum = 0;
			List<string> monsterNames = new List<string>(monsters);
			result.MonsterData = new byte[monsters][];
			for (int i = 0; i < monsters; i++)
			{
				// именно так
				if (!br.ReadBoolean())
				{
					monsterNames.Add(null);
					continue;
				}
				string monsterName = br.ReadString();
				short unknown = br.ReadInt16(); // увеличивается для следующего монстра
				// SkipToNextQword
				br.SkipToNextBoundary();
				long entryLenMB = br.ReadInt64();
				result.MonsterData[i] = br.ReadBytes((int) entryLenMB);
				/* 
  					MonsterData - типичная инфа об обьекте
				short parsingRule1 = br.ReadInt16();
				short parsingRule2 = br.ReadInt16();
				br.ReadInt32(); // extent
				br.ReadInt32(); // globalID
				br.ReadSingle(); // X
				br.ReadSingle(); // Y
				byte term = br.ReadByte();
				result.MonsterData[i] = MonsterXfer.FromStream(br.BaseStream, ThingDb.Things[monsterName], parsingRule1);
				*/
				monsterNames.Add(monsterName);
			}
			spawnLimitNum = br.ReadByte();
			result.MonsterNames = monsterNames.ToArray();
			// максимальное число создаваемых монстров, берется из gamedata.bin
			result.MonsterSpawnLimit = new byte[spawnLimitNum];
			for (int i = 0; i < spawnLimitNum; i++)
				result.MonsterSpawnLimit[i] = br.ReadByte();
			// настройки спавна: 0 - отключен, 1 - рандом позиция, 2 - зависит от игрока
			if (ParsingRule >= 63)
				result.GenerationFlags = br.ReadInt32();
			return result;
		}
		
		public void WriteToStream(Stream baseStream, short ParsingRule)
		{
			NoxBinaryWriter bw = new NoxBinaryWriter(baseStream, CryptApi.NoxCryptFormat.NONE);
			
			bw.Write((byte) MonsterSpawnRate.Length);
			bw.Write(MonsterSpawnRate);
			bw.Write(SpawnedMonsters);
			bw.Write(SavedSpawnLimit);
			bw.Write(LastSpawnFrame);
			bw.WriteScriptEvent(ScriptOnDamage);
			bw.WriteScriptEvent(ScriptOnDestroy);
			bw.WriteScriptEvent(ScriptOnCollide);
			bw.WriteScriptEvent(ScriptOnSpawn);
			bw.Write((byte) MonsterNames.Length);

			for (int i = 0; i < MonsterNames.Length; i++)
			{
				if (MonsterData[i] == null)
				{
					// empty
					bw.Write(false);
					continue;
				}
				bw.Write(true);
				bw.Write(MonsterNames[i]);
				bw.Write((short) i + 1);
				// SkipToNextQword
				bw.SkipToNextBoundary();
				bw.Write(MonsterData[i].LongLength);
				bw.Write(MonsterData[i]);
			}
			
			bw.Write((byte) MonsterSpawnLimit.Length);
			bw.Write(MonsterSpawnLimit);
			if (ParsingRule >= 63)
				bw.Write(GenerationFlags);
		}
	}
}
