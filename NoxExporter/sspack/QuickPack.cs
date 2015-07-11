//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.0
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;

namespace sspack
{
	public class QuickPack
	{
		private readonly Lexicon<string, Size> imageSizes = new Lexicon<string, Size>();
		private readonly Dictionary<string, Rectangle> imagePlacement = new Dictionary<string, Rectangle>();
		//private List<KeyValuePair<string, Bitmap>> files;

		public QuickPack ()
		{

		}
		public int PackImage(
			IEnumerable<KeyValuePair<string, Bitmap>> input,
			bool requirePowerOfTwo,
			bool requireSquareImage,
			int maximumWidth,
			int maximumHeight,
			int imagePadding,
			bool generateMap,
			out Bitmap outputImage,
			out Dictionary<string, Rectangle> outputMap)
		{
			imageSizes.Clear();
			imagePlacement.Clear();

			int MaxHeight = 0;
			foreach(KeyValuePair<string, Bitmap> kv in input)
			{
				if(kv.Value.Size.Height > MaxHeight)
					MaxHeight = kv.Value.Size.Height;
			}


			outputImage = new Bitmap(maximumWidth, maximumHeight, PixelFormat.Format32bppArgb);

			outputMap = new Dictionary<string, Rectangle>();

			int offsetX = 0;
			int offsetY = 0;

			using(Graphics g = Graphics.FromImage(outputImage))
			{
				foreach(KeyValuePair<string, Bitmap> kv in input)
				{
					if((offsetX + kv.Value.Size.Width) > maximumWidth)
					{
						offsetY += MaxHeight;
						offsetX = 0;
					}



					g.DrawImage(kv.Value, offsetX, offsetY);



					outputMap.Add (kv.Key, new Rectangle(offsetX, offsetY, kv.Value.Size.Width, kv.Value.Size.Height));

					offsetX += kv.Value.Size.Width;
				}
			}



			return 0;
		}
	}
}

