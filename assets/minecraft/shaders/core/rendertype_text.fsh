#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = textureLod(Sampler0, texCoord0,0) * vertexColor * ColorModulator;
    if (color.a == 0.0 || (color.r + color.g + color.b < 0.75 && color.r + color.g + color.b > 0.5) || (color.r + color.g + color.b == 0.0 && color.a < 0.15)) {
        discard;
    }
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
