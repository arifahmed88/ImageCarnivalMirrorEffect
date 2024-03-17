//
//  sheder.metal
//  CarnivalMirrorEffect
//
//  Created by ArifAhmed on 17/3/24.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]] float2 pixellete(float2 position,float size){
    float2 pixellatePosition = round(position/size)*size;
    return pixellatePosition;
}


[[ stitchable ]] float2 wave(float2 position,float time, float speed, float frquency, float amplitude){
    float positionY = position.y + sin((time * speed) + (position.x/frquency)) *amplitude;
    return float2(position.x,positionY);
}

[[ stitchable ]] float2 carnivalMirror(float2 position,float wavelength){
    if (wavelength <= 0){
        return  position;
    }
    float multiplier = 1.5;
    float xWavelength = wavelength;
    float xAmount = wavelength*multiplier;
    float yWavelength = wavelength;
    float yAmount = wavelength*multiplier;
    float y = position.y + sin(position.y / yWavelength) * yAmount;
    float x = position.x + sin(position.x / xWavelength) * xAmount;
    return float2(x,y);
}
