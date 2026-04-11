#version 300 es
precision highp float;

in vec2 v_texcoord;
out vec4 fragColor;

uniform sampler2D tex;
uniform vec2 screenSize;

void main() {
    float pixelSize = 1.0; // Increase for chunkier pixels

    // Compute pixelated UV
    vec2 pos = floor(v_texcoord * screenSize / pixelSize) * pixelSize / screenSize;

    fragColor = texture(tex, pos);
}
