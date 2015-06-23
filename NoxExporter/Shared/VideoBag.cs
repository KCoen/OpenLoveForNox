using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Collections.Generic;
//using System.Diagnostics;
using System.Collections;
using System.Drawing;
using System.Drawing.Imaging;
using System.Threading;
using System.Diagnostics;
//using Mapper;
using sspack;

namespace NoxShared
{
	/// <summary>
	/// Summary description for VideoBag.
	/// </summary>
	public class VideoBag : Bag
	{
		protected Header header;
		protected ArrayList sections;


		public static uint[] Palette = {
					0xFF000000, 0xFF101010, 0xFF212121, 0xFF393939, 0xFF4A4A4A, 0xFF525252, 0xFF777777, 0xFF9C9C9C, 0xFFCCCCCC, 0xFFFFFFFF, 0xFF7B7373, 0xFF2D2929, 0xFF5A5252, 0xFF635A5A, 0xFF423939, 0xFF1D1818, 
					0xFF181010, 0xFF291818, 0xFF100808, 0xFFCE6363, 0xFFD66363, 0xFFFF5A5A, 0xFFFF3131, 0xFF080000, 0xFF290000, 0xFF4A0000, 0xFF9C0000, 0xFFDD0000, 0xFFDE0000, 0xFFFB0000, 0xFFD65A52, 0xFF941000, 
					0xFF942918, 0xFF390800, 0xFF731000, 0xFFB51800, 0xFFBD6352, 0xFF421810, 0xFFFFAA99, 0xFF5A1000, 0xFF733929, 0xFFA54A31, 0xFF947B73, 0xFFBD5231, 0xFF522110, 0xFF7B3118, 0xFF2D1810, 0xFF8C4A31, 
					0xFF942900, 0xFFBD3100, 0xFFC67352, 0xFF6B3118, 0xFFC66B42, 0xFFCE4A00, 0xFFA56339, 0xFF5A3118, 0xFF291000, 0xFF140800, 0xFF391800, 0xFF9C7352, 0xFF946B4A, 0xFF734A29, 0xFF523118, 0xFF8C4A18, 
					0xFF884411, 0xFF4A2100, 0xFF211810, 0xFFD6945A, 0xFFC66B21, 0xFFEF6B00, 0xFFFF7700, 0xFFA59484, 0xFF423121, 0xFF291808, 0xFF211000, 0xFFB5A594, 0xFF7B6B5A, 0xFFCEB194, 0xFFA58C73, 0xFF8C735A, 
					0xFFB59473, 0xFFD6A573, 0xFF392918, 0xFF8C6339, 0xFF181008, 0xFF422910, 0xFF6B4218, 0xFF7B4A18, 0xFF944A00, 0xFF8C847B, 0xFF6B635A, 0xFF4A4239, 0xFF292118, 0xFF463929, 0xFFEFA54A, 0xFFEFC68C, 
					0xFF7B6342, 0xFF6B5639, 0xFFBD945A, 0xFF633900, 0xFFD6C6AD, 0xFF524229, 0xFF946318, 0xFFEFD6AD, 0xFFA58C63, 0xFF635A4A, 0xFFBDA57B, 0xFF5A4218, 0xFFBD8C31, 0xFF353129, 0xFF948463, 0xFF7B6B4A, 
					0xFFA58C5A, 0xFF5A4A29, 0xFF9C7B39, 0xFF423110, 0xFFEFAD21, 0xFF181000, 0xFF9C6B00, 0xFF94845A, 0xFF524218, 0xFF6B5A29, 0xFF7B6321, 0xFF9C7B21, 0xFFDEA500, 0xFF5A5239, 0xFF312910, 0xFFCEBD7B, 
					0xFF635A39, 0xFF94844A, 0xFFC6A529, 0xFF292100, 0xFF736B39, 0xFFF7DE39, 0xFFF7EF8C, 0xFFF7E700, 0xFFDEDED6, 0xFFBDBDB5, 0xFF8C8C84, 0xFFF7F7DE, 0xFF6B6B5A, 0xFF292921, 0xFF4A4A39, 0xFF292918, 
					0xFF4A4A29, 0xFF7B7B42, 0xFF9C9C4A, 0xFF5A5A29, 0xFF424214, 0xFF393900, 0xFF5A5A00, 0xFFFFFF00, 0xFF6B7321, 0xFF424A00, 0xFF293100, 0xFF313910, 0xFF313918, 0xFF526318, 0xFF182100, 0xFF5A7329, 
					0xFF314A18, 0xFF183100, 0xFF63844A, 0xFF081800, 0xFF6BBD4A, 0xFF63B54A, 0xFF63BD4A, 0xFF5A9C4A, 0xFF4A8C39, 0xFF63C64A, 0xFF183910, 0xFF082900, 0xFF63D64A, 0xFF52844A, 0xFF317329, 0xFF63C65A, 
					0xFF52BD4A, 0xFF10FF00, 0xFF182918, 0xFF4A884A, 0xFF4AE74A, 0xFF005A00, 0xFF008800, 0xFF009400, 0xFF00DE00, 0xFF00EE00, 0xFF00FB00, 0xFF109C18, 0xFF428C4A, 0xFF318C42, 0xFF109429, 0xFF082910, 
					0xFF184229, 0xFFA5B5AD, 0xFF081810, 0xFF6B7373, 0xFF182929, 0xFF081818, 0xFF18424A, 0xFF63C6DE, 0xFF44DDFF, 0xFF8CD6EF, 0xFF31424A, 0xFF5A8CA5, 0xFF39B5EF, 0xFF4A9CCE, 0xFF3184B5, 0xFF31526B, 
					0xFF007BDE, 0xFF10528C, 0xFF0052A5, 0xFF10396B, 0xFF10294A, 0xFF215AA5, 0xFF10315A, 0xFF104284, 0xFF315284, 0xFF182131, 0xFF000818, 0xFF4A5A7B, 0xFF081839, 0xFF526BA5, 0xFF293963, 0xFF104ADE, 
					0xFF081029, 0xFF4A5A94, 0xFF6373B5, 0xFF7B8CD6, 0xFF6B7BD6, 0xFF7788FF, 0xFFC6C6CE, 0xFF94949C, 0xFF313139, 0xFF9C94C6, 0xFF291884, 0xFF180084, 0xFF52427B, 0xFF635A73, 0xFFCEB5F7, 0xFF4A4252, 
					0xFF8C7B9C, 0xFF7722CC, 0xFFDDAAFF, 0xFFF0B42A, 0xFFDF009F, 0xFFE317B3, 0xFFE72FC7, 0xFFEF4BD7, 0xFFF367E7, 0xFFF787F3, 0xFFFFA7FF, 0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFF00, 0xFFFF00FF };

