#version 150

uniform sampler2D Sampler0;
uniform sampler2D Sampler2;

uniform vec4 ColorModulator;

in vec4 vertexColor;
in vec2 texCoord0;
in vec2 texCoord2;

out vec4 fragColor;

void main() {
    vec4 color = textureLod(Sampler0, texCoord0,0) * vertexColor;
    if (color.a < 0.1 || color.r + color.g + color.b < 1.0) {
        discard;
    }
    color = color * ColorModulator;
    fragColor = vec4(color.rgb,1.0);
}
