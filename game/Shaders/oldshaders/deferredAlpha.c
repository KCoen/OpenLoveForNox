#ifdef VERTEX
vec4 position(mat4 transform_projection, vec4 vertex_position)
{
	return transform_projection*vertex_position;
}
#endif

#ifdef PIXEL
#extension GL_EXT_gpu_shader4 : require
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
	vec4 orig = Texel(texture,texture_coords)*color;
	vec2 size = textureSize2D(texture,0);
	
	float fmodResult = mod(floor(size.x*texture_coords.x)+floor(size.y*texture_coords.y),2.0);
	if (fmodResult < 1.0)
	{
		orig.a = 0.0;
	}
	/*else
	{
		orig.a = 1.0;
	}*/
	
	return orig;
}
#endif