		public class Header
		{
			public int Type;
			public int FileLength;//this includes the header
			public int SectionCount;
			public int u2;//0x00008000 for video{,8}.bag
			public int u3;//0x00008000 for video8, 0x00007AD5 for video
			public int u4;//25 above total number of entries??
			public bool bits8;

			public Header(Stream stream)
			{
				BinaryReader rdr = new BinaryReader(stream);
				Type = rdr.ReadInt32();
				FileLength = rdr.ReadInt32();
				SectionCount = rdr.ReadInt32();
				u2 = rdr.ReadInt32();
				u3 = rdr.ReadInt32();
				u4 = rdr.ReadInt32();
				bits8 = (u3 == 0x8000);
			}
		}

		public class Section
		{
			public uint SectionLength;//total number of bytes in this section
			public uint SizeUncompressed;
			public uint SizeCompressed;//aka the length of the entry's data
			public int EntryCount;//sometimes -1?

			public ArrayList Entries;

			//this is assigned by whatever constructs this object
			public uint Offset;//the offset of this section in the .bag

			public class SectionEntry
			{
				public string Name;
				public Types type;
				public uint Length;//size of this entry in the uncompressed section
				public int u3;
				public uint Offset; //the offset of this section in the nxz

				public SectionEntry(Stream stream)
				{
					BinaryReader rdr = new BinaryReader(stream);
					Name = new String(rdr.ReadChars(rdr.ReadByte()));
					//Name = System.Text.Encoding.UTF8.GetString(rdr.ReadBytes(rdr.ReadByte()));
					Name = Name.TrimEnd('\0');//dont include the required terminator
					type = (Types)rdr.ReadByte();
					Length = rdr.ReadUInt32();
					u3 = rdr.ReadInt32();
				}

				public byte[] GetBinary(Stream dataStream, bool bits8, uint imgid)
				{
					BinaryReader rdr = new BinaryReader(dataStream);
					byte[] data = null;
					if (bits8 == true)
					{
						switch (type)
						{
							case Types.Type4:
							case Types.Type6:
								{
									data = rdr.ReadBytes(int.MaxValue);
								}
								break;
							default:
								break;
						}
					}
					return data;
				}

