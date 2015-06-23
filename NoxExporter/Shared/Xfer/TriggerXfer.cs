/*
 * MapEditor
 * Пользователь: AngryKirC
 * Copyleft - Public Domain
 * Дата: 06.11.2014
 */
using System;
using System.Drawing;
using System.IO;
using NoxShared;

namespace MapEditor.xfer
{
	/// <summary>
	/// Description of TriggerXfer.
	/// </summary>
	public struct TriggerXfer
	{
		public int SizeX;
		public int SizeY;
		public Color EdgeColor;
		public Color BackColor;
		public int UnkInt1;
		public string ScriptOnPressed;
		public string ScriptOnReleased;
		public string ScriptOnCollided;
		public int AllowedObjClass;
		public int IgnoredObjClass;
		public byte AllowedTeamID; // разрешить ТОЛЬКО этой команде
		public byte IgnoredTeamID; // разрешить ВСЕМ КРОМЕ этой команды
		public byte TriggerState;
		public byte Unk7;
		public int UnkInt2;
		
		public static TriggerXfer FromStream(Stream mstream, short ParsingRule)
		{
			TriggerXfer result = GetDefault();
			NoxBinaryReader br = new NoxBinaryReader(mstream);
			// collisionbox
			result.SizeX = br.ReadInt32();
			result.SizeY = br.ReadInt32();
			if (result.SizeX > 60) result.SizeX = 60;
			if (result.SizeY > 60) result.SizeY = 60;
			// цвета заливки и граней для PressurePlate
			result.EdgeColor = br.ReadColor();
			result.BackColor = br.ReadColor();
			result.UnkInt1 = br.ReadInt32();
			// обработчики событий
			result.ScriptOnPressed = br.ReadScriptEventString();
			result.ScriptOnReleased = br.ReadScriptEventString();
			result.ScriptOnCollided = br.ReadScriptEventString();
			// кто может активировать
			result.AllowedObjClass = br.ReadInt32();
			result.IgnoredObjClass = br.ReadInt32();
			result.AllowedTeamID = br.ReadByte();
			result.IgnoredTeamID = br.ReadByte();
			if (ParsingRule >= 61)
			{
				result.TriggerState = br.ReadByte();
				result.Unk7 = br.ReadByte();
				result.UnkInt2 = br.ReadInt32();
			}
			return result;
		}
		
		public static TriggerXfer GetDefault()
		{
			TriggerXfer result = new TriggerXfer();
			result.ScriptOnPressed = "";
			result.ScriptOnReleased = "";
			result.ScriptOnCollided = "";
			result.SizeX = 1;
			result.SizeY = 1;
			result.EdgeColor = Color.FromArgb(90, 90, 90);
			result.BackColor = Color.FromArgb(10, 10, 10);
			result.AllowedObjClass = 6;
			return result;
		}

		public static TriggerXfer FromMapObject(Map.Object obj)
		{
			using (MemoryStream ms = new MemoryStream(obj.modbuf))
			{
				return FromStream(ms, obj.ReadRule1);
			}
			throw new ApplicationException("Failed to parse");
		}
		
		public void WriteToObjectMod(Map.Object obj)
		{
			MemoryStream ms = new MemoryStream();
			NoxBinaryWriter bw = new NoxBinaryWriter(ms, CryptApi.NoxCryptFormat.NONE);
			
			bw.Write(SizeX);
			bw.Write(SizeY);
			bw.WriteColor(EdgeColor);
			bw.WriteColor(BackColor);
			bw.Write(UnkInt1);
			bw.WriteScriptEvent(ScriptOnPressed);
			bw.WriteScriptEvent(ScriptOnReleased);
			bw.WriteScriptEvent(ScriptOnCollided);
			bw.Write(AllowedObjClass);
			bw.Write(IgnoredObjClass);
			bw.Write(AllowedTeamID);
			bw.Write(IgnoredTeamID);
			bw.Write(TriggerState);
			bw.Write(Unk7);
			bw.Write(UnkInt2);
			bw.Flush();
			
			obj.modbuf = ms.ToArray();
			obj.ReadRule1 = 0x3D;
			bw.Close();
		}
	}
}
