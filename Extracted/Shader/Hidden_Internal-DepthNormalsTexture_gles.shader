//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-DepthNormalsTexture" {
Properties {
_MainTex ("", 2D) = "white" { }
_Cutoff ("", Float) = 0.5
_Color ("", Color) = (1,1,1,1)
}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 42178
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesVertex;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_5.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_8 * _glesNormal));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_9)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec2 enc_3;
  enc_3 = (xlv_TEXCOORD0.xy / (xlv_TEXCOORD0.z + 1.0));
  enc_3 = (enc_3 / 1.7777);
  enc_3 = ((enc_3 * 0.5) + 0.5);
  enc_2.xy = enc_3;
  highp vec2 enc_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD0.w));
  enc_4.y = tmpvar_5.y;
  enc_4.x = (tmpvar_5.x - (tmpvar_5.y * 0.003921569));
  enc_2.zw = enc_4;
  tmpvar_1 = enc_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesVertex;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_5.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_8 * _glesNormal));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_9)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec2 enc_3;
  enc_3 = (xlv_TEXCOORD0.xy / (xlv_TEXCOORD0.z + 1.0));
  enc_3 = (enc_3 / 1.7777);
  enc_3 = ((enc_3 * 0.5) + 0.5);
  enc_2.xy = enc_3;
  highp vec2 enc_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD0.w));
  enc_4.y = tmpvar_5.y;
  enc_4.x = (tmpvar_5.x - (tmpvar_5.y * 0.003921569));
  enc_2.zw = enc_4;
  tmpvar_1 = enc_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesVertex;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_5.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_8 * _glesNormal));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_9)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec2 enc_3;
  enc_3 = (xlv_TEXCOORD0.xy / (xlv_TEXCOORD0.z + 1.0));
  enc_3 = (enc_3 / 1.7777);
  enc_3 = ((enc_3 * 0.5) + 0.5);
  enc_2.xy = enc_3;
  highp vec2 enc_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD0.w));
  enc_4.y = tmpvar_5.y;
  enc_4.x = (tmpvar_5.x - (tmpvar_5.y * 0.003921569));
  enc_2.zw = enc_4;
  tmpvar_1 = enc_2;
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
SubShader {
 Tags { "RenderType" = "TransparentCutout" }
 Pass {
  Tags { "RenderType" = "TransparentCutout" }
  GpuProgramID 88112
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesVertex;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_5.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_8 * _glesNormal));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_9)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = ((texture2D (_MainTex, xlv_TEXCOORD0).w * _Color.w) - _Cutoff);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesVertex;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_5.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_8 * _glesNormal));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_9)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = ((texture2D (_MainTex, xlv_TEXCOORD0).w * _Color.w) - _Cutoff);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesVertex;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_5.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_8 * _glesNormal));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_9)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = ((texture2D (_MainTex, xlv_TEXCOORD0).w * _Color.w) - _Cutoff);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
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
SubShader {
 Tags { "RenderType" = "TreeBark" }
 Pass {
  Tags { "RenderType" = "TreeBark" }
  GpuProgramID 184775
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _Time;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
uniform highp vec4 _Wind;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  lowp vec4 tmpvar_5;
  tmpvar_5 = _glesColor;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = _glesVertex.w;
  tmpvar_7.xyz = (_glesVertex.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_8;
  tmpvar_8.xy = tmpvar_5.xy;
  tmpvar_8.zw = _glesMultiTexCoord1.xy;
  highp vec4 pos_9;
  pos_9.w = tmpvar_7.w;
  highp vec3 bend_10;
  highp float tmpvar_11;
  tmpvar_11 = (dot (unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0)) + tmpvar_8.x);
  highp vec2 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_7.xyz, vec3((tmpvar_8.y + tmpvar_11)));
  tmpvar_12.y = tmpvar_11;
  highp vec4 tmpvar_13;
  tmpvar_13 = abs(((
    fract((((
      fract(((_Time.yy + tmpvar_12).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
     * 2.0) - 1.0) + 0.5))
   * 2.0) - 1.0));
  highp vec4 tmpvar_14;
  tmpvar_14 = ((tmpvar_13 * tmpvar_13) * (3.0 - (2.0 * tmpvar_13)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (tmpvar_14.xz + tmpvar_14.yw);
  bend_10.xz = ((tmpvar_8.y * 0.1) * _glesNormal).xz;
  bend_10.y = (_glesMultiTexCoord1.y * 0.3);
  pos_9.xyz = (tmpvar_7.xyz + ((
    (tmpvar_15.xyx * bend_10)
   + 
    ((_Wind.xyz * tmpvar_15.y) * _glesMultiTexCoord1.y)
  ) * _Wind.w));
  pos_9.xyz = (pos_9.xyz + (_glesMultiTexCoord1.x * _Wind.xyz));
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = mix ((pos_9.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_9.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_9.xyz, vec3(_SquashAmount));
  tmpvar_7 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = tmpvar_16.xyz;
  highp mat3 tmpvar_18;
  tmpvar_18[0] = tmpvar_2.xyz;
  tmpvar_18[1] = tmpvar_3.xyz;
  tmpvar_18[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_18 * normalize(_glesNormal)));
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_16.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_19)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_17));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec2 enc_3;
  enc_3 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_3 = (enc_3 / 1.7777);
  enc_3 = ((enc_3 * 0.5) + 0.5);
  enc_2.xy = enc_3;
  highp vec2 enc_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_4.y = tmpvar_5.y;
  enc_4.x = (tmpvar_5.x - (tmpvar_5.y * 0.003921569));
  enc_2.zw = enc_4;
  tmpvar_1 = enc_2;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _Time;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
uniform highp vec4 _Wind;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  lowp vec4 tmpvar_5;
  tmpvar_5 = _glesColor;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = _glesVertex.w;
  tmpvar_7.xyz = (_glesVertex.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_8;
  tmpvar_8.xy = tmpvar_5.xy;
  tmpvar_8.zw = _glesMultiTexCoord1.xy;
  highp vec4 pos_9;
  pos_9.w = tmpvar_7.w;
  highp vec3 bend_10;
  highp float tmpvar_11;
  tmpvar_11 = (dot (unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0)) + tmpvar_8.x);
  highp vec2 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_7.xyz, vec3((tmpvar_8.y + tmpvar_11)));
  tmpvar_12.y = tmpvar_11;
  highp vec4 tmpvar_13;
  tmpvar_13 = abs(((
    fract((((
      fract(((_Time.yy + tmpvar_12).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
     * 2.0) - 1.0) + 0.5))
   * 2.0) - 1.0));
  highp vec4 tmpvar_14;
  tmpvar_14 = ((tmpvar_13 * tmpvar_13) * (3.0 - (2.0 * tmpvar_13)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (tmpvar_14.xz + tmpvar_14.yw);
  bend_10.xz = ((tmpvar_8.y * 0.1) * _glesNormal).xz;
  bend_10.y = (_glesMultiTexCoord1.y * 0.3);
  pos_9.xyz = (tmpvar_7.xyz + ((
    (tmpvar_15.xyx * bend_10)
   + 
    ((_Wind.xyz * tmpvar_15.y) * _glesMultiTexCoord1.y)
  ) * _Wind.w));
  pos_9.xyz = (pos_9.xyz + (_glesMultiTexCoord1.x * _Wind.xyz));
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = mix ((pos_9.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_9.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_9.xyz, vec3(_SquashAmount));
  tmpvar_7 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = tmpvar_16.xyz;
  highp mat3 tmpvar_18;
  tmpvar_18[0] = tmpvar_2.xyz;
  tmpvar_18[1] = tmpvar_3.xyz;
  tmpvar_18[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_18 * normalize(_glesNormal)));
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_16.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_19)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_17));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec2 enc_3;
  enc_3 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_3 = (enc_3 / 1.7777);
  enc_3 = ((enc_3 * 0.5) + 0.5);
  enc_2.xy = enc_3;
  highp vec2 enc_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_4.y = tmpvar_5.y;
  enc_4.x = (tmpvar_5.x - (tmpvar_5.y * 0.003921569));
  enc_2.zw = enc_4;
  tmpvar_1 = enc_2;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _Time;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
uniform highp vec4 _Wind;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  lowp vec4 tmpvar_5;
  tmpvar_5 = _glesColor;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = _glesVertex.w;
  tmpvar_7.xyz = (_glesVertex.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_8;
  tmpvar_8.xy = tmpvar_5.xy;
  tmpvar_8.zw = _glesMultiTexCoord1.xy;
  highp vec4 pos_9;
  pos_9.w = tmpvar_7.w;
  highp vec3 bend_10;
  highp float tmpvar_11;
  tmpvar_11 = (dot (unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0)) + tmpvar_8.x);
  highp vec2 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_7.xyz, vec3((tmpvar_8.y + tmpvar_11)));
  tmpvar_12.y = tmpvar_11;
  highp vec4 tmpvar_13;
  tmpvar_13 = abs(((
    fract((((
      fract(((_Time.yy + tmpvar_12).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
     * 2.0) - 1.0) + 0.5))
   * 2.0) - 1.0));
  highp vec4 tmpvar_14;
  tmpvar_14 = ((tmpvar_13 * tmpvar_13) * (3.0 - (2.0 * tmpvar_13)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (tmpvar_14.xz + tmpvar_14.yw);
  bend_10.xz = ((tmpvar_8.y * 0.1) * _glesNormal).xz;
  bend_10.y = (_glesMultiTexCoord1.y * 0.3);
  pos_9.xyz = (tmpvar_7.xyz + ((
    (tmpvar_15.xyx * bend_10)
   + 
    ((_Wind.xyz * tmpvar_15.y) * _glesMultiTexCoord1.y)
  ) * _Wind.w));
  pos_9.xyz = (pos_9.xyz + (_glesMultiTexCoord1.x * _Wind.xyz));
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = mix ((pos_9.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_9.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_9.xyz, vec3(_SquashAmount));
  tmpvar_7 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = tmpvar_16.xyz;
  highp mat3 tmpvar_18;
  tmpvar_18[0] = tmpvar_2.xyz;
  tmpvar_18[1] = tmpvar_3.xyz;
  tmpvar_18[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_18 * normalize(_glesNormal)));
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_16.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_19)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_17));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec2 enc_3;
  enc_3 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_3 = (enc_3 / 1.7777);
  enc_3 = ((enc_3 * 0.5) + 0.5);
  enc_2.xy = enc_3;
  highp vec2 enc_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_4.y = tmpvar_5.y;
  enc_4.x = (tmpvar_5.x - (tmpvar_5.y * 0.003921569));
  enc_2.zw = enc_4;
  tmpvar_1 = enc_2;
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
SubShader {
 Tags { "RenderType" = "TreeLeaf" }
 Pass {
  Tags { "RenderType" = "TreeLeaf" }
  GpuProgramID 221045
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _Time;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
uniform highp vec4 _Wind;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp mat4 tmpvar_2;
  tmpvar_2[0].x = m_1[0].x;
  tmpvar_2[0].y = m_1[1].x;
  tmpvar_2[0].z = m_1[2].x;
  tmpvar_2[0].w = m_1[3].x;
  tmpvar_2[1].x = m_1[0].y;
  tmpvar_2[1].y = m_1[1].y;
  tmpvar_2[1].z = m_1[2].y;
  tmpvar_2[1].w = m_1[3].y;
  tmpvar_2[2].x = m_1[0].z;
  tmpvar_2[2].y = m_1[1].z;
  tmpvar_2[2].z = m_1[2].z;
  tmpvar_2[2].w = m_1[3].z;
  tmpvar_2[3].x = m_1[0].w;
  tmpvar_2[3].y = m_1[1].w;
  tmpvar_2[3].z = m_1[2].w;
  tmpvar_2[3].w = m_1[3].w;
  highp vec3 tmpvar_3;
  tmpvar_3 = _glesNormal;
  lowp vec4 tmpvar_4;
  tmpvar_4 = _glesColor;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 pos_7;
  highp float tmpvar_8;
  tmpvar_8 = (1.0 - abs(_glesTANGENT.w));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = tmpvar_3;
  highp vec4 tmpvar_10;
  tmpvar_10.zw = vec2(0.0, 0.0);
  tmpvar_10.xy = tmpvar_3.xy;
  pos_7 = (_glesVertex + ((tmpvar_10 * tmpvar_2) * tmpvar_8));
  highp vec3 tmpvar_11;
  tmpvar_11 = mix (_glesNormal, normalize((tmpvar_9 * tmpvar_2)).xyz, vec3(tmpvar_8));
  tmpvar_6.w = pos_7.w;
  tmpvar_6.xyz = (pos_7.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_12;
  tmpvar_12.xy = tmpvar_4.xy;
  tmpvar_12.zw = _glesMultiTexCoord1.xy;
  highp vec4 pos_13;
  pos_13.w = tmpvar_6.w;
  highp vec3 bend_14;
  highp float tmpvar_15;
  tmpvar_15 = (dot (unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0)) + tmpvar_12.x);
  highp vec2 tmpvar_16;
  tmpvar_16.x = dot (tmpvar_6.xyz, vec3((tmpvar_12.y + tmpvar_15)));
  tmpvar_16.y = tmpvar_15;
  highp vec4 tmpvar_17;
  tmpvar_17 = abs(((
    fract((((
      fract(((_Time.yy + tmpvar_16).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
     * 2.0) - 1.0) + 0.5))
   * 2.0) - 1.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = ((tmpvar_17 * tmpvar_17) * (3.0 - (2.0 * tmpvar_17)));
  highp vec2 tmpvar_19;
  tmpvar_19 = (tmpvar_18.xz + tmpvar_18.yw);
  bend_14.xz = ((tmpvar_12.y * 0.1) * tmpvar_11).xz;
  bend_14.y = (_glesMultiTexCoord1.y * 0.3);
  pos_13.xyz = (tmpvar_6.xyz + ((
    (tmpvar_19.xyx * bend_14)
   + 
    ((_Wind.xyz * tmpvar_19.y) * _glesMultiTexCoord1.y)
  ) * _Wind.w));
  pos_13.xyz = (pos_13.xyz + (_glesMultiTexCoord1.x * _Wind.xyz));
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = mix ((pos_13.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_13.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_13.xyz, vec3(_SquashAmount));
  tmpvar_6 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = tmpvar_20.xyz;
  highp mat3 tmpvar_22;
  tmpvar_22[0] = tmpvar_2[0].xyz;
  tmpvar_22[1] = tmpvar_2[1].xyz;
  tmpvar_22[2] = tmpvar_2[2].xyz;
  tmpvar_5.xyz = normalize((tmpvar_22 * normalize(tmpvar_11)));
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_20.xyz;
  tmpvar_5.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_23)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_21));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float alpha_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  alpha_2 = tmpvar_3;
  mediump float x_4;
  x_4 = (alpha_2 - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  highp vec4 enc_5;
  highp vec2 enc_6;
  enc_6 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_6 = (enc_6 / 1.7777);
  enc_6 = ((enc_6 * 0.5) + 0.5);
  enc_5.xy = enc_6;
  highp vec2 enc_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_7.y = tmpvar_8.y;
  enc_7.x = (tmpvar_8.x - (tmpvar_8.y * 0.003921569));
  enc_5.zw = enc_7;
  tmpvar_1 = enc_5;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _Time;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
uniform highp vec4 _Wind;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp mat4 tmpvar_2;
  tmpvar_2[0].x = m_1[0].x;
  tmpvar_2[0].y = m_1[1].x;
  tmpvar_2[0].z = m_1[2].x;
  tmpvar_2[0].w = m_1[3].x;
  tmpvar_2[1].x = m_1[0].y;
  tmpvar_2[1].y = m_1[1].y;
  tmpvar_2[1].z = m_1[2].y;
  tmpvar_2[1].w = m_1[3].y;
  tmpvar_2[2].x = m_1[0].z;
  tmpvar_2[2].y = m_1[1].z;
  tmpvar_2[2].z = m_1[2].z;
  tmpvar_2[2].w = m_1[3].z;
  tmpvar_2[3].x = m_1[0].w;
  tmpvar_2[3].y = m_1[1].w;
  tmpvar_2[3].z = m_1[2].w;
  tmpvar_2[3].w = m_1[3].w;
  highp vec3 tmpvar_3;
  tmpvar_3 = _glesNormal;
  lowp vec4 tmpvar_4;
  tmpvar_4 = _glesColor;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 pos_7;
  highp float tmpvar_8;
  tmpvar_8 = (1.0 - abs(_glesTANGENT.w));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = tmpvar_3;
  highp vec4 tmpvar_10;
  tmpvar_10.zw = vec2(0.0, 0.0);
  tmpvar_10.xy = tmpvar_3.xy;
  pos_7 = (_glesVertex + ((tmpvar_10 * tmpvar_2) * tmpvar_8));
  highp vec3 tmpvar_11;
  tmpvar_11 = mix (_glesNormal, normalize((tmpvar_9 * tmpvar_2)).xyz, vec3(tmpvar_8));
  tmpvar_6.w = pos_7.w;
  tmpvar_6.xyz = (pos_7.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_12;
  tmpvar_12.xy = tmpvar_4.xy;
  tmpvar_12.zw = _glesMultiTexCoord1.xy;
  highp vec4 pos_13;
  pos_13.w = tmpvar_6.w;
  highp vec3 bend_14;
  highp float tmpvar_15;
  tmpvar_15 = (dot (unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0)) + tmpvar_12.x);
  highp vec2 tmpvar_16;
  tmpvar_16.x = dot (tmpvar_6.xyz, vec3((tmpvar_12.y + tmpvar_15)));
  tmpvar_16.y = tmpvar_15;
  highp vec4 tmpvar_17;
  tmpvar_17 = abs(((
    fract((((
      fract(((_Time.yy + tmpvar_16).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
     * 2.0) - 1.0) + 0.5))
   * 2.0) - 1.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = ((tmpvar_17 * tmpvar_17) * (3.0 - (2.0 * tmpvar_17)));
  highp vec2 tmpvar_19;
  tmpvar_19 = (tmpvar_18.xz + tmpvar_18.yw);
  bend_14.xz = ((tmpvar_12.y * 0.1) * tmpvar_11).xz;
  bend_14.y = (_glesMultiTexCoord1.y * 0.3);
  pos_13.xyz = (tmpvar_6.xyz + ((
    (tmpvar_19.xyx * bend_14)
   + 
    ((_Wind.xyz * tmpvar_19.y) * _glesMultiTexCoord1.y)
  ) * _Wind.w));
  pos_13.xyz = (pos_13.xyz + (_glesMultiTexCoord1.x * _Wind.xyz));
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = mix ((pos_13.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_13.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_13.xyz, vec3(_SquashAmount));
  tmpvar_6 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = tmpvar_20.xyz;
  highp mat3 tmpvar_22;
  tmpvar_22[0] = tmpvar_2[0].xyz;
  tmpvar_22[1] = tmpvar_2[1].xyz;
  tmpvar_22[2] = tmpvar_2[2].xyz;
  tmpvar_5.xyz = normalize((tmpvar_22 * normalize(tmpvar_11)));
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_20.xyz;
  tmpvar_5.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_23)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_21));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float alpha_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  alpha_2 = tmpvar_3;
  mediump float x_4;
  x_4 = (alpha_2 - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  highp vec4 enc_5;
  highp vec2 enc_6;
  enc_6 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_6 = (enc_6 / 1.7777);
  enc_6 = ((enc_6 * 0.5) + 0.5);
  enc_5.xy = enc_6;
  highp vec2 enc_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_7.y = tmpvar_8.y;
  enc_7.x = (tmpvar_8.x - (tmpvar_8.y * 0.003921569));
  enc_5.zw = enc_7;
  tmpvar_1 = enc_5;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _Time;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
uniform highp vec4 _Wind;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp mat4 tmpvar_2;
  tmpvar_2[0].x = m_1[0].x;
  tmpvar_2[0].y = m_1[1].x;
  tmpvar_2[0].z = m_1[2].x;
  tmpvar_2[0].w = m_1[3].x;
  tmpvar_2[1].x = m_1[0].y;
  tmpvar_2[1].y = m_1[1].y;
  tmpvar_2[1].z = m_1[2].y;
  tmpvar_2[1].w = m_1[3].y;
  tmpvar_2[2].x = m_1[0].z;
  tmpvar_2[2].y = m_1[1].z;
  tmpvar_2[2].z = m_1[2].z;
  tmpvar_2[2].w = m_1[3].z;
  tmpvar_2[3].x = m_1[0].w;
  tmpvar_2[3].y = m_1[1].w;
  tmpvar_2[3].z = m_1[2].w;
  tmpvar_2[3].w = m_1[3].w;
  highp vec3 tmpvar_3;
  tmpvar_3 = _glesNormal;
  lowp vec4 tmpvar_4;
  tmpvar_4 = _glesColor;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 pos_7;
  highp float tmpvar_8;
  tmpvar_8 = (1.0 - abs(_glesTANGENT.w));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = tmpvar_3;
  highp vec4 tmpvar_10;
  tmpvar_10.zw = vec2(0.0, 0.0);
  tmpvar_10.xy = tmpvar_3.xy;
  pos_7 = (_glesVertex + ((tmpvar_10 * tmpvar_2) * tmpvar_8));
  highp vec3 tmpvar_11;
  tmpvar_11 = mix (_glesNormal, normalize((tmpvar_9 * tmpvar_2)).xyz, vec3(tmpvar_8));
  tmpvar_6.w = pos_7.w;
  tmpvar_6.xyz = (pos_7.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_12;
  tmpvar_12.xy = tmpvar_4.xy;
  tmpvar_12.zw = _glesMultiTexCoord1.xy;
  highp vec4 pos_13;
  pos_13.w = tmpvar_6.w;
  highp vec3 bend_14;
  highp float tmpvar_15;
  tmpvar_15 = (dot (unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0)) + tmpvar_12.x);
  highp vec2 tmpvar_16;
  tmpvar_16.x = dot (tmpvar_6.xyz, vec3((tmpvar_12.y + tmpvar_15)));
  tmpvar_16.y = tmpvar_15;
  highp vec4 tmpvar_17;
  tmpvar_17 = abs(((
    fract((((
      fract(((_Time.yy + tmpvar_16).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
     * 2.0) - 1.0) + 0.5))
   * 2.0) - 1.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = ((tmpvar_17 * tmpvar_17) * (3.0 - (2.0 * tmpvar_17)));
  highp vec2 tmpvar_19;
  tmpvar_19 = (tmpvar_18.xz + tmpvar_18.yw);
  bend_14.xz = ((tmpvar_12.y * 0.1) * tmpvar_11).xz;
  bend_14.y = (_glesMultiTexCoord1.y * 0.3);
  pos_13.xyz = (tmpvar_6.xyz + ((
    (tmpvar_19.xyx * bend_14)
   + 
    ((_Wind.xyz * tmpvar_19.y) * _glesMultiTexCoord1.y)
  ) * _Wind.w));
  pos_13.xyz = (pos_13.xyz + (_glesMultiTexCoord1.x * _Wind.xyz));
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = mix ((pos_13.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_13.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_13.xyz, vec3(_SquashAmount));
  tmpvar_6 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = tmpvar_20.xyz;
  highp mat3 tmpvar_22;
  tmpvar_22[0] = tmpvar_2[0].xyz;
  tmpvar_22[1] = tmpvar_2[1].xyz;
  tmpvar_22[2] = tmpvar_2[2].xyz;
  tmpvar_5.xyz = normalize((tmpvar_22 * normalize(tmpvar_11)));
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_20.xyz;
  tmpvar_5.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_23)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_21));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float alpha_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  alpha_2 = tmpvar_3;
  mediump float x_4;
  x_4 = (alpha_2 - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  highp vec4 enc_5;
  highp vec2 enc_6;
  enc_6 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_6 = (enc_6 / 1.7777);
  enc_6 = ((enc_6 * 0.5) + 0.5);
  enc_5.xy = enc_6;
  highp vec2 enc_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_7.y = tmpvar_8.y;
  enc_7.x = (tmpvar_8.x - (tmpvar_8.y * 0.003921569));
  enc_5.zw = enc_7;
  tmpvar_1 = enc_5;
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
SubShader {
 Tags { "DisableBatching" = "true" "RenderType" = "TreeOpaque" }
 Pass {
  Tags { "DisableBatching" = "true" "RenderType" = "TreeOpaque" }
  GpuProgramID 262205
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  lowp vec4 tmpvar_5;
  tmpvar_5 = _glesColor;
  highp vec4 tmpvar_6;
  highp vec4 pos_7;
  pos_7.w = _glesVertex.w;
  highp float alpha_8;
  alpha_8 = tmpvar_5.w;
  pos_7.xyz = (_glesVertex.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = pos_7.xyz;
  pos_7.xyz = mix (pos_7.xyz, (_TerrainEngineBendTree * tmpvar_9).xyz, vec3(alpha_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = mix ((pos_7.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_7.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_7.xyz, vec3(_SquashAmount));
  pos_7 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10.xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_12 * _glesNormal));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_13)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  xlv_TEXCOORD0 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec2 enc_3;
  enc_3 = (xlv_TEXCOORD0.xy / (xlv_TEXCOORD0.z + 1.0));
  enc_3 = (enc_3 / 1.7777);
  enc_3 = ((enc_3 * 0.5) + 0.5);
  enc_2.xy = enc_3;
  highp vec2 enc_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD0.w));
  enc_4.y = tmpvar_5.y;
  enc_4.x = (tmpvar_5.x - (tmpvar_5.y * 0.003921569));
  enc_2.zw = enc_4;
  tmpvar_1 = enc_2;
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
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  lowp vec4 tmpvar_5;
  tmpvar_5 = _glesColor;
  highp vec4 tmpvar_6;
  highp vec4 pos_7;
  pos_7.w = _glesVertex.w;
  highp float alpha_8;
  alpha_8 = tmpvar_5.w;
  pos_7.xyz = (_glesVertex.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = pos_7.xyz;
  pos_7.xyz = mix (pos_7.xyz, (_TerrainEngineBendTree * tmpvar_9).xyz, vec3(alpha_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = mix ((pos_7.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_7.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_7.xyz, vec3(_SquashAmount));
  pos_7 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10.xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_12 * _glesNormal));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_13)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  xlv_TEXCOORD0 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec2 enc_3;
  enc_3 = (xlv_TEXCOORD0.xy / (xlv_TEXCOORD0.z + 1.0));
  enc_3 = (enc_3 / 1.7777);
  enc_3 = ((enc_3 * 0.5) + 0.5);
  enc_2.xy = enc_3;
  highp vec2 enc_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD0.w));
  enc_4.y = tmpvar_5.y;
  enc_4.x = (tmpvar_5.x - (tmpvar_5.y * 0.003921569));
  enc_2.zw = enc_4;
  tmpvar_1 = enc_2;
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
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  lowp vec4 tmpvar_5;
  tmpvar_5 = _glesColor;
  highp vec4 tmpvar_6;
  highp vec4 pos_7;
  pos_7.w = _glesVertex.w;
  highp float alpha_8;
  alpha_8 = tmpvar_5.w;
  pos_7.xyz = (_glesVertex.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = pos_7.xyz;
  pos_7.xyz = mix (pos_7.xyz, (_TerrainEngineBendTree * tmpvar_9).xyz, vec3(alpha_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = mix ((pos_7.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_7.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_7.xyz, vec3(_SquashAmount));
  pos_7 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10.xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_12 * _glesNormal));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_13)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  xlv_TEXCOORD0 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec2 enc_3;
  enc_3 = (xlv_TEXCOORD0.xy / (xlv_TEXCOORD0.z + 1.0));
  enc_3 = (enc_3 / 1.7777);
  enc_3 = ((enc_3 * 0.5) + 0.5);
  enc_2.xy = enc_3;
  highp vec2 enc_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD0.w));
  enc_4.y = tmpvar_5.y;
  enc_4.x = (tmpvar_5.x - (tmpvar_5.y * 0.003921569));
  enc_2.zw = enc_4;
  tmpvar_1 = enc_2;
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
SubShader {
 Tags { "DisableBatching" = "true" "RenderType" = "TreeTransparentCutout" }
 Pass {
  Tags { "DisableBatching" = "true" "RenderType" = "TreeTransparentCutout" }
  GpuProgramID 366738
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  lowp vec4 tmpvar_5;
  tmpvar_5 = _glesColor;
  highp vec4 tmpvar_6;
  highp vec4 pos_7;
  pos_7.w = _glesVertex.w;
  highp float alpha_8;
  alpha_8 = tmpvar_5.w;
  pos_7.xyz = (_glesVertex.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = pos_7.xyz;
  pos_7.xyz = mix (pos_7.xyz, (_TerrainEngineBendTree * tmpvar_9).xyz, vec3(alpha_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = mix ((pos_7.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_7.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_7.xyz, vec3(_SquashAmount));
  pos_7 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10.xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_12 * _glesNormal));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_13)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float alpha_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  alpha_2 = tmpvar_3;
  mediump float x_4;
  x_4 = (alpha_2 - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  highp vec4 enc_5;
  highp vec2 enc_6;
  enc_6 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_6 = (enc_6 / 1.7777);
  enc_6 = ((enc_6 * 0.5) + 0.5);
  enc_5.xy = enc_6;
  highp vec2 enc_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_7.y = tmpvar_8.y;
  enc_7.x = (tmpvar_8.x - (tmpvar_8.y * 0.003921569));
  enc_5.zw = enc_7;
  tmpvar_1 = enc_5;
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
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  lowp vec4 tmpvar_5;
  tmpvar_5 = _glesColor;
  highp vec4 tmpvar_6;
  highp vec4 pos_7;
  pos_7.w = _glesVertex.w;
  highp float alpha_8;
  alpha_8 = tmpvar_5.w;
  pos_7.xyz = (_glesVertex.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = pos_7.xyz;
  pos_7.xyz = mix (pos_7.xyz, (_TerrainEngineBendTree * tmpvar_9).xyz, vec3(alpha_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = mix ((pos_7.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_7.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_7.xyz, vec3(_SquashAmount));
  pos_7 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10.xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_12 * _glesNormal));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_13)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float alpha_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  alpha_2 = tmpvar_3;
  mediump float x_4;
  x_4 = (alpha_2 - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  highp vec4 enc_5;
  highp vec2 enc_6;
  enc_6 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_6 = (enc_6 / 1.7777);
  enc_6 = ((enc_6 * 0.5) + 0.5);
  enc_5.xy = enc_6;
  highp vec2 enc_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_7.y = tmpvar_8.y;
  enc_7.x = (tmpvar_8.x - (tmpvar_8.y * 0.003921569));
  enc_5.zw = enc_7;
  tmpvar_1 = enc_5;
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
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  lowp vec4 tmpvar_5;
  tmpvar_5 = _glesColor;
  highp vec4 tmpvar_6;
  highp vec4 pos_7;
  pos_7.w = _glesVertex.w;
  highp float alpha_8;
  alpha_8 = tmpvar_5.w;
  pos_7.xyz = (_glesVertex.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = pos_7.xyz;
  pos_7.xyz = mix (pos_7.xyz, (_TerrainEngineBendTree * tmpvar_9).xyz, vec3(alpha_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = mix ((pos_7.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_7.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_7.xyz, vec3(_SquashAmount));
  pos_7 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10.xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = normalize((tmpvar_12 * _glesNormal));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_13)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float alpha_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  alpha_2 = tmpvar_3;
  mediump float x_4;
  x_4 = (alpha_2 - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  highp vec4 enc_5;
  highp vec2 enc_6;
  enc_6 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_6 = (enc_6 / 1.7777);
  enc_6 = ((enc_6 * 0.5) + 0.5);
  enc_5.xy = enc_6;
  highp vec2 enc_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_7.y = tmpvar_8.y;
  enc_7.x = (tmpvar_8.x - (tmpvar_8.y * 0.003921569));
  enc_5.zw = enc_7;
  tmpvar_1 = enc_5;
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
  Tags { "DisableBatching" = "true" "RenderType" = "TreeTransparentCutout" }
  Cull Front
  GpuProgramID 421841
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  lowp vec4 tmpvar_5;
  tmpvar_5 = _glesColor;
  highp vec4 tmpvar_6;
  highp vec4 pos_7;
  pos_7.w = _glesVertex.w;
  highp float alpha_8;
  alpha_8 = tmpvar_5.w;
  pos_7.xyz = (_glesVertex.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = pos_7.xyz;
  pos_7.xyz = mix (pos_7.xyz, (_TerrainEngineBendTree * tmpvar_9).xyz, vec3(alpha_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = mix ((pos_7.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_7.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_7.xyz, vec3(_SquashAmount));
  pos_7 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10.xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = -(normalize((tmpvar_12 * _glesNormal)));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_13)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = (texture2D (_MainTex, xlv_TEXCOORD0).w - _Cutoff);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
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
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  lowp vec4 tmpvar_5;
  tmpvar_5 = _glesColor;
  highp vec4 tmpvar_6;
  highp vec4 pos_7;
  pos_7.w = _glesVertex.w;
  highp float alpha_8;
  alpha_8 = tmpvar_5.w;
  pos_7.xyz = (_glesVertex.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = pos_7.xyz;
  pos_7.xyz = mix (pos_7.xyz, (_TerrainEngineBendTree * tmpvar_9).xyz, vec3(alpha_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = mix ((pos_7.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_7.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_7.xyz, vec3(_SquashAmount));
  pos_7 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10.xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = -(normalize((tmpvar_12 * _glesNormal)));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_13)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = (texture2D (_MainTex, xlv_TEXCOORD0).w - _Cutoff);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
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
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _TreeInstanceScale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  lowp vec4 tmpvar_5;
  tmpvar_5 = _glesColor;
  highp vec4 tmpvar_6;
  highp vec4 pos_7;
  pos_7.w = _glesVertex.w;
  highp float alpha_8;
  alpha_8 = tmpvar_5.w;
  pos_7.xyz = (_glesVertex.xyz * _TreeInstanceScale.xyz);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = pos_7.xyz;
  pos_7.xyz = mix (pos_7.xyz, (_TerrainEngineBendTree * tmpvar_9).xyz, vec3(alpha_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = mix ((pos_7.xyz - (
    (dot (_SquashPlaneNormal.xyz, pos_7.xyz) + _SquashPlaneNormal.w)
   * _SquashPlaneNormal.xyz)), pos_7.xyz, vec3(_SquashAmount));
  pos_7 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10.xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  tmpvar_6.xyz = -(normalize((tmpvar_12 * _glesNormal)));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10.xyz;
  tmpvar_6.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_13)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = (texture2D (_MainTex, xlv_TEXCOORD0).w - _Cutoff);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
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
SubShader {
 Tags { "RenderType" = "TreeBillboard" }
 Pass {
  Tags { "RenderType" = "TreeBillboard" }
  Cull Off
  GpuProgramID 498374
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec3 _TreeBillboardCameraRight;
uniform highp vec4 _TreeBillboardCameraUp;
uniform highp vec4 _TreeBillboardCameraFront;
uniform highp vec4 _TreeBillboardCameraPos;
uniform highp vec4 _TreeBillboardDistances;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = _glesVertex;
  highp vec2 offset_5;
  offset_5 = _glesMultiTexCoord1.xy;
  highp float offsetz_6;
  offsetz_6 = tmpvar_1.y;
  highp vec3 tmpvar_7;
  tmpvar_7 = (_glesVertex.xyz - _TreeBillboardCameraPos.xyz);
  highp float tmpvar_8;
  tmpvar_8 = dot (tmpvar_7, tmpvar_7);
  if ((tmpvar_8 > _TreeBillboardDistances.x)) {
    offsetz_6 = 0.0;
    offset_5 = vec2(0.0, 0.0);
  };
  pos_4.xyz = (_glesVertex.xyz + (_TreeBillboardCameraRight * offset_5.x));
  pos_4.xyz = (pos_4.xyz + (_TreeBillboardCameraUp.xyz * mix (offset_5.y, offsetz_6, _TreeBillboardCameraPos.w)));
  pos_4.xyz = (pos_4.xyz + ((_TreeBillboardCameraFront.xyz * 
    abs(offset_5.x)
  ) * _TreeBillboardCameraUp.w));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = pos_4.xyz;
  tmpvar_2.x = tmpvar_1.x;
  tmpvar_2.y = float((_glesMultiTexCoord0.y > 0.0));
  tmpvar_3.xyz = vec3(0.0, 0.0, 1.0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = pos_4.xyz;
  tmpvar_3.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = (texture2D (_MainTex, xlv_TEXCOORD0).w - 0.001);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec3 _TreeBillboardCameraRight;
uniform highp vec4 _TreeBillboardCameraUp;
uniform highp vec4 _TreeBillboardCameraFront;
uniform highp vec4 _TreeBillboardCameraPos;
uniform highp vec4 _TreeBillboardDistances;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = _glesVertex;
  highp vec2 offset_5;
  offset_5 = _glesMultiTexCoord1.xy;
  highp float offsetz_6;
  offsetz_6 = tmpvar_1.y;
  highp vec3 tmpvar_7;
  tmpvar_7 = (_glesVertex.xyz - _TreeBillboardCameraPos.xyz);
  highp float tmpvar_8;
  tmpvar_8 = dot (tmpvar_7, tmpvar_7);
  if ((tmpvar_8 > _TreeBillboardDistances.x)) {
    offsetz_6 = 0.0;
    offset_5 = vec2(0.0, 0.0);
  };
  pos_4.xyz = (_glesVertex.xyz + (_TreeBillboardCameraRight * offset_5.x));
  pos_4.xyz = (pos_4.xyz + (_TreeBillboardCameraUp.xyz * mix (offset_5.y, offsetz_6, _TreeBillboardCameraPos.w)));
  pos_4.xyz = (pos_4.xyz + ((_TreeBillboardCameraFront.xyz * 
    abs(offset_5.x)
  ) * _TreeBillboardCameraUp.w));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = pos_4.xyz;
  tmpvar_2.x = tmpvar_1.x;
  tmpvar_2.y = float((_glesMultiTexCoord0.y > 0.0));
  tmpvar_3.xyz = vec3(0.0, 0.0, 1.0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = pos_4.xyz;
  tmpvar_3.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = (texture2D (_MainTex, xlv_TEXCOORD0).w - 0.001);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec3 _TreeBillboardCameraRight;
uniform highp vec4 _TreeBillboardCameraUp;
uniform highp vec4 _TreeBillboardCameraFront;
uniform highp vec4 _TreeBillboardCameraPos;
uniform highp vec4 _TreeBillboardDistances;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = _glesVertex;
  highp vec2 offset_5;
  offset_5 = _glesMultiTexCoord1.xy;
  highp float offsetz_6;
  offsetz_6 = tmpvar_1.y;
  highp vec3 tmpvar_7;
  tmpvar_7 = (_glesVertex.xyz - _TreeBillboardCameraPos.xyz);
  highp float tmpvar_8;
  tmpvar_8 = dot (tmpvar_7, tmpvar_7);
  if ((tmpvar_8 > _TreeBillboardDistances.x)) {
    offsetz_6 = 0.0;
    offset_5 = vec2(0.0, 0.0);
  };
  pos_4.xyz = (_glesVertex.xyz + (_TreeBillboardCameraRight * offset_5.x));
  pos_4.xyz = (pos_4.xyz + (_TreeBillboardCameraUp.xyz * mix (offset_5.y, offsetz_6, _TreeBillboardCameraPos.w)));
  pos_4.xyz = (pos_4.xyz + ((_TreeBillboardCameraFront.xyz * 
    abs(offset_5.x)
  ) * _TreeBillboardCameraUp.w));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = pos_4.xyz;
  tmpvar_2.x = tmpvar_1.x;
  tmpvar_2.y = float((_glesMultiTexCoord0.y > 0.0));
  tmpvar_3.xyz = vec3(0.0, 0.0, 1.0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = pos_4.xyz;
  tmpvar_3.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = (texture2D (_MainTex, xlv_TEXCOORD0).w - 0.001);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
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
SubShader {
 Tags { "RenderType" = "GrassBillboard" }
 Pass {
  Tags { "RenderType" = "GrassBillboard" }
  Cull Off
  GpuProgramID 545325
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _WavingTint;
uniform highp vec4 _WaveAndDistance;
uniform highp vec4 _CameraPosition;
uniform highp vec3 _CameraRight;
uniform highp vec3 _CameraUp;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesMultiTexCoord0;
  lowp vec4 tmpvar_6;
  tmpvar_6 = _glesColor;
  highp vec4 tmpvar_7;
  highp vec4 pos_8;
  pos_8 = _glesVertex;
  highp vec2 offset_9;
  offset_9 = _glesTANGENT.xy;
  highp vec3 tmpvar_10;
  tmpvar_10 = (_glesVertex.xyz - _CameraPosition.xyz);
  highp float tmpvar_11;
  tmpvar_11 = dot (tmpvar_10, tmpvar_10);
  if ((tmpvar_11 > _WaveAndDistance.w)) {
    offset_9 = vec2(0.0, 0.0);
  };
  pos_8.xyz = (_glesVertex.xyz + (offset_9.x * _CameraRight));
  pos_8.xyz = (pos_8.xyz + (offset_9.y * _CameraUp));
  highp vec4 vertex_12;
  vertex_12.yw = pos_8.yw;
  lowp vec4 color_13;
  color_13.xyz = tmpvar_6.xyz;
  lowp vec3 waveColor_14;
  highp vec3 waveMove_15;
  highp vec4 s_16;
  highp vec4 waves_17;
  waves_17 = (pos_8.x * (vec4(0.012, 0.02, 0.06, 0.024) * _WaveAndDistance.y));
  waves_17 = (waves_17 + (pos_8.z * (vec4(0.006, 0.02, 0.02, 0.05) * _WaveAndDistance.y)));
  waves_17 = (waves_17 + (_WaveAndDistance.x * vec4(1.2, 2.0, 1.6, 4.8)));
  highp vec4 tmpvar_18;
  tmpvar_18 = fract(waves_17);
  waves_17 = tmpvar_18;
  highp vec4 val_19;
  highp vec4 s_20;
  val_19 = ((tmpvar_18 * 6.408849) - 3.141593);
  highp vec4 tmpvar_21;
  tmpvar_21 = (val_19 * val_19);
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_21 * val_19);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * tmpvar_21);
  s_20 = (((val_19 + 
    (tmpvar_22 * -0.1616162)
  ) + (tmpvar_23 * 0.0083333)) + ((tmpvar_23 * tmpvar_21) * -0.00019841));
  s_16 = (s_20 * s_20);
  s_16 = (s_16 * s_16);
  highp float tmpvar_24;
  tmpvar_24 = (dot (s_16, vec4(0.6741998, 0.6741998, 0.2696799, 0.13484)) * 0.7);
  s_16 = (s_16 * _glesTANGENT.y);
  waveMove_15.y = 0.0;
  waveMove_15.x = dot (s_16, vec4(0.024, 0.04, -0.12, 0.096));
  waveMove_15.z = dot (s_16, vec4(0.006, 0.02, -0.02, 0.1));
  vertex_12.xz = (pos_8.xz - (waveMove_15.xz * _WaveAndDistance.z));
  highp vec3 tmpvar_25;
  tmpvar_25 = mix (vec3(0.5, 0.5, 0.5), _WavingTint.xyz, vec3(tmpvar_24));
  waveColor_14 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (vertex_12.xyz - _CameraPosition.xyz);
  highp float tmpvar_27;
  tmpvar_27 = clamp (((2.0 * 
    (_WaveAndDistance.w - dot (tmpvar_26, tmpvar_26))
  ) * _CameraPosition.w), 0.0, 1.0);
  color_13.w = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.xyz = ((2.0 * waveColor_14) * _glesColor.xyz);
  tmpvar_28.w = color_13.w;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = vertex_12.xyz;
  highp mat3 tmpvar_30;
  tmpvar_30[0] = tmpvar_2.xyz;
  tmpvar_30[1] = tmpvar_3.xyz;
  tmpvar_30[2] = tmpvar_4.xyz;
  tmpvar_7.xyz = normalize((tmpvar_30 * _glesNormal));
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = vertex_12.xyz;
  tmpvar_7.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_31)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_29));
  xlv_COLOR = tmpvar_28;
  xlv_TEXCOORD0 = tmpvar_5.xy;
  xlv_TEXCOORD1 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = ((texture2D (_MainTex, xlv_TEXCOORD0).w * xlv_COLOR.w) - _Cutoff);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _WavingTint;
uniform highp vec4 _WaveAndDistance;
uniform highp vec4 _CameraPosition;
uniform highp vec3 _CameraRight;
uniform highp vec3 _CameraUp;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesMultiTexCoord0;
  lowp vec4 tmpvar_6;
  tmpvar_6 = _glesColor;
  highp vec4 tmpvar_7;
  highp vec4 pos_8;
  pos_8 = _glesVertex;
  highp vec2 offset_9;
  offset_9 = _glesTANGENT.xy;
  highp vec3 tmpvar_10;
  tmpvar_10 = (_glesVertex.xyz - _CameraPosition.xyz);
  highp float tmpvar_11;
  tmpvar_11 = dot (tmpvar_10, tmpvar_10);
  if ((tmpvar_11 > _WaveAndDistance.w)) {
    offset_9 = vec2(0.0, 0.0);
  };
  pos_8.xyz = (_glesVertex.xyz + (offset_9.x * _CameraRight));
  pos_8.xyz = (pos_8.xyz + (offset_9.y * _CameraUp));
  highp vec4 vertex_12;
  vertex_12.yw = pos_8.yw;
  lowp vec4 color_13;
  color_13.xyz = tmpvar_6.xyz;
  lowp vec3 waveColor_14;
  highp vec3 waveMove_15;
  highp vec4 s_16;
  highp vec4 waves_17;
  waves_17 = (pos_8.x * (vec4(0.012, 0.02, 0.06, 0.024) * _WaveAndDistance.y));
  waves_17 = (waves_17 + (pos_8.z * (vec4(0.006, 0.02, 0.02, 0.05) * _WaveAndDistance.y)));
  waves_17 = (waves_17 + (_WaveAndDistance.x * vec4(1.2, 2.0, 1.6, 4.8)));
  highp vec4 tmpvar_18;
  tmpvar_18 = fract(waves_17);
  waves_17 = tmpvar_18;
  highp vec4 val_19;
  highp vec4 s_20;
  val_19 = ((tmpvar_18 * 6.408849) - 3.141593);
  highp vec4 tmpvar_21;
  tmpvar_21 = (val_19 * val_19);
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_21 * val_19);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * tmpvar_21);
  s_20 = (((val_19 + 
    (tmpvar_22 * -0.1616162)
  ) + (tmpvar_23 * 0.0083333)) + ((tmpvar_23 * tmpvar_21) * -0.00019841));
  s_16 = (s_20 * s_20);
  s_16 = (s_16 * s_16);
  highp float tmpvar_24;
  tmpvar_24 = (dot (s_16, vec4(0.6741998, 0.6741998, 0.2696799, 0.13484)) * 0.7);
  s_16 = (s_16 * _glesTANGENT.y);
  waveMove_15.y = 0.0;
  waveMove_15.x = dot (s_16, vec4(0.024, 0.04, -0.12, 0.096));
  waveMove_15.z = dot (s_16, vec4(0.006, 0.02, -0.02, 0.1));
  vertex_12.xz = (pos_8.xz - (waveMove_15.xz * _WaveAndDistance.z));
  highp vec3 tmpvar_25;
  tmpvar_25 = mix (vec3(0.5, 0.5, 0.5), _WavingTint.xyz, vec3(tmpvar_24));
  waveColor_14 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (vertex_12.xyz - _CameraPosition.xyz);
  highp float tmpvar_27;
  tmpvar_27 = clamp (((2.0 * 
    (_WaveAndDistance.w - dot (tmpvar_26, tmpvar_26))
  ) * _CameraPosition.w), 0.0, 1.0);
  color_13.w = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.xyz = ((2.0 * waveColor_14) * _glesColor.xyz);
  tmpvar_28.w = color_13.w;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = vertex_12.xyz;
  highp mat3 tmpvar_30;
  tmpvar_30[0] = tmpvar_2.xyz;
  tmpvar_30[1] = tmpvar_3.xyz;
  tmpvar_30[2] = tmpvar_4.xyz;
  tmpvar_7.xyz = normalize((tmpvar_30 * _glesNormal));
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = vertex_12.xyz;
  tmpvar_7.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_31)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_29));
  xlv_COLOR = tmpvar_28;
  xlv_TEXCOORD0 = tmpvar_5.xy;
  xlv_TEXCOORD1 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = ((texture2D (_MainTex, xlv_TEXCOORD0).w * xlv_COLOR.w) - _Cutoff);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _WavingTint;
uniform highp vec4 _WaveAndDistance;
uniform highp vec4 _CameraPosition;
uniform highp vec3 _CameraRight;
uniform highp vec3 _CameraUp;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesMultiTexCoord0;
  lowp vec4 tmpvar_6;
  tmpvar_6 = _glesColor;
  highp vec4 tmpvar_7;
  highp vec4 pos_8;
  pos_8 = _glesVertex;
  highp vec2 offset_9;
  offset_9 = _glesTANGENT.xy;
  highp vec3 tmpvar_10;
  tmpvar_10 = (_glesVertex.xyz - _CameraPosition.xyz);
  highp float tmpvar_11;
  tmpvar_11 = dot (tmpvar_10, tmpvar_10);
  if ((tmpvar_11 > _WaveAndDistance.w)) {
    offset_9 = vec2(0.0, 0.0);
  };
  pos_8.xyz = (_glesVertex.xyz + (offset_9.x * _CameraRight));
  pos_8.xyz = (pos_8.xyz + (offset_9.y * _CameraUp));
  highp vec4 vertex_12;
  vertex_12.yw = pos_8.yw;
  lowp vec4 color_13;
  color_13.xyz = tmpvar_6.xyz;
  lowp vec3 waveColor_14;
  highp vec3 waveMove_15;
  highp vec4 s_16;
  highp vec4 waves_17;
  waves_17 = (pos_8.x * (vec4(0.012, 0.02, 0.06, 0.024) * _WaveAndDistance.y));
  waves_17 = (waves_17 + (pos_8.z * (vec4(0.006, 0.02, 0.02, 0.05) * _WaveAndDistance.y)));
  waves_17 = (waves_17 + (_WaveAndDistance.x * vec4(1.2, 2.0, 1.6, 4.8)));
  highp vec4 tmpvar_18;
  tmpvar_18 = fract(waves_17);
  waves_17 = tmpvar_18;
  highp vec4 val_19;
  highp vec4 s_20;
  val_19 = ((tmpvar_18 * 6.408849) - 3.141593);
  highp vec4 tmpvar_21;
  tmpvar_21 = (val_19 * val_19);
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_21 * val_19);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * tmpvar_21);
  s_20 = (((val_19 + 
    (tmpvar_22 * -0.1616162)
  ) + (tmpvar_23 * 0.0083333)) + ((tmpvar_23 * tmpvar_21) * -0.00019841));
  s_16 = (s_20 * s_20);
  s_16 = (s_16 * s_16);
  highp float tmpvar_24;
  tmpvar_24 = (dot (s_16, vec4(0.6741998, 0.6741998, 0.2696799, 0.13484)) * 0.7);
  s_16 = (s_16 * _glesTANGENT.y);
  waveMove_15.y = 0.0;
  waveMove_15.x = dot (s_16, vec4(0.024, 0.04, -0.12, 0.096));
  waveMove_15.z = dot (s_16, vec4(0.006, 0.02, -0.02, 0.1));
  vertex_12.xz = (pos_8.xz - (waveMove_15.xz * _WaveAndDistance.z));
  highp vec3 tmpvar_25;
  tmpvar_25 = mix (vec3(0.5, 0.5, 0.5), _WavingTint.xyz, vec3(tmpvar_24));
  waveColor_14 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (vertex_12.xyz - _CameraPosition.xyz);
  highp float tmpvar_27;
  tmpvar_27 = clamp (((2.0 * 
    (_WaveAndDistance.w - dot (tmpvar_26, tmpvar_26))
  ) * _CameraPosition.w), 0.0, 1.0);
  color_13.w = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.xyz = ((2.0 * waveColor_14) * _glesColor.xyz);
  tmpvar_28.w = color_13.w;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = vertex_12.xyz;
  highp mat3 tmpvar_30;
  tmpvar_30[0] = tmpvar_2.xyz;
  tmpvar_30[1] = tmpvar_3.xyz;
  tmpvar_30[2] = tmpvar_4.xyz;
  tmpvar_7.xyz = normalize((tmpvar_30 * _glesNormal));
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = vertex_12.xyz;
  tmpvar_7.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_31)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_29));
  xlv_COLOR = tmpvar_28;
  xlv_TEXCOORD0 = tmpvar_5.xy;
  xlv_TEXCOORD1 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = ((texture2D (_MainTex, xlv_TEXCOORD0).w * xlv_COLOR.w) - _Cutoff);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
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
SubShader {
 Tags { "RenderType" = "Grass" }
 Pass {
  Tags { "RenderType" = "Grass" }
  Cull Off
  GpuProgramID 631617
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _WavingTint;
uniform highp vec4 _WaveAndDistance;
uniform highp vec4 _CameraPosition;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  highp vec4 vertex_6;
  vertex_6.yw = _glesVertex.yw;
  lowp vec4 color_7;
  color_7.xyz = _glesColor.xyz;
  lowp vec3 waveColor_8;
  highp vec3 waveMove_9;
  highp vec4 s_10;
  highp vec4 waves_11;
  waves_11 = (_glesVertex.x * (vec4(0.012, 0.02, 0.06, 0.024) * _WaveAndDistance.y));
  waves_11 = (waves_11 + (_glesVertex.z * (vec4(0.006, 0.02, 0.02, 0.05) * _WaveAndDistance.y)));
  waves_11 = (waves_11 + (_WaveAndDistance.x * vec4(1.2, 2.0, 1.6, 4.8)));
  highp vec4 tmpvar_12;
  tmpvar_12 = fract(waves_11);
  waves_11 = tmpvar_12;
  highp vec4 val_13;
  highp vec4 s_14;
  val_13 = ((tmpvar_12 * 6.408849) - 3.141593);
  highp vec4 tmpvar_15;
  tmpvar_15 = (val_13 * val_13);
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * val_13);
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_15);
  s_14 = (((val_13 + 
    (tmpvar_16 * -0.1616162)
  ) + (tmpvar_17 * 0.0083333)) + ((tmpvar_17 * tmpvar_15) * -0.00019841));
  s_10 = (s_14 * s_14);
  s_10 = (s_10 * s_10);
  highp float tmpvar_18;
  tmpvar_18 = (dot (s_10, vec4(0.6741998, 0.6741998, 0.2696799, 0.13484)) * 0.7);
  s_10 = (s_10 * (_glesColor.w * _WaveAndDistance.z));
  waveMove_9.y = 0.0;
  waveMove_9.x = dot (s_10, vec4(0.024, 0.04, -0.12, 0.096));
  waveMove_9.z = dot (s_10, vec4(0.006, 0.02, -0.02, 0.1));
  vertex_6.xz = (_glesVertex.xz - (waveMove_9.xz * _WaveAndDistance.z));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (vec3(0.5, 0.5, 0.5), _WavingTint.xyz, vec3(tmpvar_18));
  waveColor_8 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (vertex_6.xyz - _CameraPosition.xyz);
  highp float tmpvar_21;
  tmpvar_21 = clamp (((2.0 * 
    (_WaveAndDistance.w - dot (tmpvar_20, tmpvar_20))
  ) * _CameraPosition.w), 0.0, 1.0);
  color_7.w = tmpvar_21;
  lowp vec4 tmpvar_22;
  tmpvar_22.xyz = ((2.0 * waveColor_8) * _glesColor.xyz);
  tmpvar_22.w = color_7.w;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = vertex_6.xyz;
  highp mat3 tmpvar_24;
  tmpvar_24[0] = tmpvar_2.xyz;
  tmpvar_24[1] = tmpvar_3.xyz;
  tmpvar_24[2] = tmpvar_4.xyz;
  tmpvar_5.xyz = normalize((tmpvar_24 * _glesNormal));
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = vertex_6.xyz;
  tmpvar_5.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_25)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_23));
  xlv_COLOR = tmpvar_22;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = ((texture2D (_MainTex, xlv_TEXCOORD0).w * xlv_COLOR.w) - _Cutoff);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
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
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _WavingTint;
uniform highp vec4 _WaveAndDistance;
uniform highp vec4 _CameraPosition;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  highp vec4 vertex_6;
  vertex_6.yw = _glesVertex.yw;
  lowp vec4 color_7;
  color_7.xyz = _glesColor.xyz;
  lowp vec3 waveColor_8;
  highp vec3 waveMove_9;
  highp vec4 s_10;
  highp vec4 waves_11;
  waves_11 = (_glesVertex.x * (vec4(0.012, 0.02, 0.06, 0.024) * _WaveAndDistance.y));
  waves_11 = (waves_11 + (_glesVertex.z * (vec4(0.006, 0.02, 0.02, 0.05) * _WaveAndDistance.y)));
  waves_11 = (waves_11 + (_WaveAndDistance.x * vec4(1.2, 2.0, 1.6, 4.8)));
  highp vec4 tmpvar_12;
  tmpvar_12 = fract(waves_11);
  waves_11 = tmpvar_12;
  highp vec4 val_13;
  highp vec4 s_14;
  val_13 = ((tmpvar_12 * 6.408849) - 3.141593);
  highp vec4 tmpvar_15;
  tmpvar_15 = (val_13 * val_13);
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * val_13);
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_15);
  s_14 = (((val_13 + 
    (tmpvar_16 * -0.1616162)
  ) + (tmpvar_17 * 0.0083333)) + ((tmpvar_17 * tmpvar_15) * -0.00019841));
  s_10 = (s_14 * s_14);
  s_10 = (s_10 * s_10);
  highp float tmpvar_18;
  tmpvar_18 = (dot (s_10, vec4(0.6741998, 0.6741998, 0.2696799, 0.13484)) * 0.7);
  s_10 = (s_10 * (_glesColor.w * _WaveAndDistance.z));
  waveMove_9.y = 0.0;
  waveMove_9.x = dot (s_10, vec4(0.024, 0.04, -0.12, 0.096));
  waveMove_9.z = dot (s_10, vec4(0.006, 0.02, -0.02, 0.1));
  vertex_6.xz = (_glesVertex.xz - (waveMove_9.xz * _WaveAndDistance.z));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (vec3(0.5, 0.5, 0.5), _WavingTint.xyz, vec3(tmpvar_18));
  waveColor_8 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (vertex_6.xyz - _CameraPosition.xyz);
  highp float tmpvar_21;
  tmpvar_21 = clamp (((2.0 * 
    (_WaveAndDistance.w - dot (tmpvar_20, tmpvar_20))
  ) * _CameraPosition.w), 0.0, 1.0);
  color_7.w = tmpvar_21;
  lowp vec4 tmpvar_22;
  tmpvar_22.xyz = ((2.0 * waveColor_8) * _glesColor.xyz);
  tmpvar_22.w = color_7.w;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = vertex_6.xyz;
  highp mat3 tmpvar_24;
  tmpvar_24[0] = tmpvar_2.xyz;
  tmpvar_24[1] = tmpvar_3.xyz;
  tmpvar_24[2] = tmpvar_4.xyz;
  tmpvar_5.xyz = normalize((tmpvar_24 * _glesNormal));
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = vertex_6.xyz;
  tmpvar_5.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_25)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_23));
  xlv_COLOR = tmpvar_22;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = ((texture2D (_MainTex, xlv_TEXCOORD0).w * xlv_COLOR.w) - _Cutoff);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
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
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _WavingTint;
uniform highp vec4 _WaveAndDistance;
uniform highp vec4 _CameraPosition;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  highp vec4 vertex_6;
  vertex_6.yw = _glesVertex.yw;
  lowp vec4 color_7;
  color_7.xyz = _glesColor.xyz;
  lowp vec3 waveColor_8;
  highp vec3 waveMove_9;
  highp vec4 s_10;
  highp vec4 waves_11;
  waves_11 = (_glesVertex.x * (vec4(0.012, 0.02, 0.06, 0.024) * _WaveAndDistance.y));
  waves_11 = (waves_11 + (_glesVertex.z * (vec4(0.006, 0.02, 0.02, 0.05) * _WaveAndDistance.y)));
  waves_11 = (waves_11 + (_WaveAndDistance.x * vec4(1.2, 2.0, 1.6, 4.8)));
  highp vec4 tmpvar_12;
  tmpvar_12 = fract(waves_11);
  waves_11 = tmpvar_12;
  highp vec4 val_13;
  highp vec4 s_14;
  val_13 = ((tmpvar_12 * 6.408849) - 3.141593);
  highp vec4 tmpvar_15;
  tmpvar_15 = (val_13 * val_13);
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * val_13);
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * tmpvar_15);
  s_14 = (((val_13 + 
    (tmpvar_16 * -0.1616162)
  ) + (tmpvar_17 * 0.0083333)) + ((tmpvar_17 * tmpvar_15) * -0.00019841));
  s_10 = (s_14 * s_14);
  s_10 = (s_10 * s_10);
  highp float tmpvar_18;
  tmpvar_18 = (dot (s_10, vec4(0.6741998, 0.6741998, 0.2696799, 0.13484)) * 0.7);
  s_10 = (s_10 * (_glesColor.w * _WaveAndDistance.z));
  waveMove_9.y = 0.0;
  waveMove_9.x = dot (s_10, vec4(0.024, 0.04, -0.12, 0.096));
  waveMove_9.z = dot (s_10, vec4(0.006, 0.02, -0.02, 0.1));
  vertex_6.xz = (_glesVertex.xz - (waveMove_9.xz * _WaveAndDistance.z));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (vec3(0.5, 0.5, 0.5), _WavingTint.xyz, vec3(tmpvar_18));
  waveColor_8 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (vertex_6.xyz - _CameraPosition.xyz);
  highp float tmpvar_21;
  tmpvar_21 = clamp (((2.0 * 
    (_WaveAndDistance.w - dot (tmpvar_20, tmpvar_20))
  ) * _CameraPosition.w), 0.0, 1.0);
  color_7.w = tmpvar_21;
  lowp vec4 tmpvar_22;
  tmpvar_22.xyz = ((2.0 * waveColor_8) * _glesColor.xyz);
  tmpvar_22.w = color_7.w;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = vertex_6.xyz;
  highp mat3 tmpvar_24;
  tmpvar_24[0] = tmpvar_2.xyz;
  tmpvar_24[1] = tmpvar_3.xyz;
  tmpvar_24[2] = tmpvar_4.xyz;
  tmpvar_5.xyz = normalize((tmpvar_24 * _glesNormal));
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = vertex_6.xyz;
  tmpvar_5.w = -(((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_25)
  ).z * _ProjectionParams.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_23));
  xlv_COLOR = tmpvar_22;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float x_2;
  x_2 = ((texture2D (_MainTex, xlv_TEXCOORD0).w * xlv_COLOR.w) - _Cutoff);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 enc_3;
  highp vec2 enc_4;
  enc_4 = (xlv_TEXCOORD1.xy / (xlv_TEXCOORD1.z + 1.0));
  enc_4 = (enc_4 / 1.7777);
  enc_4 = ((enc_4 * 0.5) + 0.5);
  enc_3.xy = enc_4;
  highp vec2 enc_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = fract((vec2(1.0, 255.0) * xlv_TEXCOORD1.w));
  enc_5.y = tmpvar_6.y;
  enc_5.x = (tmpvar_6.x - (tmpvar_6.y * 0.003921569));
  enc_3.zw = enc_5;
  tmpvar_1 = enc_3;
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