				public void StoreBitmapCache(Stream dataStream, bool bits8, uint imgid)
				{
					BinaryReader rdr = new BinaryReader(dataStream);
					if (bits8 == true)
					{
						switch (type)
						{
							case Types.Type3:
							case Types.Type4:
							case Types.Type6:
								{
									int imgwidth = rdr.ReadInt32();
									int imgheight = rdr.ReadInt32();

									if (imgwidth == 0 || imgheight == 0)
										return;

									int offsetX = rdr.ReadInt32();
									int offsetY = rdr.ReadInt32();
									/*if (imgid != 0)
									{
										VideoBagCacheS.Set(offsetX, offsetY, imgid);
									}*/

									byte[] data = rdr.ReadBytes((int)Length);
								}
								break;
						}
					}
				}

				public System.Drawing.Bitmap GetBitmap(Stream dataStream, bool bits8, uint imgid, ref int offsetX, ref int offsetY)
				{
					BinaryReader rdr = new BinaryReader(dataStream);
					int index = 0;
					System.Drawing.Bitmap img;
					byte[] data;
					if (bits8 == true)
					{
						switch (type)
						{
							case Types.Floor:
								{
									data = rdr.ReadBytes((int)Length);
									img = new System.Drawing.Bitmap(46, 46);
									System.Drawing.Imaging.BitmapData bitData = img.LockBits(new System.Drawing.Rectangle(0, 0, 46, 46), System.Drawing.Imaging.ImageLockMode.ReadWrite, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
									IntPtr dataPtr = bitData.Scan0;
									int[] bitmap = new int[46 * 46];
									int i = 1;
									int c = 23;
									for (int row = 0; index < data.Length && row < img.Width; row++)
									{
										for (int col = 0; index < data.Length && col < i; col++)
											bitmap[(col + c) + row * 46] = (int)(VideoBag.Palette[data[index++]]);
										if (row < 22)
										{
											i += 2;
											c--;
										}
										else if (row > 22)
										{
											i -= 2;
											c++;
										}
									}

									System.Runtime.InteropServices.Marshal.Copy(bitmap, 0, dataPtr, 46 * 46);
									img.UnlockBits(bitData);
									return img;
								}
							case Types.Edge:
								{
									img = new System.Drawing.Bitmap(46, 46);
									//System.Drawing.Imaging.BitmapData bitData = img.LockBits(new System.Drawing.Rectangle(0, 0, 46, 46), System.Drawing.Imaging.ImageLockMode.ReadWrite, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
									BitmapData parentBD = img.LockBits(new System.Drawing.Rectangle(0, 0, 46, 46), ImageLockMode.WriteOnly, PixelFormat.Format32bppArgb);
									byte[] parentColorArray = new byte[parentBD.Stride * parentBD.Height];
									//parentBD = img.LockBits(new Rectangle(Point.Empty, resultBitmap.Size), ImageLockMode.WriteOnly, PixelFormat.Format32bppArgb);
									//parentColorArray = new byte[parentBD.Stride * parentBD.Height];

									int TransparentColor = Color.Transparent.ToArgb();
									int SourceReplacer = Color.FromArgb(128, 255, 0, 255).ToArgb();

									int[] edgeColorArray = new int[2116];
									for (int i = 0; i < edgeColorArray.Length; i++)
										edgeColorArray[i] = Color.Transparent.ToArgb();


									//videoPatternLength += videoReadOffset;
									long posTotal = Length + rdr.BaseStream.Position;

									int index2 = 0; int lastcol = 0;
									byte startX = rdr.ReadByte();
									byte endX = rdr.ReadByte();
									byte much;
									// prepare maskdata array
									byte op = 123;

									//UnityEngine.Debug.Log (posTotal.ToString());
									while (op != 0 && rdr.BaseStream.Position < posTotal)
									{
										posTotal++; posTotal--;
										op = rdr.ReadByte();
										switch (op)
										{
											case 1: // Skip pixels
												index2 += rdr.ReadByte();
												break;
											case 2: // Fixed colors
												much = rdr.ReadByte();
												for (int i = 0; i < much; i++)
												{
													lastcol = (int)Palette[rdr.ReadByte()];
													edgeColorArray[index2] = lastcol;
													index2++;
												}
												break;
											case 3: // Copy from source
												byte b1 = rdr.ReadByte(); // #of pixels
												for (int row = 0; row < b1; row++)
												{
													edgeColorArray[index2] = SourceReplacer;//TransparentColor;//coverTileColorArray[index2];
													index2++;
												}
												break;
											case 4: // Unknown
												index2 += rdr.ReadByte();
												break;
											default:
												goto fin;
										}
									}
								fin:
									// copy result
									int it = 1; int c = 23; int xx; int clr;
									//int oldndx = index2;
									index2 = 0;
									for (int row = 0; row <= endX; row++)
									{
										if (row >= startX)
										{
											for (int col = 0; col < it; col++)
											{
												xx = col + c;
												int pxndx = ((row * 46) + xx) * 4;
												if (edgeColorArray[index2] != TransparentColor)
												{
													clr = edgeColorArray[index2];
													parentColorArray[pxndx] = (byte)(clr);
													parentColorArray[pxndx + 1] = (byte)(clr >> 8);
													parentColorArray[pxndx + 2] = (byte)(clr >> 16);
													parentColorArray[pxndx + 3] = (byte)(clr >> 24);
												}

												index2++;
											}
										}
										if (row < 22)
										{
											it += 2;
											c--;
										}
										else if (row > 22)
										{
											it -= 2;
											c++;
										}
									}
									Marshal.Copy(parentColorArray, 0, parentBD.Scan0, parentColorArray.Length);
									img.UnlockBits(parentBD);

									return img;
								}
							case Types.Type3:
							case Types.Type5:
								{
									/*var backup = rdr.BaseStream.Position;
									byte[] bts = rdr.ReadBytes((int)(rdr.BaseStream.Length - rdr.BaseStream.Position));
									System.IO.File.WriteAllBytes(imgid.ToString(), bts);
									rdr.BaseStream.Position = backup;*/
									int imgwidth = rdr.ReadInt32();
									int imgheight = rdr.ReadInt32();

									if (imgwidth == 0 || imgheight == 0)
									{
										imgwidth = 128;
										imgheight = 128;
									}
										//	return null;

									img = new System.Drawing.Bitmap(imgwidth, imgheight, PixelFormat.Format32bppArgb);//new System.Drawing.Bitmap(imgwidth, imgheight +1);

									offsetX = rdr.ReadInt32();
									offsetY = rdr.ReadInt32();
									/*if (imgid != 0)
									{
										VideoBagCacheS.Set(offsetX, offsetY, imgid);
									}*/
									rdr.ReadByte();
									byte varb = 1;
									index = 0;
									int len = 0;
									while (varb != 0 && rdr.BaseStream.Position < rdr.BaseStream.Length)
									{
										varb = rdr.ReadByte();
										switch (varb)
										{
											case 0:
												break;

											case 1:
												index += rdr.ReadByte();
												break;
											case 3:
											case 121:
												len = rdr.ReadByte();
												data = rdr.ReadBytes(len);
												for (int j = 0; j < len; j++)
												{
													img.SetPixel((index) % imgwidth, (index - (index % imgwidth)) / imgwidth, System.Drawing.Color.FromArgb((int)(VideoBag.Palette[data[j]])));
													index++;
												}
												break;
											case 5:
												len = rdr.ReadByte();
												data = rdr.ReadBytes(len * 2);
												for (int j = 0; j < len; j++)
												{
													byte a = (byte)(data[j * 2] & 0x0F);
													byte b = (byte)((data[j * 2] & 0xF0) >> 4);
													byte g = (byte)(data[j * 2 + 1] & 0x0F);
													byte r = (byte)((data[j * 2 + 1] & 0xF0) >> 4);

													

													//var color = System.Drawing.Color.FromArgb((int)(VideoBag.Palette[data[j * 2 + 1]]));
													var color = System.Drawing.Color.FromArgb(a * 16, r * 16, g * 16, b * 16);// System.Drawing.Color.FromArgb(data[j * 2], color.R, color.G, color.B);
													
													img.SetPixel((index) % imgwidth, (index - (index % imgwidth)) / imgwidth, color);
													index++;
												}
												break;
											case 2:
												len = rdr.ReadByte();
												data = rdr.ReadBytes(len);
												for (int j = 0; j < len; j++)
												{
													img.SetPixel((index) % imgwidth, (index - (index % imgwidth)) / imgwidth, System.Drawing.Color.FromArgb((int)(VideoBag.Palette[data[j]])));
													//img.SetPixel((index) % imgwidth, (index - (index % imgwidth)) / imgwidth, new UnityEngine.Color(color_r, color_g, color_b, color_a));
													index++;
												}
												break;
											default:
												{
													throw new NotImplementedException();
												}


											//Debug.WriteLine(String.Format("{0}: {1}", rdr.BaseStream.Position, b));
											//break;
										}
									}
									return img;
								}
							case Types.Type4:
							case Types.Type6:
								{
									
									int imgwidth = rdr.ReadInt32();
									int imgheight = rdr.ReadInt32();

									if (imgwidth == 0 || imgheight == 0)
										return null;

									img = new System.Drawing.Bitmap(imgwidth, imgheight, PixelFormat.Format32bppArgb);//new System.Drawing.Bitmap(imgwidth, imgheight +1);

									offsetX = rdr.ReadInt32();
									offsetY = rdr.ReadInt32();
									/*if (imgid != 0)
									{
										VideoBagCacheS.Set(offsetX, offsetY, imgid);
									}*/
									rdr.ReadByte();
									byte varb = 1;
									index = 0;
									int len = 0;
									while (varb != 0 && rdr.BaseStream.Position < rdr.BaseStream.Length)
									{
										varb = rdr.ReadByte();
										switch (varb)
										{
											case 0:
												break;

											case 1:
												index += rdr.ReadByte();
												break;
											/*case 2:
										case 3:
										case 0:
										case 121:
											len = rdr.ReadByte();
											data = rdr.ReadBytes(len);
											for (int j = 0; j < len; j++)
											{ 

												img.SetPixel((index) % imgwidth, (index - (index % imgwidth)) / imgwidth, System.Drawing.Color.FromArgb((int)(VideoBag.Palette[data[j]])));
												index++;
											}
											break;*/
											case 2:
												{
													len = rdr.ReadByte();
													data = rdr.ReadBytes(len);
													for (int j = 0; j < len; j++)
													{
														img.SetPixel((index) % imgwidth, (index - (index % imgwidth)) / imgwidth, System.Drawing.Color.FromArgb((int)(VideoBag.Palette[data[j]])));
														//img.SetPixel((index) % imgwidth, (index - (index % imgwidth)) / imgwidth, new UnityEngine.Color(color_r, color_g, color_b, color_a));
														index++;
													}
												}
												break;
											case 3:
												break;
											default:
												if ((varb & 4) > 0)
												{
													int pixLength;
													pixLength = rdr.ReadByte();
													byte[] subdata = rdr.ReadBytes(pixLength);
													for (int j = 0; j < pixLength; j++)
													{
														var color = System.Drawing.Color.FromArgb(varb, subdata[j], 0, 0);

														System.Drawing.Color.FromArgb((int)(VideoBag.Palette[subdata[j]]));
														img.SetPixel((index) % imgwidth, (index - (index % imgwidth)) / imgwidth, color);
														index++;
													}
												}
												break;


											//Debug.WriteLine(String.Format("{0}: {1}", rdr.BaseStream.Position, b));
											//break;
										}
									}
									return img;
								}
							default:
								break;
						}
					}
					return null;
				}
				/*
				public bool WriteBitmapTo(Stream dataStream, bool bits8, ref UnityEngine.Texture2D img, Point point)
				{
					
					BinaryReader rdr = new BinaryReader(dataStream);
					byte[] data = rdr.ReadBytes((int)Length);
					int index = 0;
					int x = point.X;
					int y = point.Y;
					if (bits8 == true)
					{
						switch (type)
						{
							case Types.Floor:

								int i = 1;
								int c = 23;
								for (int row = 0; index < data.Length && y + row < img.Height; row++)
								{
									for (int col = 0; index < data.Length && col < i && col + c + x < img.Width; col++)
										img.SetPixel(col + c + x, row + y, System.Drawing.Color.FromArgb((int)(VideoBag.Palette[data[index++]])));
									if (row < 22)
									{
										i += 2;
										c--;
									}
									else if (row > 22)
									{
										i -= 2;
										c++;
									}
								}
								img.Save("c:\\bit.bmp");
								return true;
						}
					}
					return false;
				}*/
				public enum Types : byte
				{
					Floor = 0,
					Edge = 1,
					Type2 = 2,
					Type3 = 3,
					Type4 = 4,
					Type5 = 5,
					Type6 = 6,
					Type7 = 7,
					Type8 = 8
				}
			}

