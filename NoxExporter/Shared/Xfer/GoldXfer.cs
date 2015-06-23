/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 10.11.2014
 */
using System;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of GoldXfer.
	/// </summary>
	public struct GoldXfer
	{
		public int Amount;
		
		public GoldXfer(int amount)
		{
			Amount = amount;
		}
		
		public static GoldXfer FromMapObject(Map.Object obj)
		{
			int amount = BitConverter.ToInt32(obj.modbuf, 0);
			return new GoldXfer(amount);
		}
		
		public void WriteToMapObject(Map.Object obj)
		{
			obj.modbuf = BitConverter.GetBytes(Amount);
			obj.ReadRule1 = 0x3C;
		}
	}
}
