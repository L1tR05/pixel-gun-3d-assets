//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Glow 11/Downsample" {
Properties {
_MainTex ("MainTex", 2D) = "white" { }
_Strength ("Strength", Float) = 0.25
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 35731
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_TexelSize;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD0_1;
varying mediump vec4 xlv_TEXCOORD0_2;
varying mediump vec4 xlv_TEXCOORD0_3;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec4 uv_2;
  mediump vec4 tmpvar_3;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp vec2 inUV_8;
  inUV_8 = tmpvar_1;
  highp vec4 tmpvar_9;
  tmpvar_9.zw = vec2(0.0, 0.0);
  tmpvar_9.xy = inUV_8;
  uv_2.xy = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * tmpvar_9).xy;
  uv_2.zw = vec2(0.0, 0.0);
  highp float tmpvar_10;
  tmpvar_10 = _MainTex_TexelSize.x;
  highp float tmpvar_11;
  tmpvar_11 = _MainTex_TexelSize.y;
  highp vec4 tmpvar_12;
  tmpvar_12.zw = vec2(0.0, 1.0);
  highp float tmpvar_13;
  tmpvar_13 = -(_MainTex_TexelSize.x);
  tmpvar_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = -(_MainTex_TexelSize.y);
  tmpvar_12.y = tmpvar_14;
  tmpvar_3 = (uv_2 + tmpvar_12);
  highp vec4 tmpvar_15;
  tmpvar_15.zw = vec2(0.0, 1.0);
  tmpvar_15.x = tmpvar_10;
  tmpvar_15.y = tmpvar_14;
  tmpvar_4 = (uv_2 + tmpvar_15);
  highp vec4 tmpvar_16;
  tmpvar_16.zw = vec2(0.0, 1.0);
  tmpvar_16.x = tmpvar_10;
  tmpvar_16.y = tmpvar_11;
  tmpvar_5 = (uv_2 + tmpvar_16);
  highp vec4 tmpvar_17;
  tmpvar_17.zw = vec2(0.0, 1.0);
  tmpvar_17.x = tmpvar_13;
  tmpvar_17.y = tmpvar_11;
  tmpvar_6 = (uv_2 + tmpvar_17);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD0_1 = tmpvar_4;
  xlv_TEXCOORD0_2 = tmpvar_5;
  xlv_TEXCOORD0_3 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Strength;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD0_1;
varying mediump vec4 xlv_TEXCOORD0_2;
varying mediump vec4 xlv_TEXCOORD0_3;
void main ()
{
  lowp vec4 c_1;
  c_1 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) + texture2D (_MainTex, xlv_TEXCOORD0_1.xy));
  c_1 = (c_1 + texture2D (_MainTex, xlv_TEXCOORD0_2.xy));
  c_1 = (c_1 + texture2D (_MainTex, xlv_TEXCOORD0_3.xy));
  c_1 = (c_1 * _Strength);
  gl_FragData[0] = c_1;
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
uniform highp vec4 _MainTex_TexelSize;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD0_1;
varying mediump vec4 xlv_TEXCOORD0_2;
varying mediump vec4 xlv_TEXCOORD0_3;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec4 uv_2;
  mediump vec4 tmpvar_3;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp vec2 inUV_8;
  inUV_8 = tmpvar_1;
  highp vec4 tmpvar_9;
  tmpvar_9.zw = vec2(0.0, 0.0);
  tmpvar_9.xy = inUV_8;
  uv_2.xy = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * tmpvar_9).xy;
  uv_2.zw = vec2(0.0, 0.0);
  highp float tmpvar_10;
  tmpvar_10 = _MainTex_TexelSize.x;
  highp float tmpvar_11;
  tmpvar_11 = _MainTex_TexelSize.y;
  highp vec4 tmpvar_12;
  tmpvar_12.zw = vec2(0.0, 1.0);
  highp float tmpvar_13;
  tmpvar_13 = -(_MainTex_TexelSize.x);
  tmpvar_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = -(_MainTex_TexelSize.y);
  tmpvar_12.y = tmpvar_14;
  tmpvar_3 = (uv_2 + tmpvar_12);
  highp vec4 tmpvar_15;
  tmpvar_15.zw = vec2(0.0, 1.0);
  tmpvar_15.x = tmpvar_10;
  tmpvar_15.y = tmpvar_14;
  tmpvar_4 = (uv_2 + tmpvar_15);
  highp vec4 tmpvar_16;
  tmpvar_16.zw = vec2(0.0, 1.0);
  tmpvar_16.x = tmpvar_10;
  tmpvar_16.y = tmpvar_11;
  tmpvar_5 = (uv_2 + tmpvar_16);
  highp vec4 tmpvar_17;
  tmpvar_17.zw = vec2(0.0, 1.0);
  tmpvar_17.x = tmpvar_13;
  tmpvar_17.y = tmpvar_11;
  tmpvar_6 = (uv_2 + tmpvar_17);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD0_1 = tmpvar_4;
  xlv_TEXCOORD0_2 = tmpvar_5;
  xlv_TEXCOORD0_3 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Strength;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD0_1;
