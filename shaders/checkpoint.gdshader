shader_type canvas_item;

// Ці змінні з'являться в Інспекторі, їх можна буде крутити мишкою!
uniform vec4 glow_color : source_color = vec4(1.0, 0.9, 0.0, 1.0); // Жовтий колір
uniform float speed = 1.0;        // Швидкість пульсації
uniform float radius = 0.4;       // Радіус кола (від 0.0 до 0.5)
uniform float softness = 0.3;     // Розмиття країв (чим більше, тим м'якіше)

void fragment() {
    // 1. Зміщуємо центр координат (UV) в середину нашого квадрата
    vec2 center_uv = UV - vec2(0.5);
    
    // 2. Вираховуємо відстань від поточного пікселя до центру
    float dist = length(center_uv);
    
    // 3. Робимо м'який край через smoothstep (магія градієнта)
    // Якщо піксель ближче до центру - він непрозорий, якщо далі за radius - прозорий
    float alpha = smoothstep(radius, radius - softness, dist);
    
    // 4. Додаємо пульсацію через синус від вбудованого таймера TIME
    // sin() дає від -1 до 1. Ми трохи зсуваємо математику, щоб альфа стрибала від 0.3 до 1.0
    float pulse = (sin(TIME * speed) + 1.0) * 0.35 + 0.3;
    
    // 5. Віддаємо фінальний колір: беремо колір з Інспектора, а прозорість множимо на пульсацію
    COLOR = vec4(glow_color.rgb, alpha * pulse * glow_color.a);
}