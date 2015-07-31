using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using System.Drawing;
using NoxShared;
using System.IO;
using sspack;
using MapEditor.noxscript2;

namespace NoxExporter
{
	class JSON_PrettyPrinter
	{
		public static string Process(string inputText)
		{
			bool escaped = false;
			bool inquotes = false;
			int column = 0;
			int indentation = 0;
			Stack<int> indentations = new Stack<int>();
			int TABBING = 8;
			StringBuilder sb = new StringBuilder();
			foreach (char x in inputText)
			{
				sb.Append(x);
				column++;
				if (escaped)
				{
					escaped = false;
				}
				else
				{
					if (x == '\\')
					{
						escaped = true;
					}
					else if (x == '\"')
					{
						inquotes = !inquotes;
					}
					else if (!inquotes)
					{
						if (x == ',')
						{
							// if we see a comma, go to next line, and indent to the same depth
							sb.Append("\r\n");
							column = 0;
							for (int i = 0; i < indentation; i++)
							{
								sb.Append(" ");
								column++;
							}
						}
						else if (x == '[' || x == '{')
						{
							// if we open a bracket or brace, indent further (push on stack)
							indentations.Push(indentation);
							indentation = column;
						}
						else if (x == ']' || x == '}')
						{
							// if we close a bracket or brace, undo one level of indent (pop)
							indentation = indentations.Pop();
						}
						else if (x == ':')
						{
							// if we see a colon, add spaces until we get to the next
							// tab stop, but without using tab characters!
							while ((column % TABBING) != 0)
							{
								sb.Append(' ');
								column++;
							}
						}
					}
				}
			}
			return sb.ToString();
		}
	}

	class Program
	{
		static ThingDb thingdb;// = new ThingDb();
		static ModifierDb moddb;
		static VideoBag bag;
		static Lexicon<uint, VideoBag.SpriteSheetInfo> ssilist;
		static void ExportTiles()
		{
			string last = "";
			for (int i = 0; i < thingdb.FloorTiles.Count; i++)
			{
				ThingDb.Tile ttile = thingdb.FloorTiles[i];

				if (ttile.Name == last)
					continue;

				last = ttile.Name;
				string assetPath = "Sprites/tiles/" + ttile.Name + ".png";

				/*if (AssetImporter.GetAtPath(assetPath) != null)
					continue;*/

				//VideoBag.SpriteSheetInfo[] inf = bag.ExtractSpriteSheet(ttile.Variations.ToArray(), assetPath);

				uint[] index = ttile.Variations.ToArray();
				int instance = 1;
				do
				{
					List<System.Drawing.Bitmap> bitmaps = new List<System.Drawing.Bitmap>();
					List<KeyValuePair<string, System.Drawing.Bitmap>> mapperInput = new List<KeyValuePair<string, System.Drawing.Bitmap>>();
					List<VideoBag.SpriteSheetInfo> retlist = new List<VideoBag.SpriteSheetInfo>();

					int offset = 0;
					for (int j = 0; j < index.Length; j++)
					{
						VideoBag.SpriteSheetInfo ssi = new VideoBag.SpriteSheetInfo();
						ssi.imageID = index[j];
						ssi.file = assetPath;
						var subimg = bag.ExtractOne(index[j], ref ssi.offsetX, ref ssi.offsetY);

						retlist.Add(ssi);

						if (subimg != null)
						{
							bitmaps.Add(subimg);
							mapperInput.Add(new KeyValuePair<string, System.Drawing.Bitmap>(index[j].ToString(), subimg));
							//imageinfos.Add (new ImageInfo(bitmaps[offset].Width, bitmaps[offset].Height, offset));
							offset++;
						}
					}

					if (bitmaps.Count == 0)
						continue;




					// pack the image, generating a map only if desired

					ImagePacker imagePacker = new ImagePacker();
					Bitmap outputImage;
					Lexicon<string, Rectangle> outputMap;
					List<uint> failedPlacements;

					FailCode returnState = (FailCode)imagePacker.PackImage(mapperInput, true, true, 2048, 2048, 1, true, out outputImage, out outputMap, out failedPlacements);

					foreach (KeyValuePair<string, Rectangle> mii in outputMap)
					{
						uint imgid = uint.Parse(mii.Key);

						var ssi = retlist.Find(x => x.imageID == imgid);

						ssi.X = mii.Value.X;
						ssi.Y = mii.Value.Y;
						ssi.width = mii.Value.Width;
						ssi.height = mii.Value.Height;

						ssilist.Add(ssi.imageID, ssi);
					}

					outputImage.Save(assetPath);

					if (failedPlacements.Count == 0)
						break;
					else
					{
						index = failedPlacements.ToArray();
						assetPath = "Sprites/tiles/" + ttile.Name + "-" + instance + ".png";
						instance++;
					}



				} while (true);
			}
		}

