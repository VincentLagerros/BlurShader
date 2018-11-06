varying mediump vec2 var_texcoord0;
uniform lowp sampler2D DIFFUSE_TEXTURE;
uniform lowp sampler2D DEPTH_BUFFER;
//uniform lowp sampler2D DEPTH_BUFFER2;
//uniform lowp sampler2D DEPTH_BUFFER3;

uniform lowp vec4 resolution;
uniform lowp vec4 si;

void main()
{
	int size = int(si.x + 0.5);
	int tim = int(si.y + 0.5);
	int try = 0;
	vec2 p = ( (gl_FragCoord.xy) / resolution.xy );
	vec4 c = texture2D(DEPTH_BUFFER, p);
	gl_FragColor = texture2D(DEPTH_BUFFER, (gl_FragCoord.xy) / resolution.xy ); //texture2D(DEPTH_BUFFER, cord);
	vec4 colors = vec4(0);
	vec2 off2 = vec2(-size*-tim- size*6);
		for (int i = 0; i < 12; i++) { 
			if (i == tim*3) 
				break;
			for (int q = 0; q < 12; q++) { 
				vec2 off = vec2(i*size - size*6,q*size - size*6);
				if (q == tim*3) 
					break;
			vec4 color = texture2D(DEPTH_BUFFER, ( (gl_FragCoord.xy + off.xy - off2.xy) / resolution.xy ));
			
			colors += color;
			
			}
			
			
		}
		//colors = colors/vec4((float)pow(tim*3,2));
		
		if(tim==1) {colors = colors/vec4(9);}	
		else if(tim==2) {colors = colors/vec4(36); }
		else if(tim==3) {colors = colors/vec4(81); }
		else if(tim==4) {colors = colors/vec4(144); }
		
		vec4 color = colors;
		gl_FragColor =  color;
	
}


