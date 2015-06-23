#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
	return transform_projection*vertex_position;
}
#endif

#ifdef PIXEL
#extension GL_EXT_gpu_shader4 : require
extern Image shadowbuffer;
extern vec2 pos;
extern bool wall;
extern bool type46;
extern vec4 Color1;
extern vec4 Color2;
extern vec4 Color3;
extern vec4 Color4;
extern vec4 Color5;
extern vec4 Color6;
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
	vec4 orig = Texel(texture,texture_coords);
	vec4 point = Texel(shadowbuffer,pos/textureSize2D(shadowbuffer,0));
	
	if (type46 && orig.a > 0.0 && orig.a < 1.0)
	{
		float id = orig.a * 255.0;
		if(id < 12.0)
		{
			// Unknown use
		}
		else if(id > 12.0 && id < 28.0)
		{
			orig.rgb = Color1.rgb * (orig.r /  32.0);
		}
		else if(id > 28.0 && id < 44.0)
		{
			orig.rgb = Color2.rgb * (orig.r  / 32.0);
		}
		else if(id > 44.0 && id < 66.0f)
		{
			orig.rgb = Color3.rgb * (orig.r  / 32.0);
		}
		else if(id > 66.0 && id < 76.0)
		{
			orig.rgb = Color4.rgb * (orig.r  / 32.0);
		}
		else if(id > 76.0 && id < 92.0)
		{
			orig.rgb = Color5.rgb * (orig.r  / 32.0);
		}
		else	
		{
			orig.rgb = Color6.rgb * (orig.r  / 32.0);
		}
		orig.a = 1.0;
	}
	
	if (wall)
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
	
	if (orig.a > 0.0)
	{
		orig.a = 1.0;
	}
	
	orig.a *= point.r;
	
	return orig*color;
}
#endif