		static void ExportEdgeTiles()
		{
			string last = "";
			for (int i = 0; i < thingdb.EdgeTiles.Count; i++)
			{
				ThingDb.Tile ttile = thingdb.EdgeTiles[i];

				if (ttile.Name == last)
					continue;

				last = ttile.Name;
				string assetPath = "Sprites/edges/" + ttile.Name + ".png";

				/*if (AssetImporter.GetAtPath(assetPath) != null)
					continue;*/

				//VideoBag.SpriteSheetInfo[] inf = bag.ExtractSpriteSheet(ttile.Variations.ToArray(), assetPath);
				HashSet<uint> indexuniques = new HashSet<uint>();

				foreach(uint ind in ttile.Variations)
				{
					indexuniques.Add(ind);
				}
				uint[] index = new uint[indexuniques.Count];
				indexuniques.CopyTo(index);


				//uint[] index = ttile.Variations.ToArray();
				int instance = 1;
				do
				{
					List<System.Drawing.Bitmap> bitmaps = new List<System.Drawing.Bitmap>();
					List<KeyValuePair<string, System.Drawing.Bitmap>> mapperInput = new List<KeyValuePair<string, System.Drawing.Bitmap>>();
					List<VideoBag.SpriteSheetInfo> retlist = new List<VideoBag.SpriteSheetInfo>();

					int offset = 0;
					for (int j = 0; j < index.Length; j++)
					{
						VideoBag.SpriteSheetInfo ssi = new VideoBag.SpriteSheetInfo();
						ssi.imageID = index[j];
						ssi.file = assetPath;
						var subimg = bag.ExtractOne(index[j], ref ssi.offsetX, ref ssi.offsetY);

						retlist.Add(ssi);

						if (subimg != null)
						{
							bitmaps.Add(subimg);
							mapperInput.Add(new KeyValuePair<string, System.Drawing.Bitmap>(index[j].ToString(), subimg));
							//imageinfos.Add (new ImageInfo(bitmaps[offset].Width, bitmaps[offset].Height, offset));
							offset++;
						}
					}

					if (bitmaps.Count == 0)
						continue;




					// pack the image, generating a map only if desired

					ImagePacker imagePacker = new ImagePacker();
					Bitmap outputImage;
					Lexicon<string, Rectangle> outputMap;
					List<uint> failedPlacements;

					FailCode returnState = (FailCode)imagePacker.PackImage(mapperInput, true, true, 2048, 2048, 1, true, out outputImage, out outputMap, out failedPlacements);

					foreach (KeyValuePair<string, Rectangle> mii in outputMap)
					{
						uint imgid = uint.Parse(mii.Key);

						var ssi = retlist.Find(x => x.imageID == imgid);

						ssi.X = mii.Value.X;
						ssi.Y = mii.Value.Y;
						ssi.width = mii.Value.Width;
						ssi.height = mii.Value.Height;

						ssilist.Add(ssi.imageID, ssi);
					}

					outputImage.Save(assetPath);

					if (failedPlacements.Count == 0)
						break;
					else
					{
						index = failedPlacements.ToArray();
						assetPath = "Sprites/edges/" + ttile.Name + "-" + instance + ".png";
						instance++;
					}



				} while (true);
			}
		}