			public Section(Stream stream)
			{
				BinaryReader rdr = new BinaryReader(stream);

				SectionLength = rdr.ReadUInt32();
				SizeUncompressed = rdr.ReadUInt32();
				SizeCompressed = rdr.ReadUInt32();
				EntryCount = rdr.ReadInt32();

				Entries = new ArrayList();

				long startPos = stream.Position;
				uint length = 0, o = 0;
				while (stream.Position < startPos + SectionLength)
				{
					SectionEntry entry = new SectionEntry(stream);
					length += entry.Length;
					entry.Offset = o;
					o += entry.Length;
					Entries.Add(entry);
				}
				Debug.Assert(stream.Position == startPos + SectionLength, "bad section length encountered");
				Debug.Assert(length == SizeUncompressed, "section length mismatch");
			}

			public void BuildVideoBagCache(Stream bagStream, bool bits8, ref int i)
			{
				BinaryReader rdr = new BinaryReader(bagStream);
				rdr.BaseStream.Seek(Offset, SeekOrigin.Begin);
				byte[] nxzData = rdr.ReadBytes((int)SizeCompressed);
				byte[] mapData = new byte[SizeUncompressed];
				if (!NoxShared.CryptApi.NxzDecrypt(nxzData, mapData))
					return;
				MemoryStream nxzStream = new MemoryStream(mapData);
				//Directory.CreateDirectory(outPath + "\\" + Offset.ToString("X"));
				//FileStream fsInfo = new FileStream(outPath + "\\" + Offset.ToString("X") + "\\" + "info.lst", FileMode.Create);
				//StreamWriter swInfo = new StreamWriter(fsInfo);
				//swInfo.WriteLine("Section at Offset {0}: {1} entries", Offset, Entries.Count);
				foreach (SectionEntry e in Entries)
				{
					if (e.type == SectionEntry.Types.Type3 || e.type == SectionEntry.Types.Type4 || e.type == SectionEntry.Types.Type6)
					{
						nxzStream.Seek(e.Offset, SeekOrigin.Begin);
						e.StoreBitmapCache(nxzStream, bits8, (uint)i);
						//nxzStream.Seek(0, SeekOrigin.End);
					}
					i++;
				}
				//Debug.Assert(nxzStream.Position == nxzStream.Length, "VideoBag.Section.ReadAndWrite: Entries did not use all of data");
				nxzStream.Close();
			}

