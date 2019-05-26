//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/RadialBlur" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 41423
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _BlurRadius4;
uniform highp vec4 _SunPosition;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  xlv_TEXCOORD1 = ((_SunPosition.xy - _glesMultiTexCoord0.xy) * _BlurRadius4.xy);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec4 color_2;
  mediump vec4 tmpColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpColor_3 = tmpvar_4;
  tmpvar_1 = (xlv_TEXCOORD0 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_1);
  tmpColor_5 = tmpvar_6;
  color_2 = (tmpColor_3 + tmpColor_5);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, tmpvar_1);
  tmpColor_7 = tmpvar_8;
  color_2 = (color_2 + tmpColor_7);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, tmpvar_1);
  tmpColor_9 = tmpvar_10;
  color_2 = (color_2 + tmpColor_9);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, tmpvar_1);
  tmpColor_11 = tmpvar_12;
  color_2 = (color_2 + tmpColor_11);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, tmpvar_1);
  tmpColor_13 = tmpvar_14;
  color_2 = (color_2 + tmpColor_13);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  gl_FragData[0] = (color_2 / 6.0);
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
uniform highp vec4 _BlurRadius4;
uniform highp vec4 _SunPosition;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  xlv_TEXCOORD1 = ((_SunPosition.xy - _glesMultiTexCoord0.xy) * _BlurRadius4.xy);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec4 color_2;
  mediump vec4 tmpColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpColor_3 = tmpvar_4;
  tmpvar_1 = (xlv_TEXCOORD0 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_1);
  tmpColor_5 = tmpvar_6;
  color_2 = (tmpColor_3 + tmpColor_5);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, tmpvar_1);
  tmpColor_7 = tmpvar_8;
  color_2 = (color_2 + tmpColor_7);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, tmpvar_1);
  tmpColor_9 = tmpvar_10;
  color_2 = (color_2 + tmpColor_9);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, tmpvar_1);
  tmpColor_11 = tmpvar_12;
  color_2 = (color_2 + tmpColor_11);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, tmpvar_1);
  tmpColor_13 = tmpvar_14;
  color_2 = (color_2 + tmpColor_13);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  gl_FragData[0] = (color_2 / 6.0);
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
uniform highp vec4 _BlurRadius4;
uniform highp vec4 _SunPosition;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  xlv_TEXCOORD1 = ((_SunPosition.xy - _glesMultiTexCoord0.xy) * _BlurRadius4.xy);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec4 color_2;
  mediump vec4 tmpColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpColor_3 = tmpvar_4;
  tmpvar_1 = (xlv_TEXCOORD0 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_1);
  tmpColor_5 = tmpvar_6;
  color_2 = (tmpColor_3 + tmpColor_5);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, tmpvar_1);
  tmpColor_7 = tmpvar_8;
  color_2 = (color_2 + tmpColor_7);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, tmpvar_1);
  tmpColor_9 = tmpvar_10;
  color_2 = (color_2 + tmpColor_9);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, tmpvar_1);
  tmpColor_11 = tmpvar_12;
  color_2 = (color_2 + tmpColor_11);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  mediump vec4 tmpColor_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, tmpvar_1);
  tmpColor_13 = tmpvar_14;
  color_2 = (color_2 + tmpColor_13);
  tmpvar_1 = (tmpvar_1 + xlv_TEXCOORD1);
  gl_FragData[0] = (color_2 / 6.0);
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