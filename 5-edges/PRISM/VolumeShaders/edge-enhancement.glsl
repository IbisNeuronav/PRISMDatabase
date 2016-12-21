// param initialization
float sampleThreshold = 0.05;
float gradStep = 0.0005;

// shading
vec4 sample = SampleVolumeWithTF( volIndex, pos );
if( sample.a > sampleThreshold )
{
	vec4 n = ComputeGradient( volIndex, pos, gradStep );
	if( n.a > 0.0 )
	{
		float cosAngle = abs(dot( rayDir, n.rgb ));
		float factor = ( 1.0 - cosAngle ) * n.a;
		float factor2 = smoothstep( 0.02, 0.06, factor);
		sampleRGBA = vec4( 0.0, 0.0, 0.0, factor2 );
	}
}