			public void ReadAndWrite(Stream bagStream, String outPath, bool bits8)
			{
				BinaryReader rdr = new BinaryReader(bagStream);
				rdr.BaseStream.Seek(Offset, SeekOrigin.Begin);
				byte[] nxzData = rdr.ReadBytes((int)SizeCompressed);
				byte[] mapData = new byte[SizeUncompressed];
				if (!NoxShared.CryptApi.NxzDecrypt(nxzData, mapData))
					return;
				MemoryStream nxzStream = new MemoryStream(mapData);
				Directory.CreateDirectory(outPath + "\\" + Offset.ToString("X"));
				FileStream fsInfo = new FileStream(outPath + "\\" + Offset.ToString("X") + "\\" + "info.lst", FileMode.Create);
				StreamWriter swInfo = new StreamWriter(fsInfo);
				swInfo.WriteLine("Section at Offset {0}: {1} entries", Offset, Entries.Count);
				foreach (SectionEntry e in Entries)
				{
					swInfo.WriteLine("{0} ({3} bytes): Type:{1}, Unknown3:{2}", e.Name, e.type, e.u3, e.Length);
					if (e.type == SectionEntry.Types.Type3)
					{
						/*System.Drawing.Bitmap img = e.GetBitmap(nxzStream, bits8, 0);
						if (img != null)
						{
							//img.Save(outPath + "\\" + Offset.ToString("X") + "\\" + e.Name.Replace(".pcx", ".bmp").Replace(".PCX", ".bmp"), System.Drawing.Imaging.ImageFormat.Bmp);
							//img.Dispose();
						}*/
					}
					else
					{
						/*FileStream fs = new FileStream(outPath + "\\" + Offset.ToString("X") + "\\" + e.Name, FileMode.Create);
						fs.Write(mapData, 0, (int)SizeUncompressed);
						fs.Close();*/
						nxzStream.Seek(0, SeekOrigin.End);
					}
				}
				Debug.Assert(nxzStream.Position == nxzStream.Length, "VideoBag.Section.ReadAndWrite: Entries did not use all of data");
				nxzStream.Close();
				swInfo.Close();
			}
		}

