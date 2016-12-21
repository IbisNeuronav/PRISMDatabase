// param initialization
float gradStep = 0.01;
vec3 lightPos = lightPosition;
float diffuseK = 0.5;
vec3 diffuseColor = vec3( 1.0, 1.0, 1.0 );
float specularK = 0.6;
float specularExp = 50.0;
vec3 specularColor = vec3( 1.0, 1.0, 1.0 );

// shading
vec4 sample = SampleVolumeWithTF( volIndex, pos );
sampleRGBA += sample;
if( sample.a > 0.1 )
{
    vec3 n = ComputeGradient( volIndex, pos, gradStep ).rgb;
    vec3 l = normalize( lightPos - pos );
	vec3 v = -1.0 * rayDir;
	float dotNL = dot( n, l );
    vec3 diffuseContrib = clamp(dotNL, 0.0, 1.0 ) * diffuseColor * diffuseK;
	sampleRGBA.rgb += diffuseContrib;

	if( dotNL > 0.0 )
	{
		vec3 h = normalize( l + v );
		float spectFactor = clamp( dot(n,h), 0.0, 1.0 );
		vec3 specularContrib = specularK * pow( spectFactor, specularExp ) * specularColor;
    	sampleRGBA.rgb += specularContrib;
	}
}
