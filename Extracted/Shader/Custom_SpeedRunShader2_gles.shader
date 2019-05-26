//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/SpeedRunShader2" {
Properties {
_MainTex ("Albedo (RGB)", 2D) = "white" { }
_MainTex2 ("Albedo2 (RGB)", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
_Color2 ("Color2", Color) = (1,1,1,1)
_Shadow ("GlowPower", Range(0, 1)) = 1
_MaxDIstance ("EndDistance", Float) = 100
}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Geometry+200" "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "Geometry+200" "RenderType" = "Opaque" }
  GpuProgramID 6670
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
uniform lowp float _MaxDIstance;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp float Diff_1;
  highp float ffadeout_2;
  lowp vec4 tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _glesNormal;
  highp float tmpvar_6;
  tmpvar_6 = (1.0 - clamp ((
    max ((sqrt(dot (tmpvar_4, tmpvar_4)) - _MaxDIstance), 0.0)
   * 0.01), 0.0, 1.0));
  ffadeout_2 = (tmpvar_6 * tmpvar_6);
  highp float tmpvar_7;
  tmpvar_7 = max (0.5, dot ((unity_ObjectToWorld * tmpvar_5).xyz, vec3(0.0, 1.5, 0.0)));
  Diff_1 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  lowp vec4 tmpvar_9;
  tmpvar_9.x = Diff_1;
  tmpvar_9.y = Diff_1;
  tmpvar_9.z = Diff_1;
  tmpvar_9.w = _glesColor.w;
  tmpvar_3 = (ffadeout_2 * tmpvar_9);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
uniform lowp vec4 _Color2;
uniform lowp float _Shadow;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = ((texture2D (_MainTex2, xlv_TEXCOORD0) * _Color) * _Shadow);
  lowp vec4 tmpvar_3;
  tmpvar_3 = ((texture2D (_MainTex, xlv_TEXCOORD0) * _Color2) * xlv_TEXCOORD1);
  c_1.w = tmpvar_3.w;
  c_1.xyz = (tmpvar_3.xyz + ((tmpvar_2.xyz * tmpvar_2.w) * 1.2));
  gl_FragData[0] = c_1;
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
uniform lowp float _MaxDIstance;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp float Diff_1;
  highp float ffadeout_2;
  lowp vec4 tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _glesNormal;
  highp float tmpvar_6;
  tmpvar_6 = (1.0 - clamp ((
    max ((sqrt(dot (tmpvar_4, tmpvar_4)) - _MaxDIstance), 0.0)
   * 0.01), 0.0, 1.0));
  ffadeout_2 = (tmpvar_6 * tmpvar_6);
  highp float tmpvar_7;
  tmpvar_7 = max (0.5, dot ((unity_ObjectToWorld * tmpvar_5).xyz, vec3(0.0, 1.5, 0.0)));
  Diff_1 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  lowp vec4 tmpvar_9;
  tmpvar_9.x = Diff_1;
  tmpvar_9.y = Diff_1;
  tmpvar_9.z = Diff_1;
  tmpvar_9.w = _glesColor.w;
  tmpvar_3 = (ffadeout_2 * tmpvar_9);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
uniform lowp vec4 _Color2;
uniform lowp float _Shadow;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = ((texture2D (_MainTex2, xlv_TEXCOORD0) * _Color) * _Shadow);
  lowp vec4 tmpvar_3;
  tmpvar_3 = ((texture2D (_MainTex, xlv_TEXCOORD0) * _Color2) * xlv_TEXCOORD1);
  c_1.w = tmpvar_3.w;
  c_1.xyz = (tmpvar_3.xyz + ((tmpvar_2.xyz * tmpvar_2.w) * 1.2));
  gl_FragData[0] = c_1;
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
uniform lowp float _MaxDIstance;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp float Diff_1;
  highp float ffadeout_2;
  lowp vec4 tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _glesNormal;
  highp float tmpvar_6;
  tmpvar_6 = (1.0 - clamp ((
    max ((sqrt(dot (tmpvar_4, tmpvar_4)) - _MaxDIstance), 0.0)
   * 0.01), 0.0, 1.0));
  ffadeout_2 = (tmpvar_6 * tmpvar_6);
  highp float tmpvar_7;
  tmpvar_7 = max (0.5, dot ((unity_ObjectToWorld * tmpvar_5).xyz, vec3(0.0, 1.5, 0.0)));
  Diff_1 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  lowp vec4 tmpvar_9;
  tmpvar_9.x = Diff_1;
  tmpvar_9.y = Diff_1;
  tmpvar_9.z = Diff_1;
  tmpvar_9.w = _glesColor.w;
  tmpvar_3 = (ffadeout_2 * tmpvar_9);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
uniform lowp vec4 _Color2;
uniform lowp float _Shadow;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = ((texture2D (_MainTex2, xlv_TEXCOORD0) * _Color) * _Shadow);
  lowp vec4 tmpvar_3;
  tmpvar_3 = ((texture2D (_MainTex, xlv_TEXCOORD0) * _Color2) * xlv_TEXCOORD1);
  c_1.w = tmpvar_3.w;
  c_1.xyz = (tmpvar_3.xyz + ((tmpvar_2.xyz * tmpvar_2.w) * 1.2));
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
}
}