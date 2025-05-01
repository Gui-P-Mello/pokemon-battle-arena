shader_type spatial;

uniform sampler2D fire_texture;
uniform vec4 tint_color = vec4(1.0, 0.4, 0.1, 1.0);
uniform float emissive_strength = 2.5;
uniform float scroll_speed = 0.5;

void fragment() {
    vec2 uv = UV;
    uv.y += TIME * scroll_speed;

    vec4 tex = texture(fire_texture, uv);

    ALBEDO = tint_color.rgb * tex.r;
    EMISSION = ALBEDO * emissive_strength;
    ALPHA = tex.r;
}
