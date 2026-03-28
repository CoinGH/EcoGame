shader_type canvas_item;

uniform float speed : hint_range(0.0, 10.0) = 1.0;

void fragment() {
    float r = 0.5 + 0.5 * cos(TIME * speed);
    float g = 0.5 + 0.5 * cos(TIME * speed + 2.0);
    float b = 0.5 + 0.5 * cos(TIME * speed + 4.0);
    
    COLOR = vec4(r-0.2, g-0.2, b-0.2, 0.5);
}