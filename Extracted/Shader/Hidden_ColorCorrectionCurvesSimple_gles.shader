//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ColorCorrectionCurvesSimple" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
_RgbTex ("_RgbTex (RGB)", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 8280
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
uniform sampler2D _RgbTex;
uniform lowp float _Saturation;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float lum_1;
  lowp vec4 color_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec2 tmpvar_4;
  tmpvar_4.y = 0.125;
  tmpvar_4.x = tmpvar_3.x;
  lowp vec2 tmpvar_5;
  tmpvar_5.y = 0.375;
  tmpvar_5.x = tmpvar_3.y;
  lowp vec2 tmpvar_6;
  tmpvar_6.y = 0.625;
  tmpvar_6.x = tmpvar_3.z;
  lowp vec4 tmpvar_7;
  tmpvar_7.xyz = (((texture2D (_RgbTex, tmpvar_4).xyz * vec3(1.0, 0.0, 0.0)) + (texture2D (_RgbTex, tmpvar_5).xyz * vec3(0.0, 1.0, 0.0))) + (texture2D (_RgbTex, tmpvar_6).xyz * vec3(0.0, 0.0, 1.0)));
  tmpvar_7.w = tmpvar_3.w;
  color_2.w = tmpvar_7.w;
  mediump vec3 rgb_8;
  rgb_8 = tmpvar_7.xyz;
  mediump float tmpvar_9;
  tmpvar_9 = dot (rgb_8, vec3(0.22, 0.707, 0.071));
  lum_1 = tmpvar_9;
  color_2.xyz = mix (vec3(lum_1), tmpvar_7.xyz, vec3(_Saturation));
  gl_FragData[0] = color_2;
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
uniform sampler2D _RgbTex;
uniform lowp float _Saturation;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float lum_1;
  lowp vec4 color_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec2 tmpvar_4;
  tmpvar_4.y = 0.125;
  tmpvar_4.x = tmpvar_3.x;
  lowp vec2 tmpvar_5;
  tmpvar_5.y = 0.375;
  tmpvar_5.x = tmpvar_3.y;
  lowp vec2 tmpvar_6;
  tmpvar_6.y = 0.625;
  tmpvar_6.x = tmpvar_3.z;
  lowp vec4 tmpvar_7;
  tmpvar_7.xyz = (((texture2D (_RgbTex, tmpvar_4).xyz * vec3(1.0, 0.0, 0.0)) + (texture2D (_RgbTex, tmpvar_5).xyz * vec3(0.0, 1.0, 0.0))) + (texture2D (_RgbTex, tmpvar_6).xyz * vec3(0.0, 0.0, 1.0)));
  tmpvar_7.w = tmpvar_3.w;
  color_2.w = tmpvar_7.w;
  mediump vec3 rgb_8;
  rgb_8 = tmpvar_7.xyz;
  mediump float tmpvar_9;
  tmpvar_9 = dot (rgb_8, vec3(0.22, 0.707, 0.071));
  lum_1 = tmpvar_9;
  color_2.xyz = mix (vec3(lum_1), tmpvar_7.xyz, vec3(_Saturation));
  gl_FragData[0] = color_2;
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
uniform sampler2D _RgbTex;
uniform lowp float _Saturation;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float lum_1;
  lowp vec4 color_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec2 tmpvar_4;
  tmpvar_4.y = 0.125;
  tmpvar_4.x = tmpvar_3.x;
  lowp vec2 tmpvar_5;
  tmpvar_5.y = 0.375;
  tmpvar_5.x = tmpvar_3.y;
  lowp vec2 tmpvar_6;
  tmpvar_6.y = 0.625;
  tmpvar_6.x = tmpvar_3.z;
  lowp vec4 tmpvar_7;
  tmpvar_7.xyz = (((texture2D (_RgbTex, tmpvar_4).xyz * vec3(1.0, 0.0, 0.0)) + (texture2D (_RgbTex, tmpvar_5).xyz * vec3(0.0, 1.0, 0.0))) + (texture2D (_RgbTex, tmpvar_6).xyz * vec3(0.0, 0.0, 1.0)));
  tmpvar_7.w = tmpvar_3.w;
  color_2.w = tmpvar_7.w;
  mediump vec3 rgb_8;
  rgb_8 = tmpvar_7.xyz;
  mediump float tmpvar_9;
  tmpvar_9 = dot (rgb_8, vec3(0.22, 0.707, 0.071));
  lum_1 = tmpvar_9;
  color_2.xyz = mix (vec3(lum_1), tmpvar_7.xyz, vec3(_Saturation));
  gl_FragData[0] = color_2;
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