		static void ExportOtherSprites()
		{
			HashSet<uint> allreadyExported = new HashSet<uint>();
			for (int i = 0; i < thingdb.Walls.Count; i++)
			{
				ThingDb.Wall wall = thingdb.Walls[i];
				foreach (ThingDb.Wall.WallRenderInfo[] wriarray in wall.RenderBreakable)
				{
					foreach (ThingDb.Wall.WallRenderInfo wri in wriarray)
					{
						allreadyExported.Add((uint)wri.SpriteIndex);
					}
				}

				foreach (ThingDb.Wall.WallRenderInfo[] wriarray in wall.RenderNormal)
				{
					foreach (ThingDb.Wall.WallRenderInfo wri in wriarray)
					{
						allreadyExported.Add((uint)wri.SpriteIndex);
					}
				}
			}
			for (int i = 0; i < thingdb.EdgeTiles.Count; i++)
			{
				ThingDb.Tile ttile = thingdb.EdgeTiles[i];
				foreach (uint ind in ttile.Variations)
				{
					allreadyExported.Add(ind);
				}
			}

			for (int i = 0; i < thingdb.FloorTiles.Count; i++)
			{
				ThingDb.Tile ttile = thingdb.FloorTiles[i];

				foreach (uint a in ttile.Variations) 
				{
					allreadyExported.Add(a);
				}
			}
			foreach (KeyValuePair<string, ThingDb.Thing> kvpair in thingdb.Things)
			{
				ThingDb.Thing thing = kvpair.Value;

				foreach (int j in thing.SpriteAnimFrames)
				{
					allreadyExported.Add((uint)j);
				}

				foreach (ThingDb.Image.State ss in thing.SpriteStates)
				{
					foreach (int j in ss.Animation.Frames)
					{
						allreadyExported.Add((uint)j);
					}

				}

				foreach (ThingDb.Image.Animation a in thing.ConditionalAnimations)
				{
					foreach (int j in a.Frames)
					{
						allreadyExported.Add((uint)j);
					}
				}

				if (thing.SpriteStates.Count < 1)
					continue;

				if (thing.SpriteStates[0].Animation.Sequences.Count < 1)
					continue;

				Dictionary<string, HashSet<uint>> spritedict = new Dictionary<string, HashSet<uint>>();

				foreach (ThingDb.Image.State ss in thing.SpriteStates)
				{
					foreach (ThingDb.Image.Animation.Sequence seq in ss.Animation.Sequences)
					{
						foreach (int i in seq.Frames)
						{
							allreadyExported.Add((uint)i);
						}
					}
				}
			}

			bag.ExtractAllExceptMap("sprites/other", allreadyExported, ref ssilist);

			
		}

