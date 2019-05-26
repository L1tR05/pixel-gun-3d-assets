//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/MobileBloom" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Bloom ("Bloom (RGB)", 2D) = "black" { }
}
SubShader {
 Pass {
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 59120
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
uniform sampler2D _Bloom;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) + texture2D (_Bloom, xlv_TEXCOORD0));
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
uniform sampler2D _Bloom;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) + texture2D (_Bloom, xlv_TEXCOORD0));
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
uniform sampler2D _Bloom;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) + texture2D (_Bloom, xlv_TEXCOORD0));
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
 Pass {
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 91798
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _OffsetsA;
uniform mediump vec4 _OffsetsB;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xy + _OffsetsA.xy);
  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xy + _OffsetsA.zw);
  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xy + _OffsetsB.xy);
  xlv_TEXCOORD4 = (_glesMultiTexCoord0.xy + _OffsetsB.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Parameter;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (clamp ((
    max (max (texture2D (_MainTex, xlv_TEXCOORD0), texture2D (_MainTex, xlv_TEXCOORD1)), max (max (texture2D (_MainTex, xlv_TEXCOORD2), texture2D (_MainTex, xlv_TEXCOORD3)), texture2D (_MainTex, xlv_TEXCOORD4)))
   - _Parameter.z), 0.0, 1.0) * _Parameter.w);
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
uniform mediump vec4 _OffsetsA;
uniform mediump vec4 _OffsetsB;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xy + _OffsetsA.xy);
  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xy + _OffsetsA.zw);
  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xy + _OffsetsB.xy);
  xlv_TEXCOORD4 = (_glesMultiTexCoord0.xy + _OffsetsB.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Parameter;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (clamp ((
    max (max (texture2D (_MainTex, xlv_TEXCOORD0), texture2D (_MainTex, xlv_TEXCOORD1)), max (max (texture2D (_MainTex, xlv_TEXCOORD2), texture2D (_MainTex, xlv_TEXCOORD3)), texture2D (_MainTex, xlv_TEXCOORD4)))
   - _Parameter.z), 0.0, 1.0) * _Parameter.w);
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
uniform mediump vec4 _OffsetsA;
uniform mediump vec4 _OffsetsB;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xy + _OffsetsA.xy);
  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xy + _OffsetsA.zw);
  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xy + _OffsetsB.xy);
  xlv_TEXCOORD4 = (_glesMultiTexCoord0.xy + _OffsetsB.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Parameter;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (clamp ((
    max (max (texture2D (_MainTex, xlv_TEXCOORD0), texture2D (_MainTex, xlv_TEXCOORD1)), max (max (texture2D (_MainTex, xlv_TEXCOORD2), texture2D (_MainTex, xlv_TEXCOORD3)), texture2D (_MainTex, xlv_TEXCOORD4)))
   - _Parameter.z), 0.0, 1.0) * _Parameter.w);
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
 Pass {
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 159798
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _OffsetsA;
uniform mediump vec4 _OffsetsB;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = (_glesMultiTexCoord0.xy + _OffsetsA.xy);
  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xy + _OffsetsA.zw);
  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xy + _OffsetsB.xy);
  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xy + _OffsetsB.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 color_1;
  color_1 = (texture2D (_MainTex, xlv_TEXCOORD0) + texture2D (_MainTex, xlv_TEXCOORD1));
  color_1 = (color_1 + texture2D (_MainTex, xlv_TEXCOORD2));
  color_1 = (color_1 + texture2D (_MainTex, xlv_TEXCOORD3));
  lowp vec4 tmpvar_2;
  tmpvar_2 = (color_1 * 0.25);
  gl_FragData[0] = tmpvar_2;
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
uniform mediump vec4 _OffsetsA;
uniform mediump vec4 _OffsetsB;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = (_glesMultiTexCoord0.xy + _OffsetsA.xy);
  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xy + _OffsetsA.zw);
  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xy + _OffsetsB.xy);
  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xy + _OffsetsB.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 color_1;
  color_1 = (texture2D (_MainTex, xlv_TEXCOORD0) + texture2D (_MainTex, xlv_TEXCOORD1));
  color_1 = (color_1 + texture2D (_MainTex, xlv_TEXCOORD2));
  color_1 = (color_1 + texture2D (_MainTex, xlv_TEXCOORD3));
  lowp vec4 tmpvar_2;
  tmpvar_2 = (color_1 * 0.25);
  gl_FragData[0] = tmpvar_2;
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
uniform mediump vec4 _OffsetsA;
uniform mediump vec4 _OffsetsB;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = (_glesMultiTexCoord0.xy + _OffsetsA.xy);
  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xy + _OffsetsA.zw);
  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xy + _OffsetsB.xy);
  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xy + _OffsetsB.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 color_1;
  color_1 = (texture2D (_MainTex, xlv_TEXCOORD0) + texture2D (_MainTex, xlv_TEXCOORD1));
  color_1 = (color_1 + texture2D (_MainTex, xlv_TEXCOORD2));
  color_1 = (color_1 + texture2D (_MainTex, xlv_TEXCOORD3));
  lowp vec4 tmpvar_2;
  tmpvar_2 = (color_1 * 0.25);
  gl_FragData[0] = tmpvar_2;
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