		protected System.Collections.SortedList SectionIndex = new SortedList();

		public static uint BagOffset;
		public VideoBag(string path)
			: base(path)
		{
			VideoBag.BagOffset = 0;
			sections = new ArrayList();
			if (File.Exists(bagPath))
				Read();
		}

		protected override bool Read()
		{
			if (!base.Read())
				return false;
			header = new Header(idx);
			uint currentOffset = 0;
			uint counter = 0;

			for (int count = 0; count < header.SectionCount; count++)
			{
				Section sct = new Section(idx);
				sct.Offset = currentOffset;
				currentOffset += sct.SizeCompressed;
				sections.Add(sct);
				for (int i = 0; i < sct.Entries.Count; i++)
					SectionIndex.Add(counter++, sct);
			}

			Debug.Assert(idx.Position == header.FileLength, "wrong number of bytes read");
			return true;
		}
		
		public override void ExtractAll(string path)
		{
			Directory.CreateDirectory(path);
			foreach (Section s in sections)
			{
				s.ReadAndWrite(bag, path, header.bits8);
			}
		}

		public void ExtractCache()
		{
			int i = 0;
			foreach (Section s in sections)
			{
				s.BuildVideoBagCache(bag, header.bits8, ref i);
			}
		}

		public byte[] TryExtractBin(uint index)
		{
			int i = 0;
			bool stop = false;
			Section.SectionEntry entry = null;
			Section sct = null;
			foreach (Section s in sections)
				if (!stop)
					foreach (Section.SectionEntry e in s.Entries)
					{
						if (i == index)
						{
							entry = e;
							sct = s;
							stop = true;
							break;
						}
						else
							i++;
					}
			if (!stop)
			{
				Debug.WriteLine("TryExtractBin: Couldn't find Index: " + index);
				return null;
			}
			BinaryReader rdr = new BinaryReader(bag);
			rdr.BaseStream.Seek(sct.Offset, SeekOrigin.Begin);
			byte[] nxzData = rdr.ReadBytes((int)sct.SizeCompressed);
			byte[] mapData = new byte[sct.SizeUncompressed];
			if (!NoxShared.CryptApi.NxzDecrypt(nxzData, mapData))
			{
				Debug.WriteLine("TryExtractBin: Couldn't NxzDecrypt");
				return null;
			}

			MemoryStream nxzStream = new MemoryStream(mapData);
			nxzStream.Seek(entry.Offset, SeekOrigin.Begin);
			return entry.GetBinary(nxzStream, header.bits8, index);
		}