		static void ExportWalls()
		{
			string last = "";
			for (int i = 0; i < thingdb.Walls.Count; i++)
			{
				ThingDb.Wall wall = thingdb.Walls[i];

				if (wall.Name == last)
					continue;

				last = wall.Name;
				string assetPath = "Sprites/walls/" + wall.Name + ".png";

				/*if (AssetImporter.GetAtPath(assetPath) != null)
					continue;*/

				//VideoBag.SpriteSheetInfo[] inf = bag.ExtractSpriteSheet(ttile.Variations.ToArray(), assetPath);

				HashSet<uint> indexl = new HashSet<uint>();
				foreach (ThingDb.Wall.WallRenderInfo[] wriarray in wall.RenderBreakable)
				{
					foreach (ThingDb.Wall.WallRenderInfo wri in wriarray)
					{
						indexl.Add((uint)wri.SpriteIndex);
					}
				}

				foreach (ThingDb.Wall.WallRenderInfo[] wriarray in wall.RenderNormal)
				{
					foreach (ThingDb.Wall.WallRenderInfo wri in wriarray)
					{
						indexl.Add((uint)wri.SpriteIndex);
					}
				}

				uint[] index = new uint[indexl.Count];
				indexl.CopyTo(index);

				int instance = 1;
				do
				{
					List<System.Drawing.Bitmap> bitmaps = new List<System.Drawing.Bitmap>();
					List<KeyValuePair<string, System.Drawing.Bitmap>> mapperInput = new List<KeyValuePair<string, System.Drawing.Bitmap>>();
					List<VideoBag.SpriteSheetInfo> retlist = new List<VideoBag.SpriteSheetInfo>();

					int offset = 0;
					for (int j = 0; j < index.Length; j++)
					{
						VideoBag.SpriteSheetInfo ssi = new VideoBag.SpriteSheetInfo();
						ssi.imageID = index[j];
						ssi.file = assetPath;
						var subimg = bag.ExtractOne(index[j], ref ssi.offsetX, ref ssi.offsetY);

						retlist.Add(ssi);

						if (subimg != null)
						{
							bitmaps.Add(subimg);
							mapperInput.Add(new KeyValuePair<string, System.Drawing.Bitmap>(index[j].ToString(), subimg));
							//imageinfos.Add (new ImageInfo(bitmaps[offset].Width, bitmaps[offset].Height, offset));
							offset++;
						}
					}

					if (bitmaps.Count == 0)
						break;




					// pack the image, generating a map only if desired

					ImagePacker imagePacker = new ImagePacker();
					Bitmap outputImage;
					Lexicon<string, Rectangle> outputMap;
					List<uint> failedPlacements;

					FailCode returnState = (FailCode)imagePacker.PackImage(mapperInput, true, true, 2048, 2048, 1, true, out outputImage, out outputMap, out failedPlacements);

					foreach (KeyValuePair<string, Rectangle> mii in outputMap)
					{
						uint imgid = uint.Parse(mii.Key);

						var ssi = retlist.Find(x => x.imageID == imgid);

						ssi.X = mii.Value.X;
						ssi.Y = mii.Value.Y;
						ssi.width = mii.Value.Width;
						ssi.height = mii.Value.Height;

						ssilist.Add(ssi.imageID, ssi);
					}

					outputImage.Save(assetPath);

					if (failedPlacements.Count == 0)
						break;
					else
					{
						index = failedPlacements.ToArray();
						assetPath = "Sprites/walls/" + wall.Name + "-" + instance + ".png";
						instance++;
					}



				} while (true);
			}
		}

