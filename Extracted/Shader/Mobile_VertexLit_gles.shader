//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Mobile/VertexLit" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 LOD 80
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 80
  Tags { "LIGHTMODE" = "Vertex" "RenderType" = "Opaque" }
  GpuProgramID 174392
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
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
  lowp vec3 tmpvar_10;
  tmpvar_10 = glstate_lightmodel_ambient.xyz;
  lcolor_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_12;
  dirToLight_12 = tmpvar_11;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_12), 0.0)) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_13;
  tmpvar_13 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_14;
  dirToLight_14 = tmpvar_13;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_14), 0.0)) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_15;
  tmpvar_15 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_16;
  dirToLight_16 = tmpvar_15;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_16), 0.0)) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_17;
  tmpvar_17 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_18;
  dirToLight_18 = tmpvar_17;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_18), 0.0)) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_20;
  dirToLight_20 = tmpvar_19;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_20), 0.0)) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_22;
  dirToLight_22 = tmpvar_21;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_22), 0.0)) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_23;
  tmpvar_23 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_24;
  dirToLight_24 = tmpvar_23;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_24), 0.0)) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_25;
  tmpvar_25 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_26;
  dirToLight_26 = tmpvar_25;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_26), 0.0)) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_7.xyz = lcolor_5;
  color_7.w = 1.0;
  lowp vec4 tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = clamp (color_7, 0.0, 1.0);
  tmpvar_27 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_27;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_29));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
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
  lowp vec3 tmpvar_10;
  tmpvar_10 = glstate_lightmodel_ambient.xyz;
  lcolor_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_12;
  dirToLight_12 = tmpvar_11;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_12), 0.0)) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_13;
  tmpvar_13 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_14;
  dirToLight_14 = tmpvar_13;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_14), 0.0)) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_15;
  tmpvar_15 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_16;
  dirToLight_16 = tmpvar_15;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_16), 0.0)) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_17;
  tmpvar_17 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_18;
  dirToLight_18 = tmpvar_17;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_18), 0.0)) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_20;
  dirToLight_20 = tmpvar_19;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_20), 0.0)) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_22;
  dirToLight_22 = tmpvar_21;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_22), 0.0)) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_23;
  tmpvar_23 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_24;
  dirToLight_24 = tmpvar_23;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_24), 0.0)) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_25;
  tmpvar_25 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_26;
  dirToLight_26 = tmpvar_25;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_26), 0.0)) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_7.xyz = lcolor_5;
  color_7.w = 1.0;
  lowp vec4 tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = clamp (color_7, 0.0, 1.0);
  tmpvar_27 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_27;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_29));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
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
  lowp vec3 tmpvar_10;
  tmpvar_10 = glstate_lightmodel_ambient.xyz;
  lcolor_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_12;
  dirToLight_12 = tmpvar_11;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_12), 0.0)) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_13;
  tmpvar_13 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_14;
  dirToLight_14 = tmpvar_13;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_14), 0.0)) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_15;
  tmpvar_15 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_16;
  dirToLight_16 = tmpvar_15;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_16), 0.0)) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_17;
  tmpvar_17 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_18;
  dirToLight_18 = tmpvar_17;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_18), 0.0)) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_20;
  dirToLight_20 = tmpvar_19;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_20), 0.0)) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_22;
  dirToLight_22 = tmpvar_21;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_22), 0.0)) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_23;
  tmpvar_23 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_24;
  dirToLight_24 = tmpvar_23;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_24), 0.0)) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_25;
  tmpvar_25 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_26;
  dirToLight_26 = tmpvar_25;
  lcolor_5 = (lcolor_5 + min ((
    (vec3(max (dot (eyeNormal_6, dirToLight_26), 0.0)) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_7.xyz = lcolor_5;
  color_7.w = 1.0;
  lowp vec4 tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = clamp (color_7, 0.0, 1.0);
  tmpvar_27 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_27;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_29));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
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
  lowp vec3 tmpvar_14;
  tmpvar_14 = glstate_lightmodel_ambient.xyz;
  lcolor_7 = tmpvar_14;
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
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
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_18;
    dirToLight_18 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      (vec3(max (dot (eyeNormal_8, dirToLight_18), 0.0)) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = 1.0;
  lowp vec4 tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = clamp (color_10, 0.0, 1.0);
  tmpvar_19 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_19;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_21));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
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
  lowp vec3 tmpvar_14;
  tmpvar_14 = glstate_lightmodel_ambient.xyz;
  lcolor_7 = tmpvar_14;
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
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
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_18;
    dirToLight_18 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      (vec3(max (dot (eyeNormal_8, dirToLight_18), 0.0)) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = 1.0;
  lowp vec4 tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = clamp (color_10, 0.0, 1.0);
  tmpvar_19 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_19;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_21));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
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
  lowp vec3 tmpvar_14;
  tmpvar_14 = glstate_lightmodel_ambient.xyz;
  lcolor_7 = tmpvar_14;
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
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
    att_15 = (att_15 * 0.5);
    mediump vec3 dirToLight_18;
    dirToLight_18 = dirToLight_16;
    lcolor_7 = (lcolor_7 + min ((
      (vec3(max (dot (eyeNormal_8, dirToLight_18), 0.0)) * unity_LightColor[il_6].xyz)
     * att_15), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = 1.0;
  lowp vec4 tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = clamp (color_10, 0.0, 1.0);
  tmpvar_19 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_19;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_21));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
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
  lowp vec3 tmpvar_14;
  tmpvar_14 = glstate_lightmodel_ambient.xyz;
  lcolor_7 = tmpvar_14;
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_15;
    mediump float att_16;
    highp vec3 dirToLight_17;
    dirToLight_17 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_18;
    tmpvar_18 = dot (dirToLight_17, dirToLight_17);
    att_16 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_18))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_18 > unity_LightAtten[il_6].w))) {
      att_16 = 0.0;
    };
    dirToLight_17 = (dirToLight_17 * inversesqrt(max (tmpvar_18, 1e-06)));
    highp float tmpvar_19;
    tmpvar_19 = max (dot (dirToLight_17, unity_SpotDirection[il_6].xyz), 0.0);
    rho_15 = tmpvar_19;
    att_16 = (att_16 * clamp ((
      (rho_15 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_16 = (att_16 * 0.5);
    mediump vec3 dirToLight_20;
    dirToLight_20 = dirToLight_17;
    lcolor_7 = (lcolor_7 + min ((
      (vec3(max (dot (eyeNormal_8, dirToLight_20), 0.0)) * unity_LightColor[il_6].xyz)
     * att_16), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = 1.0;
  lowp vec4 tmpvar_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = clamp (color_10, 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_21;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_23));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
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
  lowp vec3 tmpvar_14;
  tmpvar_14 = glstate_lightmodel_ambient.xyz;
  lcolor_7 = tmpvar_14;
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_15;
    mediump float att_16;
    highp vec3 dirToLight_17;
    dirToLight_17 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_18;
    tmpvar_18 = dot (dirToLight_17, dirToLight_17);
    att_16 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_18))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_18 > unity_LightAtten[il_6].w))) {
      att_16 = 0.0;
    };
    dirToLight_17 = (dirToLight_17 * inversesqrt(max (tmpvar_18, 1e-06)));
    highp float tmpvar_19;
    tmpvar_19 = max (dot (dirToLight_17, unity_SpotDirection[il_6].xyz), 0.0);
    rho_15 = tmpvar_19;
    att_16 = (att_16 * clamp ((
      (rho_15 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_16 = (att_16 * 0.5);
    mediump vec3 dirToLight_20;
    dirToLight_20 = dirToLight_17;
    lcolor_7 = (lcolor_7 + min ((
      (vec3(max (dot (eyeNormal_8, dirToLight_20), 0.0)) * unity_LightColor[il_6].xyz)
     * att_16), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = 1.0;
  lowp vec4 tmpvar_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = clamp (color_10, 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_21;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_23));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
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
  lowp vec3 tmpvar_14;
  tmpvar_14 = glstate_lightmodel_ambient.xyz;
  lcolor_7 = tmpvar_14;
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_15;
    mediump float att_16;
    highp vec3 dirToLight_17;
    dirToLight_17 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_18;
    tmpvar_18 = dot (dirToLight_17, dirToLight_17);
    att_16 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_18))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_18 > unity_LightAtten[il_6].w))) {
      att_16 = 0.0;
    };
    dirToLight_17 = (dirToLight_17 * inversesqrt(max (tmpvar_18, 1e-06)));
    highp float tmpvar_19;
    tmpvar_19 = max (dot (dirToLight_17, unity_SpotDirection[il_6].xyz), 0.0);
    rho_15 = tmpvar_19;
    att_16 = (att_16 * clamp ((
      (rho_15 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_16 = (att_16 * 0.5);
    mediump vec3 dirToLight_20;
    dirToLight_20 = dirToLight_17;
    lcolor_7 = (lcolor_7 + min ((
      (vec3(max (dot (eyeNormal_8, dirToLight_20), 0.0)) * unity_LightColor[il_6].xyz)
     * att_16), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = 1.0;
  lowp vec4 tmpvar_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = clamp (color_10, 0.0, 1.0);
  tmpvar_21 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_21;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_23));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
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
  mediump vec3 lcolor_6;
  mediump vec3 eyeNormal_7;
  mediump vec4 color_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_9).xyz;
  highp mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_2.xyz;
  tmpvar_11[1] = tmpvar_3.xyz;
  tmpvar_11[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesNormal));
  eyeNormal_7 = tmpvar_12;
  lowp vec3 tmpvar_13;
  tmpvar_13 = glstate_lightmodel_ambient.xyz;
  lcolor_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_15;
  dirToLight_15 = tmpvar_14;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_15), 0.0)) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_16;
  tmpvar_16 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_17;
  dirToLight_17 = tmpvar_16;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_17), 0.0)) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_19;
  dirToLight_19 = tmpvar_18;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_19), 0.0)) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_20;
  tmpvar_20 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_21;
  dirToLight_21 = tmpvar_20;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_21), 0.0)) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_22;
  tmpvar_22 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_23;
  dirToLight_23 = tmpvar_22;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_23), 0.0)) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_25;
  dirToLight_25 = tmpvar_24;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_25), 0.0)) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_26;
  tmpvar_26 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_27;
  dirToLight_27 = tmpvar_26;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_27), 0.0)) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_28;
  tmpvar_28 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_29;
  dirToLight_29 = tmpvar_28;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_29), 0.0)) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_8.xyz = lcolor_6;
  color_8.w = 1.0;
  lowp vec4 tmpvar_30;
  mediump vec4 tmpvar_31;
  tmpvar_31 = clamp (color_8, 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  lowp float tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = clamp (((
    sqrt(dot (tmpvar_10, tmpvar_10))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_32 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_30;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_32;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_34));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
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
  mediump vec3 lcolor_6;
  mediump vec3 eyeNormal_7;
  mediump vec4 color_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_9).xyz;
  highp mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_2.xyz;
  tmpvar_11[1] = tmpvar_3.xyz;
  tmpvar_11[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesNormal));
  eyeNormal_7 = tmpvar_12;
  lowp vec3 tmpvar_13;
  tmpvar_13 = glstate_lightmodel_ambient.xyz;
  lcolor_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_15;
  dirToLight_15 = tmpvar_14;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_15), 0.0)) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_16;
  tmpvar_16 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_17;
  dirToLight_17 = tmpvar_16;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_17), 0.0)) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_19;
  dirToLight_19 = tmpvar_18;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_19), 0.0)) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_20;
  tmpvar_20 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_21;
  dirToLight_21 = tmpvar_20;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_21), 0.0)) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_22;
  tmpvar_22 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_23;
  dirToLight_23 = tmpvar_22;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_23), 0.0)) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_25;
  dirToLight_25 = tmpvar_24;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_25), 0.0)) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_26;
  tmpvar_26 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_27;
  dirToLight_27 = tmpvar_26;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_27), 0.0)) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_28;
  tmpvar_28 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_29;
  dirToLight_29 = tmpvar_28;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_29), 0.0)) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_8.xyz = lcolor_6;
  color_8.w = 1.0;
  lowp vec4 tmpvar_30;
  mediump vec4 tmpvar_31;
  tmpvar_31 = clamp (color_8, 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  lowp float tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = clamp (((
    sqrt(dot (tmpvar_10, tmpvar_10))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_32 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_30;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_32;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_34));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
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
  mediump vec3 lcolor_6;
  mediump vec3 eyeNormal_7;
  mediump vec4 color_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_5;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_9).xyz;
  highp mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_2.xyz;
  tmpvar_11[1] = tmpvar_3.xyz;
  tmpvar_11[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesNormal));
  eyeNormal_7 = tmpvar_12;
  lowp vec3 tmpvar_13;
  tmpvar_13 = glstate_lightmodel_ambient.xyz;
  lcolor_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = unity_LightPosition[0].xyz;
  mediump vec3 dirToLight_15;
  dirToLight_15 = tmpvar_14;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_15), 0.0)) * unity_LightColor[0].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_16;
  tmpvar_16 = unity_LightPosition[1].xyz;
  mediump vec3 dirToLight_17;
  dirToLight_17 = tmpvar_16;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_17), 0.0)) * unity_LightColor[1].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = unity_LightPosition[2].xyz;
  mediump vec3 dirToLight_19;
  dirToLight_19 = tmpvar_18;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_19), 0.0)) * unity_LightColor[2].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_20;
  tmpvar_20 = unity_LightPosition[3].xyz;
  mediump vec3 dirToLight_21;
  dirToLight_21 = tmpvar_20;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_21), 0.0)) * unity_LightColor[3].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_22;
  tmpvar_22 = unity_LightPosition[4].xyz;
  mediump vec3 dirToLight_23;
  dirToLight_23 = tmpvar_22;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_23), 0.0)) * unity_LightColor[4].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = unity_LightPosition[5].xyz;
  mediump vec3 dirToLight_25;
  dirToLight_25 = tmpvar_24;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_25), 0.0)) * unity_LightColor[5].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_26;
  tmpvar_26 = unity_LightPosition[6].xyz;
  mediump vec3 dirToLight_27;
  dirToLight_27 = tmpvar_26;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_27), 0.0)) * unity_LightColor[6].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  highp vec3 tmpvar_28;
  tmpvar_28 = unity_LightPosition[7].xyz;
  mediump vec3 dirToLight_29;
  dirToLight_29 = tmpvar_28;
  lcolor_6 = (lcolor_6 + min ((
    (vec3(max (dot (eyeNormal_7, dirToLight_29), 0.0)) * unity_LightColor[7].xyz)
   * 0.5), vec3(1.0, 1.0, 1.0)));
  color_8.xyz = lcolor_6;
  color_8.w = 1.0;
  lowp vec4 tmpvar_30;
  mediump vec4 tmpvar_31;
  tmpvar_31 = clamp (color_8, 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  lowp float tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = clamp (((
    sqrt(dot (tmpvar_10, tmpvar_10))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_32 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_30;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_32;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_34));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
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
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lowp vec3 tmpvar_15;
  tmpvar_15 = glstate_lightmodel_ambient.xyz;
  lcolor_7 = tmpvar_15;
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_16;
    highp vec3 dirToLight_17;
    dirToLight_17 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_18;
    tmpvar_18 = dot (dirToLight_17, dirToLight_17);
    att_16 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_18))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_18 > unity_LightAtten[il_6].w))) {
      att_16 = 0.0;
    };
    dirToLight_17 = (dirToLight_17 * inversesqrt(max (tmpvar_18, 1e-06)));
    att_16 = (att_16 * 0.5);
    mediump vec3 dirToLight_19;
    dirToLight_19 = dirToLight_17;
    lcolor_7 = (lcolor_7 + min ((
      (vec3(max (dot (eyeNormal_8, dirToLight_19), 0.0)) * unity_LightColor[il_6].xyz)
     * att_16), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = 1.0;
  lowp vec4 tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = clamp (color_10, 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  lowp float tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_22 = tmpvar_23;
  highp vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_20;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_22;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_24));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
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
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lowp vec3 tmpvar_15;
  tmpvar_15 = glstate_lightmodel_ambient.xyz;
  lcolor_7 = tmpvar_15;
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_16;
    highp vec3 dirToLight_17;
    dirToLight_17 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_18;
    tmpvar_18 = dot (dirToLight_17, dirToLight_17);
    att_16 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_18))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_18 > unity_LightAtten[il_6].w))) {
      att_16 = 0.0;
    };
    dirToLight_17 = (dirToLight_17 * inversesqrt(max (tmpvar_18, 1e-06)));
    att_16 = (att_16 * 0.5);
    mediump vec3 dirToLight_19;
    dirToLight_19 = dirToLight_17;
    lcolor_7 = (lcolor_7 + min ((
      (vec3(max (dot (eyeNormal_8, dirToLight_19), 0.0)) * unity_LightColor[il_6].xyz)
     * att_16), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = 1.0;
  lowp vec4 tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = clamp (color_10, 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  lowp float tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_22 = tmpvar_23;
  highp vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_20;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_22;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_24));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
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
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lowp vec3 tmpvar_15;
  tmpvar_15 = glstate_lightmodel_ambient.xyz;
  lcolor_7 = tmpvar_15;
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_16;
    highp vec3 dirToLight_17;
    dirToLight_17 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_18;
    tmpvar_18 = dot (dirToLight_17, dirToLight_17);
    att_16 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_18))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_18 > unity_LightAtten[il_6].w))) {
      att_16 = 0.0;
    };
    dirToLight_17 = (dirToLight_17 * inversesqrt(max (tmpvar_18, 1e-06)));
    att_16 = (att_16 * 0.5);
    mediump vec3 dirToLight_19;
    dirToLight_19 = dirToLight_17;
    lcolor_7 = (lcolor_7 + min ((
      (vec3(max (dot (eyeNormal_8, dirToLight_19), 0.0)) * unity_LightColor[il_6].xyz)
     * att_16), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = 1.0;
  lowp vec4 tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = clamp (color_10, 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  lowp float tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_22 = tmpvar_23;
  highp vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_20;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_22;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_24));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
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
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lowp vec3 tmpvar_15;
  tmpvar_15 = glstate_lightmodel_ambient.xyz;
  lcolor_7 = tmpvar_15;
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_16;
    mediump float att_17;
    highp vec3 dirToLight_18;
    dirToLight_18 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_19;
    tmpvar_19 = dot (dirToLight_18, dirToLight_18);
    att_17 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_19))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_19 > unity_LightAtten[il_6].w))) {
      att_17 = 0.0;
    };
    dirToLight_18 = (dirToLight_18 * inversesqrt(max (tmpvar_19, 1e-06)));
    highp float tmpvar_20;
    tmpvar_20 = max (dot (dirToLight_18, unity_SpotDirection[il_6].xyz), 0.0);
    rho_16 = tmpvar_20;
    att_17 = (att_17 * clamp ((
      (rho_16 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_17 = (att_17 * 0.5);
    mediump vec3 dirToLight_21;
    dirToLight_21 = dirToLight_18;
    lcolor_7 = (lcolor_7 + min ((
      (vec3(max (dot (eyeNormal_8, dirToLight_21), 0.0)) * unity_LightColor[il_6].xyz)
     * att_17), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = 1.0;
  lowp vec4 tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = clamp (color_10, 0.0, 1.0);
  tmpvar_22 = tmpvar_23;
  lowp float tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_24 = tmpvar_25;
  highp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_22;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_24;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_26));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
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
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lowp vec3 tmpvar_15;
  tmpvar_15 = glstate_lightmodel_ambient.xyz;
  lcolor_7 = tmpvar_15;
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_16;
    mediump float att_17;
    highp vec3 dirToLight_18;
    dirToLight_18 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_19;
    tmpvar_19 = dot (dirToLight_18, dirToLight_18);
    att_17 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_19))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_19 > unity_LightAtten[il_6].w))) {
      att_17 = 0.0;
    };
    dirToLight_18 = (dirToLight_18 * inversesqrt(max (tmpvar_19, 1e-06)));
    highp float tmpvar_20;
    tmpvar_20 = max (dot (dirToLight_18, unity_SpotDirection[il_6].xyz), 0.0);
    rho_16 = tmpvar_20;
    att_17 = (att_17 * clamp ((
      (rho_16 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_17 = (att_17 * 0.5);
    mediump vec3 dirToLight_21;
    dirToLight_21 = dirToLight_18;
    lcolor_7 = (lcolor_7 + min ((
      (vec3(max (dot (eyeNormal_8, dirToLight_21), 0.0)) * unity_LightColor[il_6].xyz)
     * att_17), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = 1.0;
  lowp vec4 tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = clamp (color_10, 0.0, 1.0);
  tmpvar_22 = tmpvar_23;
  lowp float tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_24 = tmpvar_25;
  highp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_22;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_24;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_26));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
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
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
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
  highp vec3 tmpvar_12;
  tmpvar_12 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_11).xyz;
  eyePos_9 = tmpvar_12;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_13 * _glesNormal));
  eyeNormal_8 = tmpvar_14;
  lowp vec3 tmpvar_15;
  tmpvar_15 = glstate_lightmodel_ambient.xyz;
  lcolor_7 = tmpvar_15;
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_16;
    mediump float att_17;
    highp vec3 dirToLight_18;
    dirToLight_18 = (unity_LightPosition[il_6].xyz - (eyePos_9 * unity_LightPosition[il_6].w));
    highp float tmpvar_19;
    tmpvar_19 = dot (dirToLight_18, dirToLight_18);
    att_17 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_19))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_19 > unity_LightAtten[il_6].w))) {
      att_17 = 0.0;
    };
    dirToLight_18 = (dirToLight_18 * inversesqrt(max (tmpvar_19, 1e-06)));
    highp float tmpvar_20;
    tmpvar_20 = max (dot (dirToLight_18, unity_SpotDirection[il_6].xyz), 0.0);
    rho_16 = tmpvar_20;
    att_17 = (att_17 * clamp ((
      (rho_16 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_17 = (att_17 * 0.5);
    mediump vec3 dirToLight_21;
    dirToLight_21 = dirToLight_18;
    lcolor_7 = (lcolor_7 + min ((
      (vec3(max (dot (eyeNormal_8, dirToLight_21), 0.0)) * unity_LightColor[il_6].xyz)
     * att_17), vec3(1.0, 1.0, 1.0)));
  };
  color_10.xyz = lcolor_7;
  color_10.w = 1.0;
  lowp vec4 tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = clamp (color_10, 0.0, 1.0);
  tmpvar_22 = tmpvar_23;
  lowp float tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = clamp (((
    sqrt(dot (tmpvar_12, tmpvar_12))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_24 = tmpvar_25;
  highp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_22;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_24;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_26));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0).xyz;
  col_1.xyz = (col_1 * 2.0).xyz;
  col_1.w = 1.0;
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD1));
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
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
}
}
 Pass {
  LOD 80
  Tags { "LIGHTMODE" = "VertexLM" "RenderType" = "Opaque" }
  GpuProgramID 30151
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_4 = (unity_Lightmap_HDR.x * tex_1.xyz);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1);
  tex_1 = tmpvar_5;
  col_2.xyz = (tmpvar_5.xyz * tmpvar_4);
  col_2.w = 1.0;
  gl_FragData[0] = col_2;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_4 = (unity_Lightmap_HDR.x * tex_1.xyz);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1);
  tex_1 = tmpvar_5;
  col_2.xyz = (tmpvar_5.xyz * tmpvar_4);
  col_2.w = 1.0;
  gl_FragData[0] = col_2;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_4 = (unity_Lightmap_HDR.x * tex_1.xyz);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1);
  tex_1 = tmpvar_5;
  col_2.xyz = (tmpvar_5.xyz * tmpvar_4);
  col_2.w = 1.0;
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = _glesVertex.xyz;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1;
  tmpvar_2 = (unity_MatrixV * (unity_ObjectToWorld * tmpvar_3)).xyz;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((
    sqrt(dot (tmpvar_2, tmpvar_2))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_4;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_4 = (unity_Lightmap_HDR.x * tex_1.xyz);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1);
  tex_1 = tmpvar_5;
  col_2.xyz = (tmpvar_5.xyz * tmpvar_4);
  col_2.w = 1.0;
  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = _glesVertex.xyz;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1;
  tmpvar_2 = (unity_MatrixV * (unity_ObjectToWorld * tmpvar_3)).xyz;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((
    sqrt(dot (tmpvar_2, tmpvar_2))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_4;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_4 = (unity_Lightmap_HDR.x * tex_1.xyz);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1);
  tex_1 = tmpvar_5;
  col_2.xyz = (tmpvar_5.xyz * tmpvar_4);
  col_2.w = 1.0;
  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = _glesVertex.xyz;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1;
  tmpvar_2 = (unity_MatrixV * (unity_ObjectToWorld * tmpvar_3)).xyz;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((
    sqrt(dot (tmpvar_2, tmpvar_2))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_4;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD0);
  tex_1 = tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_4 = (unity_Lightmap_HDR.x * tex_1.xyz);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1);
  tex_1 = tmpvar_5;
  col_2.xyz = (tmpvar_5.xyz * tmpvar_4);
  col_2.w = 1.0;
  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_2;
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
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "SHADOWCASTER"
  LOD 80
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  Cull Off
  GpuProgramID 103199
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 wPos_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
  wPos_2 = tmpvar_3;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp mat3 tmpvar_4;
    tmpvar_4[0] = unity_WorldToObject[0].xyz;
    tmpvar_4[1] = unity_WorldToObject[1].xyz;
    tmpvar_4[2] = unity_WorldToObject[2].xyz;
    highp vec3 tmpvar_5;
    tmpvar_5 = normalize((_glesNormal * tmpvar_4));
    highp float tmpvar_6;
    tmpvar_6 = dot (tmpvar_5, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_3.xyz * _WorldSpaceLightPos0.w)
    )));
    wPos_2.xyz = (tmpvar_3.xyz - (tmpvar_5 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_6 * tmpvar_6)))
    )));
  };
  tmpvar_1 = (unity_MatrixVP * wPos_2);
  highp vec4 clipPos_7;
  clipPos_7.xyw = tmpvar_1.xyw;
  clipPos_7.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_7.z = mix (clipPos_7.z, max (clipPos_7.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_7;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 wPos_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
  wPos_2 = tmpvar_3;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp mat3 tmpvar_4;
    tmpvar_4[0] = unity_WorldToObject[0].xyz;
    tmpvar_4[1] = unity_WorldToObject[1].xyz;
    tmpvar_4[2] = unity_WorldToObject[2].xyz;
    highp vec3 tmpvar_5;
    tmpvar_5 = normalize((_glesNormal * tmpvar_4));
    highp float tmpvar_6;
    tmpvar_6 = dot (tmpvar_5, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_3.xyz * _WorldSpaceLightPos0.w)
    )));
    wPos_2.xyz = (tmpvar_3.xyz - (tmpvar_5 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_6 * tmpvar_6)))
    )));
  };
  tmpvar_1 = (unity_MatrixVP * wPos_2);
  highp vec4 clipPos_7;
  clipPos_7.xyw = tmpvar_1.xyw;
  clipPos_7.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_7.z = mix (clipPos_7.z, max (clipPos_7.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_7;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 wPos_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
  wPos_2 = tmpvar_3;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp mat3 tmpvar_4;
    tmpvar_4[0] = unity_WorldToObject[0].xyz;
    tmpvar_4[1] = unity_WorldToObject[1].xyz;
    tmpvar_4[2] = unity_WorldToObject[2].xyz;
    highp vec3 tmpvar_5;
    tmpvar_5 = normalize((_glesNormal * tmpvar_4));
    highp float tmpvar_6;
    tmpvar_6 = dot (tmpvar_5, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_3.xyz * _WorldSpaceLightPos0.w)
    )));
    wPos_2.xyz = (tmpvar_3.xyz - (tmpvar_5 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_6 * tmpvar_6)))
    )));
  };
  tmpvar_1 = (unity_MatrixVP * wPos_2);
  highp vec4 clipPos_7;
  clipPos_7.xyw = tmpvar_1.xyw;
  clipPos_7.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_7.z = mix (clipPos_7.z, max (clipPos_7.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_7;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_2;
  tmpvar_2 = (tmpvar_1 - (tmpvar_1.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_2;
  tmpvar_2 = (tmpvar_1 - (tmpvar_1.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_2;
  tmpvar_2 = (tmpvar_1 - (tmpvar_1.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
}
}