		public System.Drawing.Bitmap ExtractOne(uint index, ref int offsetX, ref int offsetY)
		{
			int i = 0;
			bool stop = false;
			Section.SectionEntry entry = null;
			Section sct = null;
			foreach (Section s in sections)
				if (!stop)
					foreach (Section.SectionEntry e in s.Entries)
					{
						if (i == index)
						{
							entry = e;
							sct = s;
							stop = true;
							break;
						}
						else
							i++;
					}
			if (!stop)
			{
				Debug.WriteLine("ExtractOne: Couldn't find Index: " + index);
				return null;
			}
			BinaryReader rdr = new BinaryReader(bag);
			rdr.BaseStream.Seek(sct.Offset, SeekOrigin.Begin);
			byte[] nxzData = rdr.ReadBytes((int)sct.SizeCompressed);
			byte[] mapData = new byte[sct.SizeUncompressed];
			if (!NoxShared.CryptApi.NxzDecrypt(nxzData, mapData))
			{
				Debug.WriteLine("ExtractOne: Couldn't NxzDecrypt");
				return null;
			}

			MemoryStream nxzStream = new MemoryStream(mapData);
			nxzStream.Seek(entry.Offset, SeekOrigin.Begin);
			return entry.GetBitmap(nxzStream, header.bits8, index, ref offsetX, ref offsetY);
		}
		private int roundUp(int numToRound, int multiple)
		{
			if (multiple == 0)
				return numToRound;

			int remainder = Math.Abs(numToRound) % multiple;
			if (remainder == 0)
				return numToRound;
			if (numToRound < 0)
				return -(Math.Abs(numToRound) - remainder);
			return numToRound + multiple - remainder;
		}
		public class SpriteSheetInfo
		{
			public int X;
			public int Y;
			public int width;
			public int height; 
			public int offsetX;
			public int offsetY;
			public uint imageID;
			public string file;
		};