		static void ExportObjects()
		{
			string last = "";
			foreach (KeyValuePair<string, ThingDb.Thing> kvpair in thingdb.Things)
			{
				ThingDb.Thing thing = kvpair.Value;


				if (thing.Name == last)
					continue;

				last = thing.Name;
				string assetPath = "Sprites/objects/" + thing.Name + ".png";

				if (File.Exists(assetPath))
					continue;


				/*if (AssetImporter.GetAtPath(assetPath) != null)
					continue;*/

				//VideoBag.SpriteSheetInfo[] inf = bag.ExtractSpriteSheet(ttile.Variations.ToArray(), assetPath);

				HashSet<uint> sprites = new HashSet<uint>();
				foreach (int j in thing.SpriteAnimFrames)
				{
					sprites.Add((uint)j);
				}

				foreach (ThingDb.Image.State ss in thing.SpriteStates)
				{
					foreach (int j in ss.Animation.Frames)
					{
						sprites.Add((uint)j);
					}

				}

				foreach (ThingDb.Image.Animation a in thing.ConditionalAnimations)
				{
					foreach (int j in a.Frames)
					{
						sprites.Add((uint)j);
					}
				}


				if (sprites.Count < 1)
					continue;

				uint[] index = new uint[sprites.Count];
				sprites.CopyTo(index);

				int instance = 1;
				do
				{
					List<System.Drawing.Bitmap> bitmaps = new List<System.Drawing.Bitmap>();
					List<KeyValuePair<string, System.Drawing.Bitmap>> mapperInput = new List<KeyValuePair<string, System.Drawing.Bitmap>>();
					List<VideoBag.SpriteSheetInfo> retlist = new List<VideoBag.SpriteSheetInfo>();

					int offset = 0;
					for (int j = 0; j < index.Length; j++)
					{
						VideoBag.SpriteSheetInfo ssi = new VideoBag.SpriteSheetInfo();
						ssi.imageID = index[j];
						ssi.file = assetPath;
						var subimg = bag.ExtractOne(index[j], ref ssi.offsetX, ref ssi.offsetY);

						retlist.Add(ssi);

						if (subimg != null)
						{
							bitmaps.Add(subimg);
							mapperInput.Add(new KeyValuePair<string, System.Drawing.Bitmap>(index[j].ToString(), subimg));
							//imageinfos.Add (new ImageInfo(bitmaps[offset].Width, bitmaps[offset].Height, offset));
							offset++;
						}
					}

					if (bitmaps.Count == 0)
					{
						Console.WriteLine("Failed to export: " + thing.Name);
						break;
					}
						




					// pack the image, generating a map only if desired

					ImagePacker imagePacker = new ImagePacker();
					Bitmap outputImage;
					Lexicon<string, Rectangle> outputMap;
					List<uint> failedPlacements;

					FailCode returnState = (FailCode)imagePacker.PackImage(mapperInput, false, false, 2048, 2048, 1, true, out outputImage, out outputMap, out failedPlacements);

					if (returnState != 0)
					{
						Console.WriteLine("Failed to export: " + thing.Name);
						break;
					}

					foreach (KeyValuePair<string, Rectangle> mii in outputMap)
					{
						uint imgid = uint.Parse(mii.Key);

						var ssi = retlist.Find(x => x.imageID == imgid);

						ssi.X = mii.Value.X;
						ssi.Y = mii.Value.Y;
						ssi.width = mii.Value.Width;
						ssi.height = mii.Value.Height;

						ssilist.Add(ssi.imageID, ssi);
					}

					outputImage.Save(assetPath);

					if (failedPlacements.Count == 0)
						break;
					else
					{
						index = failedPlacements.ToArray();
						assetPath = "Sprites/objects/" + thing.Name + "-" + instance + ".png";
						instance++;
					}



				} while (true);
			}
		}

