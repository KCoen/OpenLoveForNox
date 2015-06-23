#ifdef VERTEX
#extension GL_EXT_gpu_shader4 : require
#extension GL_ARB_draw_instanced : require

flat varying int textureoffset;

vec4 position( mat4 transform_projection, vec4 vertex_position )
{
	textureoffset = (gl_VertexID - (gl_VertexID % 4)) / 4 * 8;	
	return transform_projection*vertex_position;
}
#endif

#ifdef PIXEL
#extension GL_EXT_gpu_shader4 : require
#extension GL_ARB_draw_instanced : require


extern Image shadowbuffer;
extern Image posbuffer;

flat varying int textureoffset;

vec4 getColor(int offset)
{
	int loffset = textureoffset+offset;
	vec2 loc = vec2(loffset % 512, (loffset - (loffset % 512)) / 512) / 512.0;
	return (Texel(posbuffer,loc) * 255.0);
}

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
	vec4 orig = Texel(texture,texture_coords);

	vec2 coordinatecompressedlocation = vec2(textureoffset % 512, (textureoffset - (textureoffset % 512)) / 512) / 512.0; // Transision from 1d space to 2d space
	vec4 coordinatecompresed = Texel(posbuffer,coordinatecompressedlocation); // Get the screen location data
	vec2 coordinate = vec2(coordinatecompresed.r * 255.0 + (coordinatecompresed.g * 255.0 * 255.0), 
		coordinatecompresed.b * 255.0 + (coordinatecompresed.a * 255.0 * 255.0)); // Change 4 bytes to 2 shorts

	vec4 point = Texel(shadowbuffer,coordinate/textureSize2D(shadowbuffer,0)); // Sample the shadowmap
	
	if (orig.a > 0.0001 && orig.a < 0.9999)
	{
		//orig.rgb = vec3(orig.r * 32.0,orig.r * 32.0,orig.r * 32.0);
		float id = orig.a * 255.0;
		//orig.rgb = vec3(orig.r * 256.0,orig.r * 256.0,orig.r * 256.0);

		if(id < 12.0)
		{
			// Unknown use
		}
		else if(id > 12.0 && id < 28.0)
		{
			orig.rgb = getColor(1).rgb * (orig.r  / 32.0);
		}
		else if(id > 28.0 && id < 44.0)
		{
			orig.rgb = getColor(2).rgb * (orig.r  / 32.0);
		}
		else if(id > 44.0 && id < 66.0f)
		{
			orig.rgb = getColor(3).rgb * (orig.r  / 32.0);
		}
		else if(id > 66.0 && id < 76.0)
		{
			orig.rgb = getColor(4).rgb * (orig.r  / 32.0);
		}
		else if(id > 76.0 && id < 92.0)
		{
			orig.rgb = getColor(5).rgb * (orig.r  / 32.0);
		}
		else	
		{
			orig.rgb = getColor(6).rgb * (orig.r  / 32.0);
		}//*/
		orig.a = 1.0;
	}
	
	if (orig.a > 0.0)
	{
		orig.a = 1.0;
	}

	if(getColor(6).r > 0.1)
	{
		if (point.r < 0.1)
		{
			point.r = 0.0;point.g = 0.0;point.b = 0.0;
		}
		else
		{
			point.r = 1.0;point.g = 1.0;point.b = 1.0;
		}
	}

	
	orig.a *= point.r;
	
	return orig*color;
}
#endif
