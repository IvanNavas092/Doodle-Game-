shader_type canvas_item;

uniform float speed;

void fragment() {
	vec4 c = texture(TEXTURE, UV);
	vec4 MODULATE = COLOR / c;
	COLOR =  texture(TEXTURE, vec2(UV.x,UV.y-TIME*speed)) *  MODULATE;
}




//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
