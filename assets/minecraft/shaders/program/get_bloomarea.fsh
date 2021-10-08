#version 150

uniform sampler2D DiffuseSampler;

uniform vec4 ColorModulate;

in vec2 texCoord;

out vec4 fragColor;

void main(){
    vec4 color = texture(DiffuseSampler, texCoord);
    if(color.a > 0.95 && color.a < 1.0) fragColor = color;
    else fragColor = vec4(0.0,0.0,0.0,0.0);
}
