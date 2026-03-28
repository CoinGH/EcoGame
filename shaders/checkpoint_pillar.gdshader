shader_type canvas_item;

// Залиш тут ТАКІ САМІ значення кольору і швидкості, як у базі, щоб вони працювали синхронно!
uniform vec4 glow_color : source_color = vec4(1.0, 0.9, 0.0, 1.0);
uniform float speed = 3.0;        
uniform float beam_width = 0.4;   // Ширина стовпа

// Нові параметри для м'якості градієнта
uniform float top_fade_softness = 0.8;  // Наскільки м'яко промінь зникає зверху
uniform float bottom_fade_softness = 0.2; // Наскільки м'яко він починається знизу (ось тут ми і лікуємо квадрат!)

void fragment() {
    // 1. Створюємо двонаправлений градієнт по вертикалі (Y)
    // Godot UV.y: 1.0 = низ, 0.0 = верх.
    // Ми робимо промінь opaque в центрі, і fade на краях.
    float vertical_fade_top = smoothstep(top_fade_softness, 1.0, UV.y); // Робить прозорим верх
    float vertical_fade_bottom = 1.0 - smoothstep(1.0 - bottom_fade_softness, 1.0, UV.y); // Робить прозорим САМИЙ НИЗ!

    // Множимо їх, щоб отримати промінь, що розчиняється і зверху, і знизу
    float vertical_fade = vertical_fade_top * vertical_fade_bottom;

    // 2. М'які краї зліва і справа.
    // Рахуємо відстань від центру (0.5) і розмиваємо краї через smoothstep.
    float dist_x = abs(UV.x - 0.5);
    float horizontal_fade = smoothstep(beam_width, beam_width - 0.2, dist_x);
    
    // 3. Та сама пульсація від часу
    float pulse = (sin(TIME * speed) + 1.0) * 0.35 + 0.3;
    
    // 4. Множимо всі прозорості одна на одну і віддаємо колір
    // Ми множимо прозорість і кольору, і пульсації, і всіх градієнтів.
    COLOR = vec4(glow_color.rgb, glow_color.a * pulse * vertical_fade * horizontal_fade);
}