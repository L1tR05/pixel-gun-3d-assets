//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Mobile/Diffuse Detail" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB)", 2D) = "white" { }
_Detail ("Detail (RGB)", 2D) = "gray" { }
}
SubShader {
 Pass {
  Tags { "LIGHTMODE" = "Vertex" }
  GpuProgramID 41504
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Detail_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  mediump vec3 lcolor_5;
  mediump vec3 eyeNormal_6;
  mediump vec4 color_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesNormal));
  eyeNormal_6 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_11;
  dirToLight_11 = tmpvar_10;
  lcolor_5 = min (((
    (max (dot (eyeNormal_6, dirToLight_11), 0.0) * _Color.xyz)
   * unity_LightColor[0].xyz) * 0.5), vec3(1.0, 1.0, 1.0));
  highp vec3 tmpvar_12;
  tmpvar_12 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_13;
  dirToLight_13 = tmpvar_12;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_13), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_14;
  tmpvar_14 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_15;
  dirToLight_15 = tmpvar_14;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_15), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_16;
  tmpvar_16 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_17;
  dirToLight_17 = tmpvar_16;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_19;
  dirToLight_19 = tmpvar_18;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_20;
  tmpvar_20 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_21;
  dirToLight_21 = tmpvar_20;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_21), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_22;
  tmpvar_22 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_23;
  dirToLight_23 = tmpvar_22;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_23), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_25;
  dirToLight_25 = tmpvar_24;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_25), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_7.xyz = lcolor_5;
  color_7.w = _Color.w;
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_7, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_26;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Detail_ST.xy) + _Detail_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_28));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * texture2D (_Detail, xlv_TEXCOORD1)).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = col_1.w;
  gl_FragData[0] = col_1;
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
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Detail_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  mediump vec3 lcolor_5;
  mediump vec3 eyeNormal_6;
  mediump vec4 color_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesNormal));
  eyeNormal_6 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_11;
  dirToLight_11 = tmpvar_10;
  lcolor_5 = min (((
    (max (dot (eyeNormal_6, dirToLight_11), 0.0) * _Color.xyz)
   * unity_LightColor[0].xyz) * 0.5), vec3(1.0, 1.0, 1.0));
  highp vec3 tmpvar_12;
  tmpvar_12 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_13;
  dirToLight_13 = tmpvar_12;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_13), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_14;
  tmpvar_14 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_15;
  dirToLight_15 = tmpvar_14;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_15), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_16;
  tmpvar_16 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_17;
  dirToLight_17 = tmpvar_16;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_19;
  dirToLight_19 = tmpvar_18;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_20;
  tmpvar_20 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_21;
  dirToLight_21 = tmpvar_20;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_21), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_22;
  tmpvar_22 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_23;
  dirToLight_23 = tmpvar_22;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_23), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_25;
  dirToLight_25 = tmpvar_24;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_25), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_7.xyz = lcolor_5;
  color_7.w = _Color.w;
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_7, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_26;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Detail_ST.xy) + _Detail_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_28));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * texture2D (_Detail, xlv_TEXCOORD1)).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = col_1.w;
  gl_FragData[0] = col_1;
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
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Detail_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  mediump vec3 lcolor_5;
  mediump vec3 eyeNormal_6;
  mediump vec4 color_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_2.xyz;
  tmpvar_8[1] = tmpvar_3.xyz;
  tmpvar_8[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesNormal));
  eyeNormal_6 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_11;
  dirToLight_11 = tmpvar_10;
  lcolor_5 = min (((
    (max (dot (eyeNormal_6, dirToLight_11), 0.0) * _Color.xyz)
   * unity_LightColor[0].xyz) * 0.5), vec3(1.0, 1.0, 1.0));
  highp vec3 tmpvar_12;
  tmpvar_12 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_13;
  dirToLight_13 = tmpvar_12;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_13), 0.0) * _Color.xyz) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_14;
  tmpvar_14 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_15;
  dirToLight_15 = tmpvar_14;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_15), 0.0) * _Color.xyz) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_16;
  tmpvar_16 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_17;
  dirToLight_17 = tmpvar_16;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_19;
  dirToLight_19 = tmpvar_18;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_20;
  tmpvar_20 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_21;
  dirToLight_21 = tmpvar_20;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_21), 0.0) * _Color.xyz) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_22;
  tmpvar_22 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_23;
  dirToLight_23 = tmpvar_22;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_23), 0.0) * _Color.xyz) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_25;
  dirToLight_25 = tmpvar_24;
  lcolor_5 = (lcolor_5 + min ((
    ((max (dot (eyeNormal_6, dirToLight_25), 0.0) * _Color.xyz) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_7.xyz = lcolor_5;
  color_7.w = _Color.w;
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_7, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_26;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Detail_ST.xy) + _Detail_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_28));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * texture2D (_Detail, xlv_TEXCOORD1)).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = col_1.w;
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Detail_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = vec3(0.0, 0.0, 0.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_14;
    highp vec3 dirToLight_15;
    dirToLight_15 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_16;
    tmpvar_16 = dot (dirToLight_15, dirToLight_15);
    att_14 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_16))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_16 > unity_LightAtten[il_6].w))) {
      att_14 = 0.0;
    };
    dirToLight_15 = (dirToLight_15 * inversesqrt(max (tmpvar_16, 1e-06)));
    att_14 = (att_14 * 0.5);
    mediump vec3 dirToLight_17;
    dirToLight_17 = dirToLight_15;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_14), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = clamp (color_10, 0.0, 1.0);
  tmpvar_18 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_18;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Detail_ST.xy) + _Detail_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * texture2D (_Detail, xlv_TEXCOORD1)).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = col_1.w;
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Detail_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = vec3(0.0, 0.0, 0.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_14;
    highp vec3 dirToLight_15;
    dirToLight_15 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_16;
    tmpvar_16 = dot (dirToLight_15, dirToLight_15);
    att_14 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_16))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_16 > unity_LightAtten[il_6].w))) {
      att_14 = 0.0;
    };
    dirToLight_15 = (dirToLight_15 * inversesqrt(max (tmpvar_16, 1e-06)));
    att_14 = (att_14 * 0.5);
    mediump vec3 dirToLight_17;
    dirToLight_17 = dirToLight_15;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_14), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = clamp (color_10, 0.0, 1.0);
  tmpvar_18 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_18;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Detail_ST.xy) + _Detail_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * texture2D (_Detail, xlv_TEXCOORD1)).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = col_1.w;
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Detail_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = vec3(0.0, 0.0, 0.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_14;
    highp vec3 dirToLight_15;
    dirToLight_15 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_16;
    tmpvar_16 = dot (dirToLight_15, dirToLight_15);
    att_14 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_16))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_16 > unity_LightAtten[il_6].w))) {
      att_14 = 0.0;
    };
    dirToLight_15 = (dirToLight_15 * inversesqrt(max (tmpvar_16, 1e-06)));
    att_14 = (att_14 * 0.5);
    mediump vec3 dirToLight_17;
    dirToLight_17 = dirToLight_15;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_17), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_14), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = clamp (color_10, 0.0, 1.0);
  tmpvar_18 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_18;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Detail_ST.xy) + _Detail_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * texture2D (_Detail, xlv_TEXCOORD1)).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = col_1.w;
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Detail_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = vec3(0.0, 0.0, 0.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_14;
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    highp float tmpvar_18;
    tmpvar_18 = max (dot (dirToLight_16, unity_SpotDirection[il_6].xyz), 0.0);
    rho_14 = tmpvar_18;
    att_15 = (att_15 * clamp ((
      (rho_14 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_19;
    dirToLight_19 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = clamp (color_10, 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_20;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Detail_ST.xy) + _Detail_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_22));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * texture2D (_Detail, xlv_TEXCOORD1)).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = col_1.w;
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Detail_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = vec3(0.0, 0.0, 0.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_14;
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    highp float tmpvar_18;
    tmpvar_18 = max (dot (dirToLight_16, unity_SpotDirection[il_6].xyz), 0.0);
    rho_14 = tmpvar_18;
    att_15 = (att_15 * clamp ((
      (rho_14 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_19;
    dirToLight_19 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = clamp (color_10, 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_20;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Detail_ST.xy) + _Detail_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_22));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * texture2D (_Detail, xlv_TEXCOORD1)).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = col_1.w;
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _Color;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Detail_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump vec3 lcolor_7;
  mediump vec3 eyeNormal_8;
  highp vec3 eyePos_9;
  mediump vec4 color_10;
  color_10 = vec4(0.0, 0.0, 0.0, 1.1);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5;
  eyePos_9 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_12 * _glesNormal));
  eyeNormal_8 = tmpvar_13;
  lcolor_7 = vec3(0.0, 0.0, 0.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_14;
    mediump float att_15;
    highp vec3 dirToLight_16;
    dirToLight_16 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_17;
    tmpvar_17 = dot (dirToLight_16, dirToLight_16);
    att_15 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_17))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_17 > unity_LightAtten[il_6].w))) {
      att_15 = 0.0;
    };
    dirToLight_16 = (dirToLight_16 * inversesqrt(max (tmpvar_17, 1e-06)));
    highp float tmpvar_18;
    tmpvar_18 = max (dot (dirToLight_16, unity_SpotDirection[il_6].xyz), 0.0);
    rho_14 = tmpvar_18;
    att_15 = (att_15 * clamp ((
      (rho_14 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_19;
    dirToLight_19 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      ((max (dot (eyeNormal_8, dirToLight_19), 0.0) * _Color.xyz) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = _Color.w;
  lowp vec4 tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = clamp (color_10, 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_20;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _Detail_ST.xy) + _Detail_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_22));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * texture2D (_Detail, xlv_TEXCOORD1)).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = col_1.w;
  gl_FragData[0] = col_1;
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
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
""
}
}
}
}
Fallback "VertexLit"
}