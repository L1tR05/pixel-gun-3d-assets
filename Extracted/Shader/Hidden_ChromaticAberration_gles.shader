//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ChromaticAberration" {
Properties {
_MainTex ("Base", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 25553
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  highp vec2 P_3;
  highp vec2 tmpvar_4;
  tmpvar_4 = (_MainTex_TexelSize.xy * 0.5);
  P_3 = (xlv_TEXCOORD0 + tmpvar_4);
  tmpvar_2 = texture2D (_MainTex, P_3);
  c_1 = tmpvar_2;
  lowp vec4 tmpvar_5;
  highp vec2 P_6;
  P_6 = (xlv_TEXCOORD0 - tmpvar_4);
  tmpvar_5 = texture2D (_MainTex, P_6);
  c_1 = (c_1 + tmpvar_5);
  lowp vec4 tmpvar_7;
  highp vec2 P_8;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_MainTex_TexelSize.xy * vec2(0.5, -0.5));
  P_8 = (xlv_TEXCOORD0 + tmpvar_9);
  tmpvar_7 = texture2D (_MainTex, P_8);
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD0 - tmpvar_9);
  tmpvar_10 = texture2D (_MainTex, P_11);
  c_1 = (c_1 + tmpvar_10);
  gl_FragData[0] = (c_1 / 4.0);
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  highp vec2 P_3;
  highp vec2 tmpvar_4;
  tmpvar_4 = (_MainTex_TexelSize.xy * 0.5);
  P_3 = (xlv_TEXCOORD0 + tmpvar_4);
  tmpvar_2 = texture2D (_MainTex, P_3);
  c_1 = tmpvar_2;
  lowp vec4 tmpvar_5;
  highp vec2 P_6;
  P_6 = (xlv_TEXCOORD0 - tmpvar_4);
  tmpvar_5 = texture2D (_MainTex, P_6);
  c_1 = (c_1 + tmpvar_5);
  lowp vec4 tmpvar_7;
  highp vec2 P_8;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_MainTex_TexelSize.xy * vec2(0.5, -0.5));
  P_8 = (xlv_TEXCOORD0 + tmpvar_9);
  tmpvar_7 = texture2D (_MainTex, P_8);
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD0 - tmpvar_9);
  tmpvar_10 = texture2D (_MainTex, P_11);
  c_1 = (c_1 + tmpvar_10);
  gl_FragData[0] = (c_1 / 4.0);
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  highp vec2 P_3;
  highp vec2 tmpvar_4;
  tmpvar_4 = (_MainTex_TexelSize.xy * 0.5);
  P_3 = (xlv_TEXCOORD0 + tmpvar_4);
  tmpvar_2 = texture2D (_MainTex, P_3);
  c_1 = tmpvar_2;
  lowp vec4 tmpvar_5;
  highp vec2 P_6;
  P_6 = (xlv_TEXCOORD0 - tmpvar_4);
  tmpvar_5 = texture2D (_MainTex, P_6);
  c_1 = (c_1 + tmpvar_5);
  lowp vec4 tmpvar_7;
  highp vec2 P_8;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_MainTex_TexelSize.xy * vec2(0.5, -0.5));
  P_8 = (xlv_TEXCOORD0 + tmpvar_9);
  tmpvar_7 = texture2D (_MainTex, P_8);
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD0 - tmpvar_9);
  tmpvar_10 = texture2D (_MainTex, P_11);
  c_1 = (c_1 + tmpvar_10);
  gl_FragData[0] = (c_1 / 4.0);
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 71451
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
uniform mediump float _ChromaticAberration;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 color_1;
  mediump vec2 uvG_2;
  mediump vec2 uv_3;
  mediump vec2 coords_4;
  coords_4 = xlv_TEXCOORD0;
  uv_3 = xlv_TEXCOORD0;
  coords_4 = ((coords_4 - 0.5) * 2.0);
  mediump float tmpvar_5;
  tmpvar_5 = dot (coords_4, coords_4);
  highp vec2 tmpvar_6;
  tmpvar_6 = (uv_3 - ((_MainTex_TexelSize.xy * _ChromaticAberration) * (coords_4 * tmpvar_5)));
  uvG_2 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, uv_3);
  color_1.xzw = tmpvar_7.xzw;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, uvG_2);
  color_1.y = tmpvar_8.y;
  gl_FragData[0] = color_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
