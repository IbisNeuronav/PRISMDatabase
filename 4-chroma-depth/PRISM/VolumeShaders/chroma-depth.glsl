vec4 sampleAlpha = SampleVolumeWithTF( volIndex, pos ); 
float distCam = length( pos - cameraPosition );
float normalizedDistCam = ( distCam - volumeDistanceRange.x ) / ( volumeDistanceRange.y - volumeDistanceRange.x );
vec4 sampleRGB = texture1D( transferFunctions[volIndex], normalizedDistCam );
sampleRGB.a = sampleAlpha.a;
sampleRGBA += sampleRGB;