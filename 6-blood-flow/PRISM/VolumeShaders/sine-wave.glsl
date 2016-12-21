vec4 volumeSample = texture3D( volumes[volIndex], pos );
float sineVal = .75 + sin( 1000.0 * volumeSample.x - time * float(5.0) ) /  4.0;
sampleRGBA.rgb *= sineVal;