		public SpriteSheetInfo[] ExtractSpriteSheet(uint[] index, string path)
		{
			List<System.Drawing.Bitmap> bitmaps = new List<System.Drawing.Bitmap>();
			List<KeyValuePair<string, System.Drawing.Bitmap>> mapperInput = new List<KeyValuePair<string, System.Drawing.Bitmap>>();
			List<SpriteSheetInfo> retlist = new List<SpriteSheetInfo>();

			int offset = 0;
			for (int i = 0; i < index.Length; i++)
			{
				SpriteSheetInfo ssi = new SpriteSheetInfo();
				ssi.imageID = index[i];
				var subimg = ExtractOne(index[i], ref ssi.offsetX, ref ssi.offsetY);
				
				retlist.Add(ssi);

				if (subimg != null)
				{
					bitmaps.Add(subimg);
					mapperInput.Add(new KeyValuePair<string, System.Drawing.Bitmap>(index[i].ToString(), subimg));
					//imageinfos.Add (new ImageInfo(bitmaps[offset].Width, bitmaps[offset].Height, offset));
					offset++;
				}
			}

			if (bitmaps.Count == 0)
				return null;


			ImagePacker imagePacker = new ImagePacker();
			Bitmap outputImage;
			Lexicon<string, Rectangle> outputMap;
			List<uint> trash;

			// pack the image, generating a map only if desired
			imagePacker.PackImage(mapperInput, true, true, 2048, 2048, 1, true, out outputImage, out outputMap, out trash);

			
			foreach (KeyValuePair<string, Rectangle> mii in outputMap)
			{
				uint imgid = uint.Parse(mii.Key);
				
				var ssi = retlist.Find(x => x.imageID == imgid);
				
				ssi.X = mii.Value.X;
				ssi.Y = mii.Value.Y;
				ssi.width = mii.Value.Width;
				ssi.height = mii.Value.Height;
			}

			outputImage.Save(path);

			return retlist.ToArray();
		}

		public Section.SectionEntry GetSectionEntry(uint index)
		{
			Section s = (Section)SectionIndex[index];
			return (Section.SectionEntry)s.Entries[(int)(index - SectionIndex.IndexOfValue(s))];
		}
		public byte[] GetData(uint index)
		{
			Section sct = (Section)SectionIndex[index];
			Section.SectionEntry se = GetSectionEntry(index);
			BinaryReader rdr = new BinaryReader(bag);
			rdr.BaseStream.Seek(sct.Offset, SeekOrigin.Begin);
			byte[] nxzData = rdr.ReadBytes((int)sct.SizeCompressed);
			byte[] itemData = new byte[sct.SizeUncompressed];
			if (!NoxShared.CryptApi.NxzDecrypt(nxzData, itemData))
				return null;
			MemoryStream nxzStream = new MemoryStream(itemData);
			byte[] returnData = new byte[se.Length];
			nxzStream.Seek(se.Offset, SeekOrigin.Begin);
			nxzStream.Read(returnData, 0, (int)se.Length);
			return returnData;
		}
		/*
		public bool ExtractOneToPoint(uint index, ref UnityEngine.Texture2D img, Point point)
		{
			int i = 0;
			bool stop = false;
			Section.SectionEntry entry = null;
			Section sct = null;
			foreach (Section s in sections)
				if (!stop)
					foreach (Section.SectionEntry e in s.Entries)
					{
						if (i == index)
						{
							entry = e;
							sct = s;
							stop = true;
							break;
						}
						else
							i++;
					}
			if (!stop)
				return false;
			BinaryReader rdr = new BinaryReader(bag);
			rdr.BaseStream.Seek(sct.Offset, SeekOrigin.Begin);
			byte[] nxzData = rdr.ReadBytes((int)sct.SizeCompressed);
			byte[] mapData = new byte[sct.SizeUncompressed];
			if (!OpenNoxLib.CryptApi.NxzDecrypt(nxzData, ref mapData))
				return false;
			MemoryStream nxzStream = new MemoryStream(mapData);
			nxzStream.Seek(entry.Offset, SeekOrigin.Begin);
			return entry.WriteBitmapTo(nxzStream, header.bits8, ref img, point);
		}*/


		public void LogEntries()
		{
			int i = 0;
			foreach (Section s in sections)
			{
				Debug.WriteLine(String.Format("Section offset:{0} comp:{1} uncomp:{2}", s.Offset, s.SizeCompressed, s.SizeUncompressed));
				foreach (Section.SectionEntry e in s.Entries)
				{
					Debug.WriteLine(String.Format("{4}:  {0} - {1} u1:{2} u3:{3}", e.Name, e.Length, (byte)e.type, e.u3, i));
					i++;
				}
			}
		}
	}
}
