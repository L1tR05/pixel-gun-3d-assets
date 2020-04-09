//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/BlitToDepth_MSAA" {
Properties {
_MainTex ("DepthTexture", any) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  Cull Off
  GpuProgramID 55646
Program "vp" {
}
Program "fp" {
}
}
}
}