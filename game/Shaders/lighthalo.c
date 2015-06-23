#ifdef VERTEX
vec4 position(mat4 transform_projection, vec4 vertex_position)
{
	return transform_projection*vertex_position;
}
#endif

#ifdef PIXEL
extern vec3 light_pos = vec3(0,0,0);
extern vec3 light_info = vec3(1);
extern float cam_scale = 1.0;
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
	vec4 pixel = color;
	
	vec3 lightvec = vec3(screen_coords.x-light_pos.x,screen_coords.y-(love_ScreenSize.y-light_pos.y),light_pos.z);
	float dist = length(lightvec)/light_info.x*cam_scale;
	pixel.rgb *= pow(max(0.0,1.0-dist),light_info.z)*light_info.y;
	
	return pixel;
}
#endif