varying mediump vec4 xlv_TEXCOORD0_2;
varying mediump vec4 xlv_TEXCOORD0_3;
void main ()
{
  lowp vec4 c_1;
  c_1 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) + texture2D (_MainTex, xlv_TEXCOORD0_1.xy));
  c_1 = (c_1 + texture2D (_MainTex, xlv_TEXCOORD0_2.xy));
  c_1 = (c_1 + texture2D (_MainTex, xlv_TEXCOORD0_3.xy));
  c_1 = (c_1 * _Strength);
  gl_FragData[0] = c_1;
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
uniform highp vec4 _MainTex_TexelSize;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD0_1;
varying mediump vec4 xlv_TEXCOORD0_2;
varying mediump vec4 xlv_TEXCOORD0_3;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec4 uv_2;
  mediump vec4 tmpvar_3;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp vec2 inUV_8;
  inUV_8 = tmpvar_1;
  highp vec4 tmpvar_9;
  tmpvar_9.zw = vec2(0.0, 0.0);
  tmpvar_9.xy = inUV_8;
  uv_2.xy = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * tmpvar_9).xy;
  uv_2.zw = vec2(0.0, 0.0);
  highp float tmpvar_10;
  tmpvar_10 = _MainTex_TexelSize.x;
  highp float tmpvar_11;
  tmpvar_11 = _MainTex_TexelSize.y;
  highp vec4 tmpvar_12;
  tmpvar_12.zw = vec2(0.0, 1.0);
  highp float tmpvar_13;
  tmpvar_13 = -(_MainTex_TexelSize.x);
  tmpvar_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = -(_MainTex_TexelSize.y);
  tmpvar_12.y = tmpvar_14;
  tmpvar_3 = (uv_2 + tmpvar_12);
  highp vec4 tmpvar_15;
  tmpvar_15.zw = vec2(0.0, 1.0);
  tmpvar_15.x = tmpvar_10;
  tmpvar_15.y = tmpvar_14;
  tmpvar_4 = (uv_2 + tmpvar_15);
  highp vec4 tmpvar_16;
  tmpvar_16.zw = vec2(0.0, 1.0);
  tmpvar_16.x = tmpvar_10;
  tmpvar_16.y = tmpvar_11;
  tmpvar_5 = (uv_2 + tmpvar_16);
  highp vec4 tmpvar_17;
  tmpvar_17.zw = vec2(0.0, 1.0);
  tmpvar_17.x = tmpvar_13;
  tmpvar_17.y = tmpvar_11;
  tmpvar_6 = (uv_2 + tmpvar_17);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD0_1 = tmpvar_4;
  xlv_TEXCOORD0_2 = tmpvar_5;
  xlv_TEXCOORD0_3 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Strength;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD0_1;
varying mediump vec4 xlv_TEXCOORD0_2;
varying mediump vec4 xlv_TEXCOORD0_3;
void main ()
{
  lowp vec4 c_1;
  c_1 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) + texture2D (_MainTex, xlv_TEXCOORD0_1.xy));
  c_1 = (c_1 + texture2D (_MainTex, xlv_TEXCOORD0_2.xy));
  c_1 = (c_1 + texture2D (_MainTex, xlv_TEXCOORD0_3.xy));
  c_1 = (c_1 * _Strength);
  gl_FragData[0] = c_1;
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
  GpuProgramID 124551
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Strength;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Strength);
  gl_FragData[0] = tmpvar_1;
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
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Strength;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Strength);
  gl_FragData[0] = tmpvar_1;
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
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Strength;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Strength);
  gl_FragData[0] = tmpvar_1;
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