//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Glow 11/Blur" {
Properties {
_MainTex ("", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 33023
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump float _offset1;
uniform mediump float _offset2;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  mediump vec2 tmpvar_3;
  mediump vec2 tmpvar_4;
  mediump vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_2.y = tmpvar_1.y;
  tmpvar_3.y = tmpvar_1.y;
  tmpvar_4.y = tmpvar_1.y;
  tmpvar_5.y = tmpvar_1.y;
  mediump float tmpvar_7;
  tmpvar_7 = (_offset1 * _MainTex_TexelSize.x);
  tmpvar_2.x = (_glesMultiTexCoord0.x - tmpvar_7);
  tmpvar_3.x = (_glesMultiTexCoord0.x + tmpvar_7);
  mediump float tmpvar_8;
  tmpvar_8 = (_offset2 * _MainTex_TexelSize.x);
  tmpvar_4.x = (_glesMultiTexCoord0.x - tmpvar_8);
  tmpvar_5.x = (_glesMultiTexCoord0.x + tmpvar_8);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD = tmpvar_1;
  xlv_TEXCOORD_1 = tmpvar_2;
  xlv_TEXCOORD_2 = tmpvar_3;
  xlv_TEXCOORD_3 = tmpvar_4;
  xlv_TEXCOORD_4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD) * 0.227027) + (
    (texture2D (_MainTex, xlv_TEXCOORD_1) + texture2D (_MainTex, xlv_TEXCOORD_2))
   * 0.3162162)) + ((texture2D (_MainTex, xlv_TEXCOORD_3) + texture2D (_MainTex, xlv_TEXCOORD_4)) * 0.07027027));
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
uniform mediump float _offset1;
uniform mediump float _offset2;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  mediump vec2 tmpvar_3;
  mediump vec2 tmpvar_4;
  mediump vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_2.y = tmpvar_1.y;
  tmpvar_3.y = tmpvar_1.y;
  tmpvar_4.y = tmpvar_1.y;
  tmpvar_5.y = tmpvar_1.y;
  mediump float tmpvar_7;
  tmpvar_7 = (_offset1 * _MainTex_TexelSize.x);
  tmpvar_2.x = (_glesMultiTexCoord0.x - tmpvar_7);
  tmpvar_3.x = (_glesMultiTexCoord0.x + tmpvar_7);
  mediump float tmpvar_8;
  tmpvar_8 = (_offset2 * _MainTex_TexelSize.x);
  tmpvar_4.x = (_glesMultiTexCoord0.x - tmpvar_8);
  tmpvar_5.x = (_glesMultiTexCoord0.x + tmpvar_8);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD = tmpvar_1;
  xlv_TEXCOORD_1 = tmpvar_2;
  xlv_TEXCOORD_2 = tmpvar_3;
  xlv_TEXCOORD_3 = tmpvar_4;
  xlv_TEXCOORD_4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD) * 0.227027) + (
    (texture2D (_MainTex, xlv_TEXCOORD_1) + texture2D (_MainTex, xlv_TEXCOORD_2))
   * 0.3162162)) + ((texture2D (_MainTex, xlv_TEXCOORD_3) + texture2D (_MainTex, xlv_TEXCOORD_4)) * 0.07027027));
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
uniform mediump float _offset1;
uniform mediump float _offset2;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  mediump vec2 tmpvar_3;
  mediump vec2 tmpvar_4;
  mediump vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_2.y = tmpvar_1.y;
  tmpvar_3.y = tmpvar_1.y;
  tmpvar_4.y = tmpvar_1.y;
  tmpvar_5.y = tmpvar_1.y;
  mediump float tmpvar_7;
  tmpvar_7 = (_offset1 * _MainTex_TexelSize.x);
  tmpvar_2.x = (_glesMultiTexCoord0.x - tmpvar_7);
  tmpvar_3.x = (_glesMultiTexCoord0.x + tmpvar_7);
  mediump float tmpvar_8;
  tmpvar_8 = (_offset2 * _MainTex_TexelSize.x);
  tmpvar_4.x = (_glesMultiTexCoord0.x - tmpvar_8);
  tmpvar_5.x = (_glesMultiTexCoord0.x + tmpvar_8);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD = tmpvar_1;
  xlv_TEXCOORD_1 = tmpvar_2;
  xlv_TEXCOORD_2 = tmpvar_3;
  xlv_TEXCOORD_3 = tmpvar_4;
  xlv_TEXCOORD_4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD) * 0.227027) + (
    (texture2D (_MainTex, xlv_TEXCOORD_1) + texture2D (_MainTex, xlv_TEXCOORD_2))
   * 0.3162162)) + ((texture2D (_MainTex, xlv_TEXCOORD_3) + texture2D (_MainTex, xlv_TEXCOORD_4)) * 0.07027027));
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
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 129910
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump float _offset1;
uniform mediump float _offset2;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  mediump vec2 tmpvar_3;
  mediump vec2 tmpvar_4;
  mediump vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_2.x = tmpvar_1.x;
  tmpvar_3.x = tmpvar_1.x;
  tmpvar_4.x = tmpvar_1.x;
  tmpvar_5.x = tmpvar_1.x;
  mediump float tmpvar_7;
  tmpvar_7 = (_offset1 * _MainTex_TexelSize.y);
  tmpvar_2.y = (_glesMultiTexCoord0.y - tmpvar_7);
  tmpvar_3.y = (_glesMultiTexCoord0.y + tmpvar_7);
  mediump float tmpvar_8;
  tmpvar_8 = (_offset2 * _MainTex_TexelSize.y);
  tmpvar_4.y = (_glesMultiTexCoord0.y - tmpvar_8);
  tmpvar_5.y = (_glesMultiTexCoord0.y + tmpvar_8);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD = tmpvar_1;
  xlv_TEXCOORD_1 = tmpvar_2;
  xlv_TEXCOORD_2 = tmpvar_3;
  xlv_TEXCOORD_3 = tmpvar_4;
  xlv_TEXCOORD_4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD) * 0.227027) + (
    (texture2D (_MainTex, xlv_TEXCOORD_1) + texture2D (_MainTex, xlv_TEXCOORD_2))
   * 0.3162162)) + ((texture2D (_MainTex, xlv_TEXCOORD_3) + texture2D (_MainTex, xlv_TEXCOORD_4)) * 0.07027027));
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
uniform mediump float _offset1;
uniform mediump float _offset2;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  mediump vec2 tmpvar_3;
  mediump vec2 tmpvar_4;
  mediump vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_2.x = tmpvar_1.x;
  tmpvar_3.x = tmpvar_1.x;
  tmpvar_4.x = tmpvar_1.x;
  tmpvar_5.x = tmpvar_1.x;
  mediump float tmpvar_7;
  tmpvar_7 = (_offset1 * _MainTex_TexelSize.y);
  tmpvar_2.y = (_glesMultiTexCoord0.y - tmpvar_7);
  tmpvar_3.y = (_glesMultiTexCoord0.y + tmpvar_7);
  mediump float tmpvar_8;
  tmpvar_8 = (_offset2 * _MainTex_TexelSize.y);
  tmpvar_4.y = (_glesMultiTexCoord0.y - tmpvar_8);
  tmpvar_5.y = (_glesMultiTexCoord0.y + tmpvar_8);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD = tmpvar_1;
  xlv_TEXCOORD_1 = tmpvar_2;
  xlv_TEXCOORD_2 = tmpvar_3;
  xlv_TEXCOORD_3 = tmpvar_4;
  xlv_TEXCOORD_4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD) * 0.227027) + (
    (texture2D (_MainTex, xlv_TEXCOORD_1) + texture2D (_MainTex, xlv_TEXCOORD_2))
   * 0.3162162)) + ((texture2D (_MainTex, xlv_TEXCOORD_3) + texture2D (_MainTex, xlv_TEXCOORD_4)) * 0.07027027));
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
uniform mediump float _offset1;
uniform mediump float _offset2;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  mediump vec2 tmpvar_3;
  mediump vec2 tmpvar_4;
  mediump vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_2.x = tmpvar_1.x;
  tmpvar_3.x = tmpvar_1.x;
  tmpvar_4.x = tmpvar_1.x;
  tmpvar_5.x = tmpvar_1.x;
  mediump float tmpvar_7;
  tmpvar_7 = (_offset1 * _MainTex_TexelSize.y);
  tmpvar_2.y = (_glesMultiTexCoord0.y - tmpvar_7);
  tmpvar_3.y = (_glesMultiTexCoord0.y + tmpvar_7);
  mediump float tmpvar_8;
  tmpvar_8 = (_offset2 * _MainTex_TexelSize.y);
  tmpvar_4.y = (_glesMultiTexCoord0.y - tmpvar_8);
  tmpvar_5.y = (_glesMultiTexCoord0.y + tmpvar_8);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD = tmpvar_1;
  xlv_TEXCOORD_1 = tmpvar_2;
  xlv_TEXCOORD_2 = tmpvar_3;
  xlv_TEXCOORD_3 = tmpvar_4;
  xlv_TEXCOORD_4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD) * 0.227027) + (
    (texture2D (_MainTex, xlv_TEXCOORD_1) + texture2D (_MainTex, xlv_TEXCOORD_2))
   * 0.3162162)) + ((texture2D (_MainTex, xlv_TEXCOORD_3) + texture2D (_MainTex, xlv_TEXCOORD_4)) * 0.07027027));
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
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 144551
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump float _offset1;
uniform mediump float _offset2;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  mediump vec2 tmpvar_3;
  mediump vec2 tmpvar_4;
  mediump vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_2.y = tmpvar_1.y;
  tmpvar_3.y = tmpvar_1.y;
  tmpvar_4.y = tmpvar_1.y;
  tmpvar_5.y = tmpvar_1.y;
  mediump float tmpvar_7;
  tmpvar_7 = (_offset1 * _MainTex_TexelSize.x);
  tmpvar_2.x = (_glesMultiTexCoord0.x - tmpvar_7);
  tmpvar_3.x = (_glesMultiTexCoord0.x + tmpvar_7);
  mediump float tmpvar_8;
  tmpvar_8 = (_offset2 * _MainTex_TexelSize.x);
  tmpvar_4.x = (_glesMultiTexCoord0.x - tmpvar_8);
  tmpvar_5.x = (_glesMultiTexCoord0.x + tmpvar_8);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD = tmpvar_1;
  xlv_TEXCOORD_1 = tmpvar_2;
  xlv_TEXCOORD_2 = tmpvar_3;
  xlv_TEXCOORD_3 = tmpvar_4;
  xlv_TEXCOORD_4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _varStrength;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD) * _varStrength.x) + (
    (texture2D (_MainTex, xlv_TEXCOORD_1) + texture2D (_MainTex, xlv_TEXCOORD_2))
   * _varStrength.y)) + ((texture2D (_MainTex, xlv_TEXCOORD_3) + texture2D (_MainTex, xlv_TEXCOORD_4)) * _varStrength.z));
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
uniform mediump float _offset1;
uniform mediump float _offset2;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  mediump vec2 tmpvar_3;
  mediump vec2 tmpvar_4;
  mediump vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_2.y = tmpvar_1.y;
  tmpvar_3.y = tmpvar_1.y;
  tmpvar_4.y = tmpvar_1.y;
  tmpvar_5.y = tmpvar_1.y;
  mediump float tmpvar_7;
  tmpvar_7 = (_offset1 * _MainTex_TexelSize.x);
  tmpvar_2.x = (_glesMultiTexCoord0.x - tmpvar_7);
  tmpvar_3.x = (_glesMultiTexCoord0.x + tmpvar_7);
  mediump float tmpvar_8;
  tmpvar_8 = (_offset2 * _MainTex_TexelSize.x);
  tmpvar_4.x = (_glesMultiTexCoord0.x - tmpvar_8);
  tmpvar_5.x = (_glesMultiTexCoord0.x + tmpvar_8);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD = tmpvar_1;
  xlv_TEXCOORD_1 = tmpvar_2;
  xlv_TEXCOORD_2 = tmpvar_3;
  xlv_TEXCOORD_3 = tmpvar_4;
  xlv_TEXCOORD_4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _varStrength;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD) * _varStrength.x) + (
    (texture2D (_MainTex, xlv_TEXCOORD_1) + texture2D (_MainTex, xlv_TEXCOORD_2))
   * _varStrength.y)) + ((texture2D (_MainTex, xlv_TEXCOORD_3) + texture2D (_MainTex, xlv_TEXCOORD_4)) * _varStrength.z));
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
uniform mediump float _offset1;
uniform mediump float _offset2;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  mediump vec2 tmpvar_3;
  mediump vec2 tmpvar_4;
  mediump vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_2.y = tmpvar_1.y;
  tmpvar_3.y = tmpvar_1.y;
  tmpvar_4.y = tmpvar_1.y;
  tmpvar_5.y = tmpvar_1.y;
  mediump float tmpvar_7;
  tmpvar_7 = (_offset1 * _MainTex_TexelSize.x);
  tmpvar_2.x = (_glesMultiTexCoord0.x - tmpvar_7);
  tmpvar_3.x = (_glesMultiTexCoord0.x + tmpvar_7);
  mediump float tmpvar_8;
  tmpvar_8 = (_offset2 * _MainTex_TexelSize.x);
  tmpvar_4.x = (_glesMultiTexCoord0.x - tmpvar_8);
  tmpvar_5.x = (_glesMultiTexCoord0.x + tmpvar_8);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD = tmpvar_1;
  xlv_TEXCOORD_1 = tmpvar_2;
  xlv_TEXCOORD_2 = tmpvar_3;
  xlv_TEXCOORD_3 = tmpvar_4;
  xlv_TEXCOORD_4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _varStrength;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD) * _varStrength.x) + (
    (texture2D (_MainTex, xlv_TEXCOORD_1) + texture2D (_MainTex, xlv_TEXCOORD_2))
   * _varStrength.y)) + ((texture2D (_MainTex, xlv_TEXCOORD_3) + texture2D (_MainTex, xlv_TEXCOORD_4)) * _varStrength.z));
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
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 222537
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump float _offset1;
uniform mediump float _offset2;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  mediump vec2 tmpvar_3;
  mediump vec2 tmpvar_4;
  mediump vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_2.x = tmpvar_1.x;
  tmpvar_3.x = tmpvar_1.x;
  tmpvar_4.x = tmpvar_1.x;
  tmpvar_5.x = tmpvar_1.x;
  mediump float tmpvar_7;
  tmpvar_7 = (_offset1 * _MainTex_TexelSize.y);
  tmpvar_2.y = (_glesMultiTexCoord0.y - tmpvar_7);
  tmpvar_3.y = (_glesMultiTexCoord0.y + tmpvar_7);
  mediump float tmpvar_8;
  tmpvar_8 = (_offset2 * _MainTex_TexelSize.y);
  tmpvar_4.y = (_glesMultiTexCoord0.y - tmpvar_8);
  tmpvar_5.y = (_glesMultiTexCoord0.y + tmpvar_8);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD = tmpvar_1;
  xlv_TEXCOORD_1 = tmpvar_2;
  xlv_TEXCOORD_2 = tmpvar_3;
  xlv_TEXCOORD_3 = tmpvar_4;
  xlv_TEXCOORD_4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _varStrength;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD) * _varStrength.x) + (
    (texture2D (_MainTex, xlv_TEXCOORD_1) + texture2D (_MainTex, xlv_TEXCOORD_2))
   * _varStrength.y)) + ((texture2D (_MainTex, xlv_TEXCOORD_3) + texture2D (_MainTex, xlv_TEXCOORD_4)) * _varStrength.z));
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
uniform mediump float _offset1;
uniform mediump float _offset2;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  mediump vec2 tmpvar_3;
  mediump vec2 tmpvar_4;
  mediump vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_2.x = tmpvar_1.x;
  tmpvar_3.x = tmpvar_1.x;
  tmpvar_4.x = tmpvar_1.x;
  tmpvar_5.x = tmpvar_1.x;
  mediump float tmpvar_7;
  tmpvar_7 = (_offset1 * _MainTex_TexelSize.y);
  tmpvar_2.y = (_glesMultiTexCoord0.y - tmpvar_7);
  tmpvar_3.y = (_glesMultiTexCoord0.y + tmpvar_7);
  mediump float tmpvar_8;
  tmpvar_8 = (_offset2 * _MainTex_TexelSize.y);
  tmpvar_4.y = (_glesMultiTexCoord0.y - tmpvar_8);
  tmpvar_5.y = (_glesMultiTexCoord0.y + tmpvar_8);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD = tmpvar_1;
  xlv_TEXCOORD_1 = tmpvar_2;
  xlv_TEXCOORD_2 = tmpvar_3;
  xlv_TEXCOORD_3 = tmpvar_4;
  xlv_TEXCOORD_4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _varStrength;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD) * _varStrength.x) + (
    (texture2D (_MainTex, xlv_TEXCOORD_1) + texture2D (_MainTex, xlv_TEXCOORD_2))
   * _varStrength.y)) + ((texture2D (_MainTex, xlv_TEXCOORD_3) + texture2D (_MainTex, xlv_TEXCOORD_4)) * _varStrength.z));
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
uniform mediump float _offset1;
uniform mediump float _offset2;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  mediump vec2 tmpvar_3;
  mediump vec2 tmpvar_4;
  mediump vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_2.x = tmpvar_1.x;
  tmpvar_3.x = tmpvar_1.x;
  tmpvar_4.x = tmpvar_1.x;
  tmpvar_5.x = tmpvar_1.x;
  mediump float tmpvar_7;
  tmpvar_7 = (_offset1 * _MainTex_TexelSize.y);
  tmpvar_2.y = (_glesMultiTexCoord0.y - tmpvar_7);
  tmpvar_3.y = (_glesMultiTexCoord0.y + tmpvar_7);
  mediump float tmpvar_8;
  tmpvar_8 = (_offset2 * _MainTex_TexelSize.y);
  tmpvar_4.y = (_glesMultiTexCoord0.y - tmpvar_8);
  tmpvar_5.y = (_glesMultiTexCoord0.y + tmpvar_8);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD = tmpvar_1;
  xlv_TEXCOORD_1 = tmpvar_2;
  xlv_TEXCOORD_2 = tmpvar_3;
  xlv_TEXCOORD_3 = tmpvar_4;
  xlv_TEXCOORD_4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _varStrength;
varying mediump vec2 xlv_TEXCOORD;
varying mediump vec2 xlv_TEXCOORD_1;
varying mediump vec2 xlv_TEXCOORD_2;
varying mediump vec2 xlv_TEXCOORD_3;
varying mediump vec2 xlv_TEXCOORD_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD) * _varStrength.x) + (
    (texture2D (_MainTex, xlv_TEXCOORD_1) + texture2D (_MainTex, xlv_TEXCOORD_2))
   * _varStrength.y)) + ((texture2D (_MainTex, xlv_TEXCOORD_3) + texture2D (_MainTex, xlv_TEXCOORD_4)) * _varStrength.z));
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