		static void ExportSequences()
		{
			string last = "";
			foreach (KeyValuePair<string, ThingDb.Thing> kvpair in thingdb.Things)
			{
				ThingDb.Thing thing = kvpair.Value;

				if (thing.Name == last)
					continue;

				last = thing.Name;

				if (thing.SpriteStates.Count < 1)
					continue;

				if (thing.SpriteStates[0].Animation.Sequences.Count < 1)
					continue;

				Dictionary<string, HashSet<uint>> spritedict = new Dictionary<string, HashSet<uint>>();

				foreach (ThingDb.Image.State ss in thing.SpriteStates)
				{
					foreach (ThingDb.Image.Animation.Sequence seq in ss.Animation.Sequences)
					{
						foreach (int i in seq.Frames)
						{
							HashSet<uint> hs = null;
							spritedict.TryGetValue(seq.Name, out hs);
							if (hs == null)
							{
								hs = new HashSet<uint>();
								hs.Add((uint)i);
								spritedict.Add(seq.Name, hs);
							}
							else
							{
								hs.Add((uint)i);
							}
						}
					}
				}

				string basePath = "";
				if (spritedict.Count > 0)
				{
					basePath = "Sprites/sequences/" + thing.Name;
					Directory.CreateDirectory(basePath);
				}


				foreach (KeyValuePair<string, HashSet<uint>> kv in spritedict)
				{
					uint[] index = new uint[kv.Value.Count];
					kv.Value.CopyTo(index);
					string assetPath = basePath + "/" + kv.Key + ".png";

					int instance = 1;
					do
					{
						List<System.Drawing.Bitmap> bitmaps = new List<System.Drawing.Bitmap>();
						List<KeyValuePair<string, System.Drawing.Bitmap>> mapperInput = new List<KeyValuePair<string, System.Drawing.Bitmap>>();
						List<VideoBag.SpriteSheetInfo> retlist = new List<VideoBag.SpriteSheetInfo>();

						int offset = 0;
						for (int j = 0; j < index.Length; j++)
						{
							VideoBag.SpriteSheetInfo ssi = new VideoBag.SpriteSheetInfo();
							ssi.imageID = index[j];
							ssi.file = assetPath;
							var subimg = bag.ExtractOne(index[j], ref ssi.offsetX, ref ssi.offsetY);

							retlist.Add(ssi);

							if (subimg != null)
							{
								bitmaps.Add(subimg);
								mapperInput.Add(new KeyValuePair<string, System.Drawing.Bitmap>(index[j].ToString(), subimg));
								//imageinfos.Add (new ImageInfo(bitmaps[offset].Width, bitmaps[offset].Height, offset));
								offset++;
							}
						}

						if (bitmaps.Count == 0)
						{
							//Console.WriteLine("Failed to export: " + thing.Name);
							break;
						}





						// pack the image, generating a map only if desired

						ImagePacker imagePacker = new ImagePacker();
						Bitmap outputImage;
						Lexicon<string, Rectangle> outputMap;
						List<uint> failedPlacements;

						FailCode returnState = (FailCode)imagePacker.PackImage(mapperInput, true, true, 2048, 2048, 1, true, out outputImage, out outputMap, out failedPlacements);

						if (returnState != 0)
						{
							Console.WriteLine("Failed to export: " + thing.Name + ":" + kv.Value);
							break;
						}

						foreach (KeyValuePair<string, Rectangle> mii in outputMap)
						{
							uint imgid = uint.Parse(mii.Key);

							var ssi = retlist.Find(x => x.imageID == imgid);

							ssi.X = mii.Value.X;
							ssi.Y = mii.Value.Y;
							ssi.width = mii.Value.Width;
							ssi.height = mii.Value.Height;

							ssilist.Add(ssi.imageID, ssi);
						}

						outputImage.Save(assetPath);

						if (failedPlacements.Count == 0)
							break;
						else
						{
							index = failedPlacements.ToArray();
							//assetPath = "Sprites/objects/" + thing.Name + "-" + instance + ".png";
							assetPath = basePath + "/" + kv.Key + "-" + instance + ".png";
							instance++;
						}



					} while (true);
				}
			}
		}

		static void ExportMaps()
		{
			Directory.CreateDirectory("noxmaps");
			Directory.CreateDirectory("jsonmaps");

			DirectoryInfo di = new DirectoryInfo("noxmaps");
			foreach (var dir in di.GetDirectories())
			{
				foreach (var file in dir.GetFiles())
				{
					if (file.Extension == ".map")
					{
						Map map = new Map(file.FullName, thingdb);
						var jsonserialize = new JavaScriptSerializer();
						jsonserialize.MaxJsonLength = int.MaxValue;
						var json = jsonserialize.Serialize(map);
						System.IO.File.WriteAllText("jsonmaps/" + file.Name + ".json", json);
					}
				}
			}
		}