uniform mediump float _ChromaticAberration;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 color_1;
  mediump vec2 uvG_2;
  mediump vec2 uv_3;
  mediump vec2 coords_4;
  coords_4 = xlv_TEXCOORD0;
  uv_3 = xlv_TEXCOORD0;
  coords_4 = ((coords_4 - 0.5) * 2.0);
  mediump float tmpvar_5;
  tmpvar_5 = dot (coords_4, coords_4);
  highp vec2 tmpvar_6;
  tmpvar_6 = (uv_3 - ((_MainTex_TexelSize.xy * _ChromaticAberration) * (coords_4 * tmpvar_5)));
  uvG_2 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, uv_3);
  color_1.xzw = tmpvar_7.xzw;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, uvG_2);
  color_1.y = tmpvar_8.y;
  gl_FragData[0] = color_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
uniform mediump float _ChromaticAberration;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 color_1;
  mediump vec2 uvG_2;
  mediump vec2 uv_3;
  mediump vec2 coords_4;
  coords_4 = xlv_TEXCOORD0;
  uv_3 = xlv_TEXCOORD0;
  coords_4 = ((coords_4 - 0.5) * 2.0);
  mediump float tmpvar_5;
  tmpvar_5 = dot (coords_4, coords_4);
  highp vec2 tmpvar_6;
  tmpvar_6 = (uv_3 - ((_MainTex_TexelSize.xy * _ChromaticAberration) * (coords_4 * tmpvar_5)));
  uvG_2 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, uv_3);
  color_1.xzw = tmpvar_7.xzw;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, uvG_2);
  color_1.y = tmpvar_8.y;
  gl_FragData[0] = color_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 180563
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
uniform mediump float _ChromaticAberration;
uniform mediump float _AxialAberration;
uniform mediump float _Luminance;
mediump vec2 SmallDiscKernel[9];
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  SmallDiscKernel[0] = vec2(-0.926212, -0.40581);
  SmallDiscKernel[1] = vec2(-0.695914, 0.457137);
  SmallDiscKernel[2] = vec2(-0.203345, 0.820716);
  SmallDiscKernel[3] = vec2(0.96234, -0.194983);
  SmallDiscKernel[4] = vec2(0.473434, -0.480026);
  SmallDiscKernel[5] = vec2(0.519456, 0.767022);
  SmallDiscKernel[6] = vec2(0.185461, -0.893124);
  SmallDiscKernel[7] = vec2(0.89642, 0.412458);
  SmallDiscKernel[8] = vec2(-0.32194, -0.932615);
  mediump vec4 blurredTap_2;
  mediump float maxOfs_3;
  mediump vec4 color_4;
  mediump vec2 uv_5;
  mediump vec2 coords_6;
  coords_6 = xlv_TEXCOORD0;
  uv_5 = xlv_TEXCOORD0;
  coords_6 = ((coords_6 - 0.5) * 2.0);
  mediump float tmpvar_7;
  tmpvar_7 = dot (coords_6, coords_6);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, uv_5);
  color_4 = tmpvar_8;
  maxOfs_3 = clamp (max (_AxialAberration, (
    (_ChromaticAberration * tmpvar_7)
   * tmpvar_7)), -2.5, 2.5);
  blurredTap_2 = (color_4 * 0.2);
  for (highp int l_1 = 0; l_1 < 9; l_1++) {
    mediump vec3 tap_9;
    mediump vec2 sampleUV_10;
    highp vec2 tmpvar_11;
    tmpvar_11 = (uv_5 + ((SmallDiscKernel[l_1] * _MainTex_TexelSize.xy) * maxOfs_3));
    sampleUV_10 = tmpvar_11;
    lowp vec3 tmpvar_12;
    tmpvar_12 = texture2D (_MainTex, sampleUV_10).xyz;
    tap_9 = tmpvar_12;
    blurredTap_2.xyz = (blurredTap_2.xyz + tap_9);
  };
  blurredTap_2.xyz = (blurredTap_2.xyz / 9.2);
  color_4.y = mix (color_4.y, blurredTap_2.y, clamp (clamp (
    (_Luminance * abs((dot (blurredTap_2.xyz, vec3(0.22, 0.707, 0.071)) - dot (color_4.xyz, vec3(0.22, 0.707, 0.071)))))
  , 0.0, 1.0), 0.0, 1.0));
  gl_FragData[0] = color_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
