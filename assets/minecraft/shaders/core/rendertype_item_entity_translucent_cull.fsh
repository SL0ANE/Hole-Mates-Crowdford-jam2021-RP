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
in vec2 texCoord1;
in vec4 normal;

out vec4 fragColor;

void main() {
    vec4 color = textureLod(Sampler0, texCoord0,0);
    if (color.a < 0.1) {
        discard;
    }
    else if(color.a == 1.0 || color.a < 0.9){
        color *= vertexColor * ColorModulator;
    }
    else if(color.a < 0.95) color = vec4(color.rgb, 1.0);
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
