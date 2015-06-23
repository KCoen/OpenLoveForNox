#ifdef VERTEX
#extension GL_EXT_gpu_shader4 : require
#extension GL_ARB_draw_instanced : require

flat varying int instanceid;

vec4 position( mat4 transform_projection, vec4 vertex_position )
{
	//if (gl_VertexID == 0)
	//	instanceid = 128;
	//else
	
	instanceid = (gl_VertexID - (gl_VertexID % 4)) / 4;
	
	return transform_projection*vertex_position;
}
#endif

#ifdef PIXEL
#extension GL_EXT_gpu_shader4 : require
#extension GL_ARB_draw_instanced : require

extern vec4 Color1;
extern vec4 Color2;
extern vec4 Color3;
extern vec4 Color4;
extern vec4 Color5;
extern vec4 Color6;
flat varying int instanceid;

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
	vec4 orig = Texel(texture,texture_coords);

	if (false && orig.a > 0.0 && orig.a < 1.0)
	{
		float id = orig.a * 255.0;
		if(id < 12.0)
		{
			// Unknown use
		}
		else if(id > 12.0 && id < 28.0)
		{
			orig.rgb = Color1.rgb * (orig.r  / 32.0);
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
	
	
	if (orig.a > 0.0)
	{
		orig.a = 1.0;
	}
		
	return orig*color;
}
#endif
