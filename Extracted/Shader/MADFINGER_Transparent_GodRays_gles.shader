//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Transparent/GodRays" {
Properties {
_MainTex ("Base texture", 2D) = "white" { }
_FadeOutDistNear ("Near fadeout dist", Float) = 10
_FadeOutDistFar ("Far fadeout dist", Float) = 10000
_Multiplier ("Multiplier", Float) = 1
_ContractionAmount ("Near contraction amount", Float) = 5
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 12636
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FadeOutDistNear;
uniform highp float _FadeOutDistFar;
uniform highp float _Multiplier;
uniform highp float _ContractionAmount;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 vpos_1;
  highp float nfadeout_2;
  lowp vec4 tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  highp float tmpvar_5;
  tmpvar_5 = sqrt(dot (tmpvar_4, tmpvar_4));
  highp float tmpvar_6;
  tmpvar_6 = clamp ((tmpvar_5 / _FadeOutDistNear), 0.0, 1.0);
  highp float tmpvar_7;
  tmpvar_7 = (1.0 - clamp ((
    max ((tmpvar_5 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  nfadeout_2 = (tmpvar_6 * tmpvar_6);
  nfadeout_2 = (nfadeout_2 * nfadeout_2);
  nfadeout_2 = (nfadeout_2 * (tmpvar_7 * tmpvar_7));
  vpos_1.w = _glesVertex.w;
  vpos_1.xyz = (_glesVertex.xyz - ((
    (_glesNormal * clamp ((1.0 - nfadeout_2), 0.0, 1.0))
   * _glesColor.w) * _ContractionAmount));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = vpos_1.xyz;
  tmpvar_3 = ((nfadeout_2 * _glesColor) * _Multiplier);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_TEXCOORD1);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FadeOutDistNear;
uniform highp float _FadeOutDistFar;
uniform highp float _Multiplier;
uniform highp float _ContractionAmount;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 vpos_1;
  highp float nfadeout_2;
  lowp vec4 tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  highp float tmpvar_5;
  tmpvar_5 = sqrt(dot (tmpvar_4, tmpvar_4));
  highp float tmpvar_6;
  tmpvar_6 = clamp ((tmpvar_5 / _FadeOutDistNear), 0.0, 1.0);
  highp float tmpvar_7;
  tmpvar_7 = (1.0 - clamp ((
    max ((tmpvar_5 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  nfadeout_2 = (tmpvar_6 * tmpvar_6);
  nfadeout_2 = (nfadeout_2 * nfadeout_2);
  nfadeout_2 = (nfadeout_2 * (tmpvar_7 * tmpvar_7));
  vpos_1.w = _glesVertex.w;
  vpos_1.xyz = (_glesVertex.xyz - ((
    (_glesNormal * clamp ((1.0 - nfadeout_2), 0.0, 1.0))
   * _glesColor.w) * _ContractionAmount));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = vpos_1.xyz;
  tmpvar_3 = ((nfadeout_2 * _glesColor) * _Multiplier);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_TEXCOORD1);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FadeOutDistNear;
uniform highp float _FadeOutDistFar;
uniform highp float _Multiplier;
uniform highp float _ContractionAmount;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 vpos_1;
  highp float nfadeout_2;
  lowp vec4 tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  highp float tmpvar_5;
  tmpvar_5 = sqrt(dot (tmpvar_4, tmpvar_4));
  highp float tmpvar_6;
  tmpvar_6 = clamp ((tmpvar_5 / _FadeOutDistNear), 0.0, 1.0);
  highp float tmpvar_7;
  tmpvar_7 = (1.0 - clamp ((
    max ((tmpvar_5 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  nfadeout_2 = (tmpvar_6 * tmpvar_6);
  nfadeout_2 = (nfadeout_2 * nfadeout_2);
  nfadeout_2 = (nfadeout_2 * (tmpvar_7 * tmpvar_7));
  vpos_1.w = _glesVertex.w;
  vpos_1.xyz = (_glesVertex.xyz - ((
    (_glesNormal * clamp ((1.0 - nfadeout_2), 0.0, 1.0))
   * _glesColor.w) * _ContractionAmount));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = vpos_1.xyz;
  tmpvar_3 = ((nfadeout_2 * _glesColor) * _Multiplier);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_TEXCOORD1);
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