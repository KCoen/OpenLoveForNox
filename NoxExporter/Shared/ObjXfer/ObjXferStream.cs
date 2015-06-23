/*
 * NoxShared
 * Пользователь: AngryKirC
 * Дата: 19.04.2015
 */
using System;
using System.IO;
using System.Text;

namespace NoxShared.ObjXfer
{
	/// <summary>
	/// Description of ObjXferStream.
	/// </summary>
	public class ObjXferStream
	{
		protected Stream parent;
		public Stream BaseStream
		{
			get
			{
				return parent;
			}
		}
		
		public ObjXferStream(Stream baseStream)
		{
			parent = baseStream;
		}
		
		public void ReadWriteByte(bool write, ref byte val)
		{
			if (write)
				parent.WriteByte(val);
			else
			{
				byte[] tmp = new byte[1];
				parent.Read(tmp, 0, 1);
				val = tmp[0];
			}
		}
		
		public void ReadWriteInt32(bool write, ref int val)
		{
			byte[] tmp;
			if (write)
			{
				tmp = BitConverter.GetBytes(val);
				parent.Write(tmp, 0, 4);
			}
			else
			{
				tmp = new byte[4];
				parent.Read(tmp, 0, 4);
				val = BitConverter.ToInt32(tmp, 0);
			}
		}
			
		public void ReadWriteUInt32(bool write, ref uint val)
		{
			byte[] tmp;
			if (write)
			{
				tmp = BitConverter.GetBytes(val);
				parent.Write(tmp, 0, 4);
			}
			else
			{
				tmp = new byte[4];
				parent.Read(tmp, 0, 4);
				val = BitConverter.ToUInt32(tmp, 0);
			}
		}
		
		public void ReadWriteUInt64(bool write, ref ulong val)
		{
			byte[] tmp;
			if (write)
			{
				tmp = BitConverter.GetBytes(val);
				parent.Write(tmp, 0, 8);
			}
			else
			{
				tmp = new byte[8];
				parent.Read(tmp, 0, 8);
				val = BitConverter.ToUInt64(tmp, 0);
			}
		}
		
		public void ReadWriteInt16(bool write, ref short val)
		{
			byte[] tmp;
			if (write)
			{
				tmp = BitConverter.GetBytes(val);
				parent.Write(tmp, 0, 2);
			}
			else
			{
				tmp = new byte[2];
				parent.Read(tmp, 0, 2);
				val = BitConverter.ToInt16(tmp, 0);
			}
		}
			
		public void ReadWriteUInt16(bool write, ref ushort val)
		{
			byte[] tmp;
			if (write)
			{
				tmp = BitConverter.GetBytes(val);
				parent.Write(tmp, 0, 2);
			}
			else
			{
				tmp = new byte[2];
				parent.Read(tmp, 0, 2);
				val = BitConverter.ToUInt16(tmp, 0);
			}
		}
		
		public void ReadWriteSingle(bool write, ref float val)
		{
			byte[] tmp;
			if (write)
			{
				tmp = BitConverter.GetBytes(val);
				parent.Write(tmp, 0, 4);
			}
			else
			{
				tmp = new byte[4];
				parent.Read(tmp, 0, 4);
				val = BitConverter.ToSingle(tmp, 0);
			}
		}
		
		public int SkipToNextBoundary()
		{
			int skip = (int) (8 - BaseStream.Position % 8) % 8;
			parent.Seek(skip, SeekOrigin.Current);
			return skip;
		}
		
		public void ReadWriteStringByteP(bool write, ref string val)
		{
			byte len;
			byte[] tmp;
			if (write)
			{
				len = (byte) val.Length;
				parent.WriteByte(len);
				tmp = Encoding.ASCII.GetBytes(val);
				parent.Write(tmp, 0, len);
			}
			else
			{
				tmp = new byte[parent.ReadByte()];
				parent.Read(tmp, 0, tmp.Length);
				val = Encoding.ASCII.GetString(tmp);
			}
		}
		
		public void ReadWriteScriptString(bool write, ref string val)
		{
			byte[] tmp;
			if (write)
			{
				// (short) 1
				parent.WriteByte(0);
				parent.WriteByte(1);
				tmp = Encoding.ASCII.GetBytes(val);
				// (int)
				int len = tmp.Length;
				ReadWriteInt32(true, ref len);
				// (byte[])
				parent.Write(tmp, 0, tmp.Length);
				tmp = new byte[4];
				// (int)
				parent.Write(tmp, 0, 4);
			}
			else
			{
				short sval = 0;
				ReadWriteInt16(false, ref sval);
				if (sval <= 1)
				{
					int len = 0;
					ReadWriteInt32(false, ref len);
					tmp = new byte[len];
					parent.Read(tmp, 0, len);
					val = Encoding.ASCII.GetString(tmp);
				}
				tmp = new byte[4];
				parent.Read(tmp, 0, 4);
			}
		}
	}
}
