#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
	return transform_projection*vertex_position;
}
#endif

#ifdef PIXEL
extern number quality;
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
	vec4 orig = Texel(texture,texture_coords)*color;
	
	orig.rgb *= 255.0/quality;
	orig.r = floor(orig.r);
	orig.g = floor(orig.g);
	orig.b = floor(orig.b);
	orig.rgb /= 255.0/quality;
	
	return orig;
}
#endif
