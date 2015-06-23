#ifdef VERTEX
#extension GL_EXT_gpu_shader4 : require
#extension GL_ARB_draw_instanced : require

flat varying int textureoffset;

vec4 position( mat4 transform_projection, vec4 vertex_position )
{
	textureoffset = (gl_VertexID - (gl_VertexID % 4)) / 4 * 1;	
	return transform_projection*vertex_position;
}
#endif

#ifdef PIXEL
#extension GL_EXT_gpu_shader4 : require
#extension GL_ARB_draw_instanced : require


extern Image shadowbuffer;
extern Image posbuffer;

flat varying int textureoffset;

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
	vec4 orig = Texel(texture,texture_coords);

	vec2 coordinatecompressedlocation = vec2(textureoffset % 512, (textureoffset - (textureoffset % 512)) / 512) / 512.0; // Transision from 1d space to 2d space
	vec4 coordinatecompresed = Texel(posbuffer,coordinatecompressedlocation); // Get the screen location data
	vec2 coordinate = vec2(coordinatecompresed.r * 255.0 + (coordinatecompresed.g * 255.0 * 255.0), 
		coordinatecompresed.b * 255.0 + (coordinatecompresed.a * 255.0 * 255.0)); // Change 4 bytes to 2 shorts

	vec4 point = Texel(shadowbuffer,coordinate/textureSize2D(shadowbuffer,0)); // Sample the shadowmap

	if (point.r < 0.1)
	{
		point.r = 0.0;point.g = 0.0;point.b = 0.0;
	}
	else
	{
		point.r = 1.0;point.g = 1.0;point.b = 1.0;
	}
	
	if (orig.a > 0.0)
	{
		orig.a = 1.0;
	}

	
	orig.a *= point.r;
	
	return orig*color;
}
#endif
