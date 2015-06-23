#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
	return transform_projection*vertex_position;
}
#endif

#ifdef PIXEL
extern Image canvas;
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
	vec4 pixel = Texel(texture,texture_coords);
	vec4 canvas_px = Texel(canvas,texture_coords);
	return pixel*(canvas_px*2.0);
}
#endif
