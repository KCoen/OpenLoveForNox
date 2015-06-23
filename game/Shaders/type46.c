#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
	return transform_projection*vertex_position;
}
#endif

#ifdef PIXEL
#extension GL_EXT_gpu_shader4 : require
extern vec4 Color1;
extern vec4 Color2;
extern vec4 Color3;
extern vec4 Color4;
extern vec4 Color5;
extern vec4 Color6;
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
	vec4 c = Texel(texture,texture_coords);
	
	if(c.a > 0.1 && c.a < 0.9) 
	{
		float id = c.a * 255.0;
		if(id < 12.0)
		{
			 // Unknown use
		}
		else if(id > 12.0 && id < 28.0)
		{
			c.rgb = Color1.rgb * (c.r  / 32.0);
		}
		else if(id > 28.0 && id < 44.0)
		{
			c.rgb = Color2.rgb * (c.r  / 32.0);
		}
		else if(id > 44.0 && id < 66.0f)
		{
			c.rgb = Color3.rgb * (c.r  / 32.0);
		}
		else if(id > 66.0 && id < 76.0)
		{
			c.rgb = Color4.rgb * (c.r  / 32.0);
		}
		else if(id > 76.0 && id < 92.0)
		{
			c.rgb = Color5.rgb * (c.r  / 32.0);
		}
		else	
		{
			c.rgb = Color6.rgb * (c.r  / 32.0);
		}
		c.a = 1.0;
	}
	
	return c*color;
}
#endif