        static void ExportMapScripts()
        {
            Directory.CreateDirectory("noxmaps");
            Directory.CreateDirectory("luamaps");

            DirectoryInfo di = new DirectoryInfo("noxmaps");
            foreach (var dir in di.GetDirectories())
            {
                foreach (var file in dir.GetFiles())
                {
                    if (file.Extension == ".map")
                    {
						Console.WriteLine(file.Name);
                        string code = "";
                        Map map = new Map(file.FullName, thingdb);
                        var soc = new ScriptObjContainer(map.Scripts);

                        for(int i = 0; i < soc.Functions.Count;i++)
                        {
                            
                            code = code + "\r\n";
                            code = code + "function " + soc.Functions[i].Name + "(";
                            for(int j = 0; j < soc.Functions[i].NumArgs;j++)
                            {
                                if(j > 0)
                                    code = code + ",";
								code = code + "arg_" + j.ToString();
                            }
                            
                            code = code + ")\r\n";
							foreach (string line in new LineReader(() => new StringReader(soc.Decompile(i))))
							{
								code = code + "\t" + line + "\r\n";
							}
                            code = code + "end";
                        }

                        System.IO.File.WriteAllText("luamaps/" + file.Name + ".lua", code);
                    }
                }
            }
        }

		static void Main(string[] args)
		{
			while (true)
			{
				Console.WriteLine("Export:");
				Console.WriteLine("A - Export ThingDB");
				Console.WriteLine("M - Export Maps");
				Console.WriteLine("X - Export Tiles");
				Console.WriteLine("P - Export TileEdges");
				Console.WriteLine("Y - Export Walls");
				Console.WriteLine("L - Export Sequences");
				Console.WriteLine("U - Export Objects");
				Console.WriteLine("B - Export OtherImages");
				Console.WriteLine("I - Export Audio");
                Console.WriteLine("S - Export Map Scripts");
				Console.WriteLine("W - Export Soundset");
				Console.WriteLine("T - Export StringDB");
				Console.WriteLine("O - ModDB");
				Console.WriteLine("Q - Quit");

				thingdb = new ThingDb();
				moddb = new ModifierDb();
				bag = new VideoBag(@"C:\GOG Games\Nox\video8.bag");
				ssilist = new Lexicon<uint, VideoBag.SpriteSheetInfo>();

				switch (Convert.ToChar(Console.Read()))
				{
					case 'T':
						{
							var stringdb = new StringDb();
							var jsonserialize = new JavaScriptSerializer();
							jsonserialize.MaxJsonLength = int.MaxValue;
							var json = jsonserialize.Serialize(stringdb);
							System.IO.File.WriteAllText("StringDB.min.json", json);
							json = JSON_PrettyPrinter.Process(json);
							System.IO.File.WriteAllText("StringDB.json", json);
						}
						break;
					case 'A':
						{
							
							var jsonserialize = new JavaScriptSerializer();
							jsonserialize.MaxJsonLength *= 5;
							var json = jsonserialize.Serialize(thingdb);
							System.IO.File.WriteAllText("ThingDB.min.json", json);
							json = JSON_PrettyPrinter.Process(json);
							System.IO.File.WriteAllText("ThingDB.json", json);
						}
						break;
					case 'I':
						{
							AudioBag abag = new AudioBag("Audio.bag");
							abag.ExtractAll("audio");

							var jsonserialize = new JavaScriptSerializer();
							jsonserialize.MaxJsonLength = int.MaxValue;
							var json = jsonserialize.Serialize(abag);
							System.IO.File.WriteAllText("Audio.min.json", json);
							json = JSON_PrettyPrinter.Process(json);
							System.IO.File.WriteAllText("Audio.json", json);
						}
						break;
					case 'M':
						{
							ExportMaps();
							/*
							Map map = new Map(@"C:\Program Files (x86)\Nox\maps\BluDeath\BluDeath.map", thingdb);
							var jsonserialize = new JavaScriptSerializer();
							jsonserialize.MaxJsonLength *= 5;
							var json = jsonserialize.Serialize(map);
							System.IO.File.WriteAllText("BlueDeath.min.json", json);
							json = JSON_PrettyPrinter.Process(json);
							System.IO.File.WriteAllText("BlueDeath.json", json);J*/
						}
						break;
                    case 'S':
                        {
                            ExportMapScripts();
                            /*
                            Map map = new Map(@"C:\Program Files (x86)\Nox\maps\BluDeath\BluDeath.map", thingdb);
                            var jsonserialize = new JavaScriptSerializer();
                            jsonserialize.MaxJsonLength *= 5;
                            var json = jsonserialize.Serialize(map);
                            System.IO.File.WriteAllText("BlueDeath.min.json", json);
                            json = JSON_PrettyPrinter.Process(json);
                            System.IO.File.WriteAllText("BlueDeath.json", json);J*/
                        }
                        break;
					case 'O':
						{
							var jsonserialize = new JavaScriptSerializer();
							jsonserialize.MaxJsonLength *= 5;
							var json = jsonserialize.Serialize(moddb);
							System.IO.File.WriteAllText("ModDB.min.json", json);
							json = JSON_PrettyPrinter.Process(json);
							System.IO.File.WriteAllText("ModDB.json", json);
						}
						break;
					case 'X':
						{
							ExportTiles();
							var jsonserialize = new JavaScriptSerializer();
							jsonserialize.MaxJsonLength *= 5;
							var json = jsonserialize.Serialize(ssilist);
							System.IO.File.WriteAllText("TileSprites.min.json", json);
							json = JSON_PrettyPrinter.Process(json);
							System.IO.File.WriteAllText("TileSprites.json", json);
						}
						break;
					case 'P':
						{
							ExportEdgeTiles();
							var jsonserialize = new JavaScriptSerializer();
							jsonserialize.MaxJsonLength *= 5;
							var json = jsonserialize.Serialize(ssilist);
							System.IO.File.WriteAllText("TileEdgeSprites.min.json", json);
							json = JSON_PrettyPrinter.Process(json);
							System.IO.File.WriteAllText("TileEdgeSprites.json", json);
						}
						break;
					case 'Y':
						{
							ExportWalls();
							var jsonserialize = new JavaScriptSerializer();
							jsonserialize.MaxJsonLength *= 5;
							var json = jsonserialize.Serialize(ssilist);
							System.IO.File.WriteAllText("WallSprites.min.json", json);
							json = JSON_PrettyPrinter.Process(json);
							System.IO.File.WriteAllText("WallSprites.json", json);
						}
						break;
					case 'B':
						{
							ExportOtherSprites();
							var jsonserialize = new JavaScriptSerializer();
							jsonserialize.MaxJsonLength *= 5;
							var json = jsonserialize.Serialize(ssilist);
							System.IO.File.WriteAllText("OtherSprites.min.json", json);
							json = JSON_PrettyPrinter.Process(json);
							System.IO.File.WriteAllText("OtherSprites.json", json);
						}
						break;
					case 'L':
						{
							ExportSequences();
							var jsonserialize = new JavaScriptSerializer();
							jsonserialize.MaxJsonLength = int.MaxValue;
							var json = jsonserialize.Serialize(ssilist);
							System.IO.File.WriteAllText("SequenceSprites.min.json", json);
							json = JSON_PrettyPrinter.Process(json);
							System.IO.File.WriteAllText("SequenceSprites.json", json);
						}
						break;
					case 'U':
						{
							var jsonserialize = new JavaScriptSerializer();
							try
							{
								string cont = System.IO.File.ReadAllText("ObjectSprites.min.json");
								ssilist = jsonserialize.Deserialize<Lexicon<uint, VideoBag.SpriteSheetInfo>>(cont);
							}
							catch {}

							ExportObjects();
							
							jsonserialize.MaxJsonLength *= 5;
							var json = jsonserialize.Serialize(ssilist);
							System.IO.File.WriteAllText("ObjectSprites.min.json", json);
							json = JSON_PrettyPrinter.Process(json);
							System.IO.File.WriteAllText("ObjectSprites.json", json);
						}
						break;
					case 'W':
						{
							new SoundsetDb();
							new GamedataDb();
						}
						break;
					case 'Q':
						return;
				}
			}
		}
	}
}
