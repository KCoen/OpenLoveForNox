/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 15.11.2014
 */
using System;
using System.IO;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of MoverXfer.
	/// </summary>
	public struct MoverXfer
	{
		// Скорость перемещения обьекта
		public int MovingSpeed;
		// Первый вейпоинт, где начнется перемещение
		public int WaypointID;
		// Обьект, который будет двигаться
		public int MovedObjExtent;
		/*	MoveType
 		 * Переключается в коде игры. На большинстве карт равняется 3, активация происходит через скрипт
		 * Режим 0: Задает перемещение обьекта до WaypointID с указанной MoveSpeed. Включает режим 1
		 * Режим 1: Постоянно перемещать обьект по WaypointID и всем подключенным к нему вейпоинтам
		 * Если по пути встретится выключенный вейпоинт, включается режим 3
		 * Режим 2: Перемещает САМ Mover к подключенному обьекту
		 * Режим 3+: Mover находится в неактивном состоянии, перемещения не происходит
		 */
		public byte MoveType;
		// Эти два поля по идее используются только в сохранениях
		public int WaypointStartID; 
		public int WaypointEndID;
		// Не совсем понятно, зачем эти два поля нужны
		public float MoverAcceleration;
		public float MoverSpeed;
		
		public static MoverXfer FromMapObject(Map.Object obj)
		{
			MoverXfer result = new MoverXfer();
			using (BinaryReader rdr = new BinaryReader(new MemoryStream(obj.modbuf)))
			{
				result.MovingSpeed = rdr.ReadInt32();
				result.WaypointID = rdr.ReadInt32();
				result.MovedObjExtent = rdr.ReadInt32();
				if (obj.ReadRule1 >= 41)
				{
					result.MoveType = rdr.ReadByte();
					result.WaypointStartID = rdr.ReadInt32();
					result.WaypointEndID = rdr.ReadInt32();
				}
				if (obj.ReadRule1 >= 42)
				{
					result.MoverAcceleration = rdr.ReadSingle();
					result.MoverSpeed = rdr.ReadSingle();
				}
			}
			return result;
		}
		
		public void WriteToMapObject(Map.Object obj)
		{
			using (MemoryStream ms = new MemoryStream())
			{
				BinaryWriter bw = new BinaryWriter(ms);
				bw.Write(MovingSpeed);
				bw.Write(WaypointID);
				bw.Write(MovedObjExtent);
				bw.Write(MoveType);
				bw.Write(WaypointStartID);
				bw.Write(WaypointEndID);
				bw.Write(MoverAcceleration);
				bw.Write(MoverSpeed);
				obj.modbuf = ms.ToArray();
				obj.ReadRule1 = 0x3C;
				bw.Close();
			}
		}
	}
}