uniform mediump float _ChromaticAberration;
uniform mediump float _AxialAberration;
uniform mediump float _Luminance;
mediump vec2 SmallDiscKernel[9];
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  SmallDiscKernel[0] = vec2(-0.926212, -0.40581);
  SmallDiscKernel[1] = vec2(-0.695914, 0.457137);
  SmallDiscKernel[2] = vec2(-0.203345, 0.820716);
  SmallDiscKernel[3] = vec2(0.96234, -0.194983);
  SmallDiscKernel[4] = vec2(0.473434, -0.480026);
  SmallDiscKernel[5] = vec2(0.519456, 0.767022);
  SmallDiscKernel[6] = vec2(0.185461, -0.893124);
  SmallDiscKernel[7] = vec2(0.89642, 0.412458);
  SmallDiscKernel[8] = vec2(-0.32194, -0.932615);
  mediump vec4 blurredTap_2;
  mediump float maxOfs_3;
  mediump vec4 color_4;
  mediump vec2 uv_5;
  mediump vec2 coords_6;
  coords_6 = xlv_TEXCOORD0;
  uv_5 = xlv_TEXCOORD0;
  coords_6 = ((coords_6 - 0.5) * 2.0);
  mediump float tmpvar_7;
  tmpvar_7 = dot (coords_6, coords_6);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, uv_5);
  color_4 = tmpvar_8;
  maxOfs_3 = clamp (max (_AxialAberration, (
    (_ChromaticAberration * tmpvar_7)
   * tmpvar_7)), -2.5, 2.5);
  blurredTap_2 = (color_4 * 0.2);
  for (highp int l_1 = 0; l_1 < 9; l_1++) {
    mediump vec3 tap_9;
    mediump vec2 sampleUV_10;
    highp vec2 tmpvar_11;
    tmpvar_11 = (uv_5 + ((SmallDiscKernel[l_1] * _MainTex_TexelSize.xy) * maxOfs_3));
    sampleUV_10 = tmpvar_11;
    lowp vec3 tmpvar_12;
    tmpvar_12 = texture2D (_MainTex, sampleUV_10).xyz;
    tap_9 = tmpvar_12;
    blurredTap_2.xyz = (blurredTap_2.xyz + tap_9);
  };
  blurredTap_2.xyz = (blurredTap_2.xyz / 9.2);
  color_4.y = mix (color_4.y, blurredTap_2.y, clamp (clamp (
    (_Luminance * abs((dot (blurredTap_2.xyz, vec3(0.22, 0.707, 0.071)) - dot (color_4.xyz, vec3(0.22, 0.707, 0.071)))))
  , 0.0, 1.0), 0.0, 1.0));
  gl_FragData[0] = color_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
uniform mediump float _ChromaticAberration;
uniform mediump float _AxialAberration;
uniform mediump float _Luminance;
mediump vec2 SmallDiscKernel[9];
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  SmallDiscKernel[0] = vec2(-0.926212, -0.40581);
  SmallDiscKernel[1] = vec2(-0.695914, 0.457137);
  SmallDiscKernel[2] = vec2(-0.203345, 0.820716);
  SmallDiscKernel[3] = vec2(0.96234, -0.194983);
  SmallDiscKernel[4] = vec2(0.473434, -0.480026);
  SmallDiscKernel[5] = vec2(0.519456, 0.767022);
  SmallDiscKernel[6] = vec2(0.185461, -0.893124);
  SmallDiscKernel[7] = vec2(0.89642, 0.412458);
  SmallDiscKernel[8] = vec2(-0.32194, -0.932615);
  mediump vec4 blurredTap_2;
  mediump float maxOfs_3;
  mediump vec4 color_4;
  mediump vec2 uv_5;
  mediump vec2 coords_6;
  coords_6 = xlv_TEXCOORD0;
  uv_5 = xlv_TEXCOORD0;
  coords_6 = ((coords_6 - 0.5) * 2.0);
  mediump float tmpvar_7;
  tmpvar_7 = dot (coords_6, coords_6);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, uv_5);
  color_4 = tmpvar_8;
  maxOfs_3 = clamp (max (_AxialAberration, (
    (_ChromaticAberration * tmpvar_7)
   * tmpvar_7)), -2.5, 2.5);
  blurredTap_2 = (color_4 * 0.2);
  for (highp int l_1 = 0; l_1 < 9; l_1++) {
    mediump vec3 tap_9;
    mediump vec2 sampleUV_10;
    highp vec2 tmpvar_11;
    tmpvar_11 = (uv_5 + ((SmallDiscKernel[l_1] * _MainTex_TexelSize.xy) * maxOfs_3));
    sampleUV_10 = tmpvar_11;
    lowp vec3 tmpvar_12;
    tmpvar_12 = texture2D (_MainTex, sampleUV_10).xyz;
    tap_9 = tmpvar_12;
    blurredTap_2.xyz = (blurredTap_2.xyz + tap_9);
  };
  blurredTap_2.xyz = (blurredTap_2.xyz / 9.2);
  color_4.y = mix (color_4.y, blurredTap_2.y, clamp (clamp (
    (_Luminance * abs((dot (blurredTap_2.xyz, vec3(0.22, 0.707, 0.071)) - dot (color_4.xyz, vec3(0.22, 0.707, 0.071)))))
  , 0.0, 1.0), 0.0, 1.0));
  gl_FragData[0] = color_4;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
}
}
}
}