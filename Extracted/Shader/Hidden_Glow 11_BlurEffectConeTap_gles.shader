//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Glow 11/BlurEffectConeTap" {
Properties {
_MainTex ("", any) = "" { }
_Strength ("Strength", Float) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 60443
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _MainTex_TexelSize;
uniform mediump vec4 _BlurOffsets;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD1_1;
varying mediump vec2 xlv_TEXCOORD1_2;
varying mediump vec2 xlv_TEXCOORD1_3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (_glesMultiTexCoord0.xy - (_BlurOffsets.xy * _MainTex_TexelSize.xy));
  mediump vec2 tmpvar_3;
  tmpvar_3 = (_MainTex_TexelSize.xy * _BlurOffsets.xy);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = (tmpvar_1 + tmpvar_3);
  xlv_TEXCOORD1_1 = (tmpvar_1 - tmpvar_3);
  xlv_TEXCOORD1_2 = (tmpvar_1 + (tmpvar_3 * vec2(1.0, -1.0)));
  xlv_TEXCOORD1_3 = (tmpvar_1 - (tmpvar_3 * vec2(1.0, -1.0)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Strength;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD1_1;
varying mediump vec2 xlv_TEXCOORD1_2;
varying mediump vec2 xlv_TEXCOORD1_3;
void main ()
{
  mediump vec4 color_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD1);
  color_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD1_1);
  color_1 = (color_1 + tmpvar_3);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1_2);
  color_1 = (color_1 + tmpvar_4);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1_3);
  color_1 = (color_1 + tmpvar_5);
  gl_FragData[0] = (color_1 * _Strength);
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
uniform mediump vec4 _MainTex_TexelSize;
uniform mediump vec4 _BlurOffsets;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD1_1;
varying mediump vec2 xlv_TEXCOORD1_2;
varying mediump vec2 xlv_TEXCOORD1_3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (_glesMultiTexCoord0.xy - (_BlurOffsets.xy * _MainTex_TexelSize.xy));
  mediump vec2 tmpvar_3;
  tmpvar_3 = (_MainTex_TexelSize.xy * _BlurOffsets.xy);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = (tmpvar_1 + tmpvar_3);
  xlv_TEXCOORD1_1 = (tmpvar_1 - tmpvar_3);
  xlv_TEXCOORD1_2 = (tmpvar_1 + (tmpvar_3 * vec2(1.0, -1.0)));
  xlv_TEXCOORD1_3 = (tmpvar_1 - (tmpvar_3 * vec2(1.0, -1.0)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Strength;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD1_1;
varying mediump vec2 xlv_TEXCOORD1_2;
varying mediump vec2 xlv_TEXCOORD1_3;
void main ()
{
  mediump vec4 color_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD1);
  color_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD1_1);
  color_1 = (color_1 + tmpvar_3);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1_2);
  color_1 = (color_1 + tmpvar_4);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1_3);
  color_1 = (color_1 + tmpvar_5);
  gl_FragData[0] = (color_1 * _Strength);
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
uniform mediump vec4 _MainTex_TexelSize;
uniform mediump vec4 _BlurOffsets;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD1_1;
varying mediump vec2 xlv_TEXCOORD1_2;
varying mediump vec2 xlv_TEXCOORD1_3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (_glesMultiTexCoord0.xy - (_BlurOffsets.xy * _MainTex_TexelSize.xy));
  mediump vec2 tmpvar_3;
  tmpvar_3 = (_MainTex_TexelSize.xy * _BlurOffsets.xy);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = (tmpvar_1 + tmpvar_3);
  xlv_TEXCOORD1_1 = (tmpvar_1 - tmpvar_3);
  xlv_TEXCOORD1_2 = (tmpvar_1 + (tmpvar_3 * vec2(1.0, -1.0)));
  xlv_TEXCOORD1_3 = (tmpvar_1 - (tmpvar_3 * vec2(1.0, -1.0)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Strength;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD1_1;
varying mediump vec2 xlv_TEXCOORD1_2;
varying mediump vec2 xlv_TEXCOORD1_3;
void main ()
{
  mediump vec4 color_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD1);
  color_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD1_1);
  color_1 = (color_1 + tmpvar_3);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1_2);
  color_1 = (color_1 + tmpvar_4);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1_3);
  color_1 = (color_1 + tmpvar_5);
  gl_FragData[0] = (color_1 * _Strength);
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