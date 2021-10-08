#version 150

uniform sampler2D Sampler0;
uniform sampler2D Sampler2;

uniform vec4 ColorModulator;

in vec4 vertexColor;
in vec2 texCoord0;
in vec4 normal;

out vec4 fragColor;

void main() {
    vec4 color = textureLod(Sampler0, texCoord0,0);
    if (color.a < 0.1) {
        discard;
    }
    else if(color.a == 1.0 || color.a < 0.9){
        fragColor = color * vertexColor * ColorModulator;
    }
    else if(color.a < 0.95) fragColor = vec4(color.rgb, 1.0);
    else fragColor = color;
}
