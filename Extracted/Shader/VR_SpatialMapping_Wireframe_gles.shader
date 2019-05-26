//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "VR/SpatialMapping/Wireframe" {
Properties {
_WireThickness ("Wire Thickness", Range(0, 800)) = 100
}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 59481
Program "vp" {
}
Program "fp" {
}
Program "gp" {
}
}
}
}