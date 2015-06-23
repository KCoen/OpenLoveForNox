#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
	return transform_projection*vertex_position;
}
#endif

#ifdef PIXEL
#extension GL_EXT_gpu_shader4 : require
extern Image imgOverlay;
extern vec4 quadInfoA;
extern vec4 quadInfoB;
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
	vec4 lquadInfoA = quadInfoA / textureSize2D(texture,0).x;
	vec4 lquadInfoB = quadInfoB / textureSize2D(imgOverlay,0).x;
	vec4 orig = Texel(texture,texture_coords);
	
	if (orig.r == 1.0 && orig.g == 0.0 && orig.b == 1.0 && orig.a > 0.1 && orig.a < 0.9)
	{
		orig = Texel(imgOverlay,lquadInfoB.xy + (texture_coords - lquadInfoA.xy));
	}
	
	return orig;
}
#endif
