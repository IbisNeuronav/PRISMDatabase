vec4 sample = SampleVolumeWithTF( volIndex, pos ); 
if( currentLayer < wantedLayer )
{
    layerAlpha = layerAlpha + ( 1.0 - layerAlpha ) * sample.a;
    if( layerAlpha > T_high && sample.a < T_low )
    {
        currentLayer = currentLayer + 1;
        layerAlpha = 0.0;
    }
}
else
{
    sampleRGBA += sample;
}