//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Legacy Shaders/Transparent/Specular" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_SpecColor ("Specular Color", Color) = (0.5,0.5,0.5,0)
_Shininess ("Shininess", Range(0.01, 1)) = 0.078125
_MainTex ("Base (RGB) TransGloss (A)", 2D) = "white" { }
}
SubShader {
 LOD 300
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  GpuProgramID 58452
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec3 worldViewDir_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  worldViewDir_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 viewDir_8;
  viewDir_8 = worldViewDir_4;
  lowp vec4 c_9;
  lowp vec4 c_10;
  highp float nh_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_3, normalize(
    (tmpvar_2 + viewDir_8)
  )));
  nh_11 = tmpvar_14;
  mediump float y_15;
  y_15 = (_Shininess * 128.0);
  highp float tmpvar_16;
  tmpvar_16 = (pow (nh_11, y_15) * tmpvar_7.w);
  c_10.xyz = (((tmpvar_7.xyz * _Color.xyz) * (tmpvar_1 * diff_12)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_16));
  c_10.w = (tmpvar_7.w * _Color.w);
  c_9.w = c_10.w;
  c_9.xyz = c_10.xyz;
  gl_FragData[0] = c_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec3 worldViewDir_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  worldViewDir_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 viewDir_8;
  viewDir_8 = worldViewDir_4;
  lowp vec4 c_9;
  lowp vec4 c_10;
  highp float nh_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_3, normalize(
    (tmpvar_2 + viewDir_8)
  )));
  nh_11 = tmpvar_14;
  mediump float y_15;
  y_15 = (_Shininess * 128.0);
  highp float tmpvar_16;
  tmpvar_16 = (pow (nh_11, y_15) * tmpvar_7.w);
  c_10.xyz = (((tmpvar_7.xyz * _Color.xyz) * (tmpvar_1 * diff_12)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_16));
  c_10.w = (tmpvar_7.w * _Color.w);
  c_9.w = c_10.w;
  c_9.xyz = c_10.xyz;
  gl_FragData[0] = c_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec3 worldViewDir_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  worldViewDir_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 viewDir_8;
  viewDir_8 = worldViewDir_4;
  lowp vec4 c_9;
  lowp vec4 c_10;
  highp float nh_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_3, normalize(
    (tmpvar_2 + viewDir_8)
  )));
  nh_11 = tmpvar_14;
  mediump float y_15;
  y_15 = (_Shininess * 128.0);
  highp float tmpvar_16;
  tmpvar_16 = (pow (nh_11, y_15) * tmpvar_7.w);
  c_10.xyz = (((tmpvar_7.xyz * _Color.xyz) * (tmpvar_1 * diff_12)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_16));
  c_10.w = (tmpvar_7.w * _Color.w);
  c_9.w = c_10.w;
  c_9.xyz = c_10.xyz;
  gl_FragData[0] = c_9;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_glesNormal * tmpvar_2));
  mediump vec3 normal_4;
  normal_4 = tmpvar_3;
  mediump vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = normal_4;
  mediump vec3 res_6;
  mediump vec3 x_7;
  x_7.x = dot (unity_SHAr, tmpvar_5);
  x_7.y = dot (unity_SHAg, tmpvar_5);
  x_7.z = dot (unity_SHAb, tmpvar_5);
  mediump vec3 x1_8;
  mediump vec4 tmpvar_9;
  tmpvar_9 = (normal_4.xyzz * normal_4.yzzx);
  x1_8.x = dot (unity_SHBr, tmpvar_9);
  x1_8.y = dot (unity_SHBg, tmpvar_9);
  x1_8.z = dot (unity_SHBb, tmpvar_9);
  res_6 = (x_7 + (x1_8 + (unity_SHC.xyz * 
    ((normal_4.x * normal_4.x) - (normal_4.y * normal_4.y))
  )));
  mediump vec3 tmpvar_10;
  tmpvar_10 = max (((1.055 * 
    pow (max (res_6, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_6 = tmpvar_10;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), tmpvar_10);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_3 = (tmpvar_8.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 viewDir_9;
  viewDir_9 = worldViewDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  highp float nh_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_9)
  )));
  nh_12 = tmpvar_15;
  mediump float y_16;
  y_16 = (_Shininess * 128.0);
  highp float tmpvar_17;
  tmpvar_17 = (pow (nh_12, y_16) * tmpvar_8.w);
  c_11.xyz = (((tmpvar_3 * tmpvar_1) * diff_13) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_17));
  c_11.w = (tmpvar_8.w * _Color.w);
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_glesNormal * tmpvar_2));
  mediump vec3 normal_4;
  normal_4 = tmpvar_3;
  mediump vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = normal_4;
  mediump vec3 res_6;
  mediump vec3 x_7;
  x_7.x = dot (unity_SHAr, tmpvar_5);
  x_7.y = dot (unity_SHAg, tmpvar_5);
  x_7.z = dot (unity_SHAb, tmpvar_5);
  mediump vec3 x1_8;
  mediump vec4 tmpvar_9;
  tmpvar_9 = (normal_4.xyzz * normal_4.yzzx);
  x1_8.x = dot (unity_SHBr, tmpvar_9);
  x1_8.y = dot (unity_SHBg, tmpvar_9);
  x1_8.z = dot (unity_SHBb, tmpvar_9);
  res_6 = (x_7 + (x1_8 + (unity_SHC.xyz * 
    ((normal_4.x * normal_4.x) - (normal_4.y * normal_4.y))
  )));
  mediump vec3 tmpvar_10;
  tmpvar_10 = max (((1.055 * 
    pow (max (res_6, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_6 = tmpvar_10;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), tmpvar_10);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_3 = (tmpvar_8.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 viewDir_9;
  viewDir_9 = worldViewDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  highp float nh_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_9)
  )));
  nh_12 = tmpvar_15;
  mediump float y_16;
  y_16 = (_Shininess * 128.0);
  highp float tmpvar_17;
  tmpvar_17 = (pow (nh_12, y_16) * tmpvar_8.w);
  c_11.xyz = (((tmpvar_3 * tmpvar_1) * diff_13) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_17));
  c_11.w = (tmpvar_8.w * _Color.w);
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_glesNormal * tmpvar_2));
  mediump vec3 normal_4;
  normal_4 = tmpvar_3;
  mediump vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = normal_4;
  mediump vec3 res_6;
  mediump vec3 x_7;
  x_7.x = dot (unity_SHAr, tmpvar_5);
  x_7.y = dot (unity_SHAg, tmpvar_5);
  x_7.z = dot (unity_SHAb, tmpvar_5);
  mediump vec3 x1_8;
  mediump vec4 tmpvar_9;
  tmpvar_9 = (normal_4.xyzz * normal_4.yzzx);
  x1_8.x = dot (unity_SHBr, tmpvar_9);
  x1_8.y = dot (unity_SHBg, tmpvar_9);
  x1_8.z = dot (unity_SHBb, tmpvar_9);
  res_6 = (x_7 + (x1_8 + (unity_SHC.xyz * 
    ((normal_4.x * normal_4.x) - (normal_4.y * normal_4.y))
  )));
  mediump vec3 tmpvar_10;
  tmpvar_10 = max (((1.055 * 
    pow (max (res_6, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_6 = tmpvar_10;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), tmpvar_10);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_3 = (tmpvar_8.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 viewDir_9;
  viewDir_9 = worldViewDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  highp float nh_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_9)
  )));
  nh_12 = tmpvar_15;
  mediump float y_16;
  y_16 = (_Shininess * 128.0);
  highp float tmpvar_17;
  tmpvar_17 = (pow (nh_12, y_16) * tmpvar_8.w);
  c_11.xyz = (((tmpvar_3 * tmpvar_1) * diff_13) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_17));
  c_11.w = (tmpvar_8.w * _Color.w);
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_3 = (tmpvar_8.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_11;
  color_11 = tmpvar_10;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_11.xyz);
  mediump vec3 viewDir_12;
  viewDir_12 = worldViewDir_5;
  lowp vec4 c_13;
  lowp vec4 c_14;
  highp float nh_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_16 = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_12)
  )));
  nh_15 = tmpvar_18;
  mediump float y_19;
  y_19 = (_Shininess * 128.0);
  highp float tmpvar_20;
  tmpvar_20 = (pow (nh_15, y_19) * tmpvar_8.w);
  c_14.xyz = (((tmpvar_3 * tmpvar_1) * diff_16) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_20));
  c_14.w = (tmpvar_8.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = (c_14.xyz + (tmpvar_3 * tmpvar_9));
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_3 = (tmpvar_8.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_11;
  color_11 = tmpvar_10;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_11.xyz);
  mediump vec3 viewDir_12;
  viewDir_12 = worldViewDir_5;
  lowp vec4 c_13;
  lowp vec4 c_14;
  highp float nh_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_16 = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_12)
  )));
  nh_15 = tmpvar_18;
  mediump float y_19;
  y_19 = (_Shininess * 128.0);
  highp float tmpvar_20;
  tmpvar_20 = (pow (nh_15, y_19) * tmpvar_8.w);
  c_14.xyz = (((tmpvar_3 * tmpvar_1) * diff_16) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_20));
  c_14.w = (tmpvar_8.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = (c_14.xyz + (tmpvar_3 * tmpvar_9));
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_3 = (tmpvar_8.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_11;
  color_11 = tmpvar_10;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_11.xyz);
  mediump vec3 viewDir_12;
  viewDir_12 = worldViewDir_5;
  lowp vec4 c_13;
  lowp vec4 c_14;
  highp float nh_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_16 = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_12)
  )));
  nh_15 = tmpvar_18;
  mediump float y_19;
  y_19 = (_Shininess * 128.0);
  highp float tmpvar_20;
  tmpvar_20 = (pow (nh_15, y_19) * tmpvar_8.w);
  c_14.xyz = (((tmpvar_3 * tmpvar_1) * diff_16) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_20));
  c_14.w = (tmpvar_8.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = (c_14.xyz + (tmpvar_3 * tmpvar_9));
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_3 = (tmpvar_8.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 normalWorld_9;
  normalWorld_9 = tmpvar_4;
  mediump vec3 tmpvar_10;
  mediump vec3 ambient_11;
  mediump vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = normalWorld_9;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, tmpvar_12);
  x_13.y = dot (unity_SHAg, tmpvar_12);
  x_13.z = dot (unity_SHAb, tmpvar_12);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normalWorld_9.xyzz * normalWorld_9.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  ambient_11 = max (vec3(0.0, 0.0, 0.0), (x_13 + (x1_14 + 
    (unity_SHC.xyz * ((normalWorld_9.x * normalWorld_9.x) - (normalWorld_9.y * normalWorld_9.y)))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (ambient_11, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_11 = tmpvar_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_18;
  color_18 = tmpvar_17;
  tmpvar_10 = (tmpvar_16 + (unity_Lightmap_HDR.x * color_18.xyz));
  mediump vec3 viewDir_19;
  viewDir_19 = worldViewDir_5;
  lowp vec4 c_20;
  lowp vec4 c_21;
  highp float nh_22;
  lowp float diff_23;
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_23 = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_19)
  )));
  nh_22 = tmpvar_25;
  mediump float y_26;
  y_26 = (_Shininess * 128.0);
  highp float tmpvar_27;
  tmpvar_27 = (pow (nh_22, y_26) * tmpvar_8.w);
  c_21.xyz = (((tmpvar_3 * tmpvar_1) * diff_23) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_27));
  c_21.w = (tmpvar_8.w * _Color.w);
  c_20.w = c_21.w;
  c_20.xyz = (c_21.xyz + (tmpvar_3 * tmpvar_10));
  gl_FragData[0] = c_20;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_3 = (tmpvar_8.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 normalWorld_9;
  normalWorld_9 = tmpvar_4;
  mediump vec3 tmpvar_10;
  mediump vec3 ambient_11;
  mediump vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = normalWorld_9;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, tmpvar_12);
  x_13.y = dot (unity_SHAg, tmpvar_12);
  x_13.z = dot (unity_SHAb, tmpvar_12);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normalWorld_9.xyzz * normalWorld_9.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  ambient_11 = max (vec3(0.0, 0.0, 0.0), (x_13 + (x1_14 + 
    (unity_SHC.xyz * ((normalWorld_9.x * normalWorld_9.x) - (normalWorld_9.y * normalWorld_9.y)))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (ambient_11, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_11 = tmpvar_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_18;
  color_18 = tmpvar_17;
  tmpvar_10 = (tmpvar_16 + (unity_Lightmap_HDR.x * color_18.xyz));
  mediump vec3 viewDir_19;
  viewDir_19 = worldViewDir_5;
  lowp vec4 c_20;
  lowp vec4 c_21;
  highp float nh_22;
  lowp float diff_23;
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_23 = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_19)
  )));
  nh_22 = tmpvar_25;
  mediump float y_26;
  y_26 = (_Shininess * 128.0);
  highp float tmpvar_27;
  tmpvar_27 = (pow (nh_22, y_26) * tmpvar_8.w);
  c_21.xyz = (((tmpvar_3 * tmpvar_1) * diff_23) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_27));
  c_21.w = (tmpvar_8.w * _Color.w);
  c_20.w = c_21.w;
  c_20.xyz = (c_21.xyz + (tmpvar_3 * tmpvar_10));
  gl_FragData[0] = c_20;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_3 = (tmpvar_8.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 normalWorld_9;
  normalWorld_9 = tmpvar_4;
  mediump vec3 tmpvar_10;
  mediump vec3 ambient_11;
  mediump vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = normalWorld_9;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, tmpvar_12);
  x_13.y = dot (unity_SHAg, tmpvar_12);
  x_13.z = dot (unity_SHAb, tmpvar_12);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normalWorld_9.xyzz * normalWorld_9.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  ambient_11 = max (vec3(0.0, 0.0, 0.0), (x_13 + (x1_14 + 
    (unity_SHC.xyz * ((normalWorld_9.x * normalWorld_9.x) - (normalWorld_9.y * normalWorld_9.y)))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (ambient_11, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_11 = tmpvar_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_18;
  color_18 = tmpvar_17;
  tmpvar_10 = (tmpvar_16 + (unity_Lightmap_HDR.x * color_18.xyz));
  mediump vec3 viewDir_19;
  viewDir_19 = worldViewDir_5;
  lowp vec4 c_20;
  lowp vec4 c_21;
  highp float nh_22;
  lowp float diff_23;
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_23 = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_19)
  )));
  nh_22 = tmpvar_25;
  mediump float y_26;
  y_26 = (_Shininess * 128.0);
  highp float tmpvar_27;
  tmpvar_27 = (pow (nh_22, y_26) * tmpvar_8.w);
  c_21.xyz = (((tmpvar_3 * tmpvar_1) * diff_23) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_27));
  c_21.w = (tmpvar_8.w * _Color.w);
  c_20.w = c_21.w;
  c_20.xyz = (c_21.xyz + (tmpvar_3 * tmpvar_10));
  gl_FragData[0] = c_20;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec3 tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_4;
  color_4 = tmpvar_3;
  tmpvar_2 = (unity_Lightmap_HDR.x * color_4.xyz);
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (tmpvar_1.w * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = ((tmpvar_1.xyz * _Color.xyz) * tmpvar_2);
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec3 tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_4;
  color_4 = tmpvar_3;
  tmpvar_2 = (unity_Lightmap_HDR.x * color_4.xyz);
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (tmpvar_1.w * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = ((tmpvar_1.xyz * _Color.xyz) * tmpvar_2);
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec3 tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_4;
  color_4 = tmpvar_3;
  tmpvar_2 = (unity_Lightmap_HDR.x * color_4.xyz);
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (tmpvar_1.w * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = ((tmpvar_1.xyz * _Color.xyz) * tmpvar_2);
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec3 normalWorld_3;
  normalWorld_3 = tmpvar_1;
  mediump vec3 tmpvar_4;
  mediump vec3 ambient_5;
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = normalWorld_3;
  mediump vec3 x_7;
  x_7.x = dot (unity_SHAr, tmpvar_6);
  x_7.y = dot (unity_SHAg, tmpvar_6);
  x_7.z = dot (unity_SHAb, tmpvar_6);
  mediump vec3 x1_8;
  mediump vec4 tmpvar_9;
  tmpvar_9 = (normalWorld_3.xyzz * normalWorld_3.yzzx);
  x1_8.x = dot (unity_SHBr, tmpvar_9);
  x1_8.y = dot (unity_SHBg, tmpvar_9);
  x1_8.z = dot (unity_SHBb, tmpvar_9);
  ambient_5 = max (vec3(0.0, 0.0, 0.0), (x_7 + (x1_8 + 
    (unity_SHC.xyz * ((normalWorld_3.x * normalWorld_3.x) - (normalWorld_3.y * normalWorld_3.y)))
  )));
  mediump vec3 tmpvar_10;
  tmpvar_10 = max (((1.055 * 
    pow (max (ambient_5, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_5 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_4 = (tmpvar_10 + (unity_Lightmap_HDR.x * color_12.xyz));
  lowp vec4 c_13;
  lowp vec4 c_14;
  c_14.xyz = vec3(0.0, 0.0, 0.0);
  c_14.w = (tmpvar_2.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = ((tmpvar_2.xyz * _Color.xyz) * tmpvar_4);
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec3 normalWorld_3;
  normalWorld_3 = tmpvar_1;
  mediump vec3 tmpvar_4;
  mediump vec3 ambient_5;
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = normalWorld_3;
  mediump vec3 x_7;
  x_7.x = dot (unity_SHAr, tmpvar_6);
  x_7.y = dot (unity_SHAg, tmpvar_6);
  x_7.z = dot (unity_SHAb, tmpvar_6);
  mediump vec3 x1_8;
  mediump vec4 tmpvar_9;
  tmpvar_9 = (normalWorld_3.xyzz * normalWorld_3.yzzx);
  x1_8.x = dot (unity_SHBr, tmpvar_9);
  x1_8.y = dot (unity_SHBg, tmpvar_9);
  x1_8.z = dot (unity_SHBb, tmpvar_9);
  ambient_5 = max (vec3(0.0, 0.0, 0.0), (x_7 + (x1_8 + 
    (unity_SHC.xyz * ((normalWorld_3.x * normalWorld_3.x) - (normalWorld_3.y * normalWorld_3.y)))
  )));
  mediump vec3 tmpvar_10;
  tmpvar_10 = max (((1.055 * 
    pow (max (ambient_5, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_5 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_4 = (tmpvar_10 + (unity_Lightmap_HDR.x * color_12.xyz));
  lowp vec4 c_13;
  lowp vec4 c_14;
  c_14.xyz = vec3(0.0, 0.0, 0.0);
  c_14.w = (tmpvar_2.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = ((tmpvar_2.xyz * _Color.xyz) * tmpvar_4);
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec3 normalWorld_3;
  normalWorld_3 = tmpvar_1;
  mediump vec3 tmpvar_4;
  mediump vec3 ambient_5;
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = normalWorld_3;
  mediump vec3 x_7;
  x_7.x = dot (unity_SHAr, tmpvar_6);
  x_7.y = dot (unity_SHAg, tmpvar_6);
  x_7.z = dot (unity_SHAb, tmpvar_6);
  mediump vec3 x1_8;
  mediump vec4 tmpvar_9;
  tmpvar_9 = (normalWorld_3.xyzz * normalWorld_3.yzzx);
  x1_8.x = dot (unity_SHBr, tmpvar_9);
  x1_8.y = dot (unity_SHBg, tmpvar_9);
  x1_8.z = dot (unity_SHBb, tmpvar_9);
  ambient_5 = max (vec3(0.0, 0.0, 0.0), (x_7 + (x1_8 + 
    (unity_SHC.xyz * ((normalWorld_3.x * normalWorld_3.x) - (normalWorld_3.y * normalWorld_3.y)))
  )));
  mediump vec3 tmpvar_10;
  tmpvar_10 = max (((1.055 * 
    pow (max (ambient_5, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_5 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_4 = (tmpvar_10 + (unity_Lightmap_HDR.x * color_12.xyz));
  lowp vec4 c_13;
  lowp vec4 c_14;
  c_14.xyz = vec3(0.0, 0.0, 0.0);
  c_14.w = (tmpvar_2.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = ((tmpvar_2.xyz * _Color.xyz) * tmpvar_4);
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  highp vec3 lightColor0_6;
  lightColor0_6 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_7;
  lightColor1_7 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_8;
  lightColor2_8 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_9;
  lightColor3_9 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_10;
  lightAttenSq_10 = unity_4LightAtten0;
  highp vec3 col_11;
  highp vec4 ndotl_12;
  highp vec4 lengthSq_13;
  highp vec4 tmpvar_14;
  tmpvar_14 = (unity_4LightPosX0 - tmpvar_3.x);
  highp vec4 tmpvar_15;
  tmpvar_15 = (unity_4LightPosY0 - tmpvar_3.y);
  highp vec4 tmpvar_16;
  tmpvar_16 = (unity_4LightPosZ0 - tmpvar_3.z);
  lengthSq_13 = (tmpvar_14 * tmpvar_14);
  lengthSq_13 = (lengthSq_13 + (tmpvar_15 * tmpvar_15));
  lengthSq_13 = (lengthSq_13 + (tmpvar_16 * tmpvar_16));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (lengthSq_13, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_13 = tmpvar_17;
  ndotl_12 = (tmpvar_14 * tmpvar_5.x);
  ndotl_12 = (ndotl_12 + (tmpvar_15 * tmpvar_5.y));
  ndotl_12 = (ndotl_12 + (tmpvar_16 * tmpvar_5.z));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_12 * inversesqrt(tmpvar_17)));
  ndotl_12 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * (1.0/((1.0 + 
    (tmpvar_17 * lightAttenSq_10)
  ))));
  col_11 = (lightColor0_6 * tmpvar_19.x);
  col_11 = (col_11 + (lightColor1_7 * tmpvar_19.y));
  col_11 = (col_11 + (lightColor2_8 * tmpvar_19.z));
  col_11 = (col_11 + (lightColor3_9 * tmpvar_19.w));
  tmpvar_1 = col_11;
  mediump vec3 normal_20;
  normal_20 = tmpvar_5;
  mediump vec3 ambient_21;
  mediump vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = normal_20;
  mediump vec3 res_23;
  mediump vec3 x_24;
  x_24.x = dot (unity_SHAr, tmpvar_22);
  x_24.y = dot (unity_SHAg, tmpvar_22);
  x_24.z = dot (unity_SHAb, tmpvar_22);
  mediump vec3 x1_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal_20.xyzz * normal_20.yzzx);
  x1_25.x = dot (unity_SHBr, tmpvar_26);
  x1_25.y = dot (unity_SHBg, tmpvar_26);
  x1_25.z = dot (unity_SHBb, tmpvar_26);
  res_23 = (x_24 + (x1_25 + (unity_SHC.xyz * 
    ((normal_20.x * normal_20.x) - (normal_20.y * normal_20.y))
  )));
  mediump vec3 tmpvar_27;
  tmpvar_27 = max (((1.055 * 
    pow (max (res_23, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_23 = tmpvar_27;
  ambient_21 = (tmpvar_1 + max (vec3(0.0, 0.0, 0.0), tmpvar_27));
  tmpvar_1 = ambient_21;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_5;
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = ambient_21;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_3 = (tmpvar_8.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 viewDir_9;
  viewDir_9 = worldViewDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  highp float nh_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_9)
  )));
  nh_12 = tmpvar_15;
  mediump float y_16;
  y_16 = (_Shininess * 128.0);
  highp float tmpvar_17;
  tmpvar_17 = (pow (nh_12, y_16) * tmpvar_8.w);
  c_11.xyz = (((tmpvar_3 * tmpvar_1) * diff_13) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_17));
  c_11.w = (tmpvar_8.w * _Color.w);
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  highp vec3 lightColor0_6;
  lightColor0_6 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_7;
  lightColor1_7 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_8;
  lightColor2_8 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_9;
  lightColor3_9 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_10;
  lightAttenSq_10 = unity_4LightAtten0;
  highp vec3 col_11;
  highp vec4 ndotl_12;
  highp vec4 lengthSq_13;
  highp vec4 tmpvar_14;
  tmpvar_14 = (unity_4LightPosX0 - tmpvar_3.x);
  highp vec4 tmpvar_15;
  tmpvar_15 = (unity_4LightPosY0 - tmpvar_3.y);
  highp vec4 tmpvar_16;
  tmpvar_16 = (unity_4LightPosZ0 - tmpvar_3.z);
  lengthSq_13 = (tmpvar_14 * tmpvar_14);
  lengthSq_13 = (lengthSq_13 + (tmpvar_15 * tmpvar_15));
  lengthSq_13 = (lengthSq_13 + (tmpvar_16 * tmpvar_16));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (lengthSq_13, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_13 = tmpvar_17;
  ndotl_12 = (tmpvar_14 * tmpvar_5.x);
  ndotl_12 = (ndotl_12 + (tmpvar_15 * tmpvar_5.y));
  ndotl_12 = (ndotl_12 + (tmpvar_16 * tmpvar_5.z));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_12 * inversesqrt(tmpvar_17)));
  ndotl_12 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * (1.0/((1.0 + 
    (tmpvar_17 * lightAttenSq_10)
  ))));
  col_11 = (lightColor0_6 * tmpvar_19.x);
  col_11 = (col_11 + (lightColor1_7 * tmpvar_19.y));
  col_11 = (col_11 + (lightColor2_8 * tmpvar_19.z));
  col_11 = (col_11 + (lightColor3_9 * tmpvar_19.w));
  tmpvar_1 = col_11;
  mediump vec3 normal_20;
  normal_20 = tmpvar_5;
  mediump vec3 ambient_21;
  mediump vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = normal_20;
  mediump vec3 res_23;
  mediump vec3 x_24;
  x_24.x = dot (unity_SHAr, tmpvar_22);
  x_24.y = dot (unity_SHAg, tmpvar_22);
  x_24.z = dot (unity_SHAb, tmpvar_22);
  mediump vec3 x1_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal_20.xyzz * normal_20.yzzx);
  x1_25.x = dot (unity_SHBr, tmpvar_26);
  x1_25.y = dot (unity_SHBg, tmpvar_26);
  x1_25.z = dot (unity_SHBb, tmpvar_26);
  res_23 = (x_24 + (x1_25 + (unity_SHC.xyz * 
    ((normal_20.x * normal_20.x) - (normal_20.y * normal_20.y))
  )));
  mediump vec3 tmpvar_27;
  tmpvar_27 = max (((1.055 * 
    pow (max (res_23, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_23 = tmpvar_27;
  ambient_21 = (tmpvar_1 + max (vec3(0.0, 0.0, 0.0), tmpvar_27));
  tmpvar_1 = ambient_21;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_5;
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = ambient_21;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_3 = (tmpvar_8.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 viewDir_9;
  viewDir_9 = worldViewDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  highp float nh_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_9)
  )));
  nh_12 = tmpvar_15;
  mediump float y_16;
  y_16 = (_Shininess * 128.0);
  highp float tmpvar_17;
  tmpvar_17 = (pow (nh_12, y_16) * tmpvar_8.w);
  c_11.xyz = (((tmpvar_3 * tmpvar_1) * diff_13) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_17));
  c_11.w = (tmpvar_8.w * _Color.w);
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_glesNormal * tmpvar_4));
  highp vec3 lightColor0_6;
  lightColor0_6 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_7;
  lightColor1_7 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_8;
  lightColor2_8 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_9;
  lightColor3_9 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_10;
  lightAttenSq_10 = unity_4LightAtten0;
  highp vec3 col_11;
  highp vec4 ndotl_12;
  highp vec4 lengthSq_13;
  highp vec4 tmpvar_14;
  tmpvar_14 = (unity_4LightPosX0 - tmpvar_3.x);
  highp vec4 tmpvar_15;
  tmpvar_15 = (unity_4LightPosY0 - tmpvar_3.y);
  highp vec4 tmpvar_16;
  tmpvar_16 = (unity_4LightPosZ0 - tmpvar_3.z);
  lengthSq_13 = (tmpvar_14 * tmpvar_14);
  lengthSq_13 = (lengthSq_13 + (tmpvar_15 * tmpvar_15));
  lengthSq_13 = (lengthSq_13 + (tmpvar_16 * tmpvar_16));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (lengthSq_13, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_13 = tmpvar_17;
  ndotl_12 = (tmpvar_14 * tmpvar_5.x);
  ndotl_12 = (ndotl_12 + (tmpvar_15 * tmpvar_5.y));
  ndotl_12 = (ndotl_12 + (tmpvar_16 * tmpvar_5.z));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_12 * inversesqrt(tmpvar_17)));
  ndotl_12 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * (1.0/((1.0 + 
    (tmpvar_17 * lightAttenSq_10)
  ))));
  col_11 = (lightColor0_6 * tmpvar_19.x);
  col_11 = (col_11 + (lightColor1_7 * tmpvar_19.y));
  col_11 = (col_11 + (lightColor2_8 * tmpvar_19.z));
  col_11 = (col_11 + (lightColor3_9 * tmpvar_19.w));
  tmpvar_1 = col_11;
  mediump vec3 normal_20;
  normal_20 = tmpvar_5;
  mediump vec3 ambient_21;
  mediump vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = normal_20;
  mediump vec3 res_23;
  mediump vec3 x_24;
  x_24.x = dot (unity_SHAr, tmpvar_22);
  x_24.y = dot (unity_SHAg, tmpvar_22);
  x_24.z = dot (unity_SHAb, tmpvar_22);
  mediump vec3 x1_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal_20.xyzz * normal_20.yzzx);
  x1_25.x = dot (unity_SHBr, tmpvar_26);
  x1_25.y = dot (unity_SHBg, tmpvar_26);
  x1_25.z = dot (unity_SHBb, tmpvar_26);
  res_23 = (x_24 + (x1_25 + (unity_SHC.xyz * 
    ((normal_20.x * normal_20.x) - (normal_20.y * normal_20.y))
  )));
  mediump vec3 tmpvar_27;
  tmpvar_27 = max (((1.055 * 
    pow (max (res_23, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_23 = tmpvar_27;
  ambient_21 = (tmpvar_1 + max (vec3(0.0, 0.0, 0.0), tmpvar_27));
  tmpvar_1 = ambient_21;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_5;
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = ambient_21;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_3 = (tmpvar_8.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 viewDir_9;
  viewDir_9 = worldViewDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  highp float nh_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_9)
  )));
  nh_12 = tmpvar_15;
  mediump float y_16;
  y_16 = (_Shininess * 128.0);
  highp float tmpvar_17;
  tmpvar_17 = (pow (nh_12, y_16) * tmpvar_8.w);
  c_11.xyz = (((tmpvar_3 * tmpvar_1) * diff_13) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_17));
  c_11.w = (tmpvar_8.w * _Color.w);
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 viewDir_9;
  viewDir_9 = worldViewDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  highp float nh_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_9)
  )));
  nh_12 = tmpvar_15;
  mediump float y_16;
  y_16 = (_Shininess * 128.0);
  highp float tmpvar_17;
  tmpvar_17 = (pow (nh_12, y_16) * tmpvar_8.w);
  c_11.xyz = (((tmpvar_8.xyz * _Color.xyz) * (tmpvar_1 * diff_13)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_17));
  c_11.w = (tmpvar_8.w * _Color.w);
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  c_3.w = c_10.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_18));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 viewDir_9;
  viewDir_9 = worldViewDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  highp float nh_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_9)
  )));
  nh_12 = tmpvar_15;
  mediump float y_16;
  y_16 = (_Shininess * 128.0);
  highp float tmpvar_17;
  tmpvar_17 = (pow (nh_12, y_16) * tmpvar_8.w);
  c_11.xyz = (((tmpvar_8.xyz * _Color.xyz) * (tmpvar_1 * diff_13)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_17));
  c_11.w = (tmpvar_8.w * _Color.w);
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  c_3.w = c_10.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_18));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 viewDir_9;
  viewDir_9 = worldViewDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  highp float nh_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_9)
  )));
  nh_12 = tmpvar_15;
  mediump float y_16;
  y_16 = (_Shininess * 128.0);
  highp float tmpvar_17;
  tmpvar_17 = (pow (nh_12, y_16) * tmpvar_8.w);
  c_11.xyz = (((tmpvar_8.xyz * _Color.xyz) * (tmpvar_1 * diff_13)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_17));
  c_11.w = (tmpvar_8.w * _Color.w);
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  c_3.w = c_10.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_18));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize((_glesNormal * tmpvar_3));
  mediump vec3 normal_5;
  normal_5 = tmpvar_4;
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = normal_5;
  mediump vec3 res_7;
  mediump vec3 x_8;
  x_8.x = dot (unity_SHAr, tmpvar_6);
  x_8.y = dot (unity_SHAg, tmpvar_6);
  x_8.z = dot (unity_SHAb, tmpvar_6);
  mediump vec3 x1_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = (normal_5.xyzz * normal_5.yzzx);
  x1_9.x = dot (unity_SHBr, tmpvar_10);
  x1_9.y = dot (unity_SHBg, tmpvar_10);
  x1_9.z = dot (unity_SHBb, tmpvar_10);
  res_7 = (x_8 + (x1_9 + (unity_SHC.xyz * 
    ((normal_5.x * normal_5.x) - (normal_5.y * normal_5.y))
  )));
  mediump vec3 tmpvar_11;
  tmpvar_11 = max (((1.055 * 
    pow (max (res_7, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_7 = tmpvar_11;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_4 = (tmpvar_9.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  highp float nh_13;
  lowp float diff_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_14 = tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_10)
  )));
  nh_13 = tmpvar_16;
  mediump float y_17;
  y_17 = (_Shininess * 128.0);
  highp float tmpvar_18;
  tmpvar_18 = (pow (nh_13, y_17) * tmpvar_9.w);
  c_12.xyz = (((tmpvar_4 * tmpvar_1) * diff_14) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_18));
  c_12.w = (tmpvar_9.w * _Color.w);
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_4 * xlv_TEXCOORD3));
  c_3.w = c_11.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_19));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize((_glesNormal * tmpvar_3));
  mediump vec3 normal_5;
  normal_5 = tmpvar_4;
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = normal_5;
  mediump vec3 res_7;
  mediump vec3 x_8;
  x_8.x = dot (unity_SHAr, tmpvar_6);
  x_8.y = dot (unity_SHAg, tmpvar_6);
  x_8.z = dot (unity_SHAb, tmpvar_6);
  mediump vec3 x1_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = (normal_5.xyzz * normal_5.yzzx);
  x1_9.x = dot (unity_SHBr, tmpvar_10);
  x1_9.y = dot (unity_SHBg, tmpvar_10);
  x1_9.z = dot (unity_SHBb, tmpvar_10);
  res_7 = (x_8 + (x1_9 + (unity_SHC.xyz * 
    ((normal_5.x * normal_5.x) - (normal_5.y * normal_5.y))
  )));
  mediump vec3 tmpvar_11;
  tmpvar_11 = max (((1.055 * 
    pow (max (res_7, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_7 = tmpvar_11;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_4 = (tmpvar_9.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  highp float nh_13;
  lowp float diff_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_14 = tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_10)
  )));
  nh_13 = tmpvar_16;
  mediump float y_17;
  y_17 = (_Shininess * 128.0);
  highp float tmpvar_18;
  tmpvar_18 = (pow (nh_13, y_17) * tmpvar_9.w);
  c_12.xyz = (((tmpvar_4 * tmpvar_1) * diff_14) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_18));
  c_12.w = (tmpvar_9.w * _Color.w);
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_4 * xlv_TEXCOORD3));
  c_3.w = c_11.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_19));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize((_glesNormal * tmpvar_3));
  mediump vec3 normal_5;
  normal_5 = tmpvar_4;
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = normal_5;
  mediump vec3 res_7;
  mediump vec3 x_8;
  x_8.x = dot (unity_SHAr, tmpvar_6);
  x_8.y = dot (unity_SHAg, tmpvar_6);
  x_8.z = dot (unity_SHAb, tmpvar_6);
  mediump vec3 x1_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = (normal_5.xyzz * normal_5.yzzx);
  x1_9.x = dot (unity_SHBr, tmpvar_10);
  x1_9.y = dot (unity_SHBg, tmpvar_10);
  x1_9.z = dot (unity_SHBb, tmpvar_10);
  res_7 = (x_8 + (x1_9 + (unity_SHC.xyz * 
    ((normal_5.x * normal_5.x) - (normal_5.y * normal_5.y))
  )));
  mediump vec3 tmpvar_11;
  tmpvar_11 = max (((1.055 * 
    pow (max (res_7, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_7 = tmpvar_11;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_4 = (tmpvar_9.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  highp float nh_13;
  lowp float diff_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_14 = tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_10)
  )));
  nh_13 = tmpvar_16;
  mediump float y_17;
  y_17 = (_Shininess * 128.0);
  highp float tmpvar_18;
  tmpvar_18 = (pow (nh_13, y_17) * tmpvar_9.w);
  c_12.xyz = (((tmpvar_4 * tmpvar_1) * diff_14) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_18));
  c_12.w = (tmpvar_9.w * _Color.w);
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_4 * xlv_TEXCOORD3));
  c_3.w = c_11.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_19));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_4 = (tmpvar_9.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  mediump vec3 tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_10 = (unity_Lightmap_HDR.x * color_12.xyz);
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_6;
  lowp vec4 c_14;
  lowp vec4 c_15;
  highp float nh_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_17 = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_13)
  )));
  nh_16 = tmpvar_19;
  mediump float y_20;
  y_20 = (_Shininess * 128.0);
  highp float tmpvar_21;
  tmpvar_21 = (pow (nh_16, y_20) * tmpvar_9.w);
  c_15.xyz = (((tmpvar_4 * tmpvar_1) * diff_17) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_21));
  c_15.w = (tmpvar_9.w * _Color.w);
  c_14.w = c_15.w;
  c_14.xyz = (c_15.xyz + (tmpvar_4 * tmpvar_10));
  c_3.w = c_14.w;
  highp float tmpvar_22;
  tmpvar_22 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_14.xyz, vec3(tmpvar_22));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_4 = (tmpvar_9.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  mediump vec3 tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_10 = (unity_Lightmap_HDR.x * color_12.xyz);
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_6;
  lowp vec4 c_14;
  lowp vec4 c_15;
  highp float nh_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_17 = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_13)
  )));
  nh_16 = tmpvar_19;
  mediump float y_20;
  y_20 = (_Shininess * 128.0);
  highp float tmpvar_21;
  tmpvar_21 = (pow (nh_16, y_20) * tmpvar_9.w);
  c_15.xyz = (((tmpvar_4 * tmpvar_1) * diff_17) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_21));
  c_15.w = (tmpvar_9.w * _Color.w);
  c_14.w = c_15.w;
  c_14.xyz = (c_15.xyz + (tmpvar_4 * tmpvar_10));
  c_3.w = c_14.w;
  highp float tmpvar_22;
  tmpvar_22 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_14.xyz, vec3(tmpvar_22));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_4 = (tmpvar_9.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  mediump vec3 tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_10 = (unity_Lightmap_HDR.x * color_12.xyz);
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_6;
  lowp vec4 c_14;
  lowp vec4 c_15;
  highp float nh_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_17 = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_13)
  )));
  nh_16 = tmpvar_19;
  mediump float y_20;
  y_20 = (_Shininess * 128.0);
  highp float tmpvar_21;
  tmpvar_21 = (pow (nh_16, y_20) * tmpvar_9.w);
  c_15.xyz = (((tmpvar_4 * tmpvar_1) * diff_17) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_21));
  c_15.w = (tmpvar_9.w * _Color.w);
  c_14.w = c_15.w;
  c_14.xyz = (c_15.xyz + (tmpvar_4 * tmpvar_10));
  c_3.w = c_14.w;
  highp float tmpvar_22;
  tmpvar_22 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_14.xyz, vec3(tmpvar_22));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_4 = (tmpvar_9.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  mediump vec3 normalWorld_10;
  normalWorld_10 = tmpvar_5;
  mediump vec3 tmpvar_11;
  mediump vec3 ambient_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = normalWorld_10;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, tmpvar_13);
  x_14.y = dot (unity_SHAg, tmpvar_13);
  x_14.z = dot (unity_SHAb, tmpvar_13);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normalWorld_10.xyzz * normalWorld_10.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  ambient_12 = max (vec3(0.0, 0.0, 0.0), (x_14 + (x1_15 + 
    (unity_SHC.xyz * ((normalWorld_10.x * normalWorld_10.x) - (normalWorld_10.y * normalWorld_10.y)))
  )));
  mediump vec3 tmpvar_17;
  tmpvar_17 = max (((1.055 * 
    pow (max (ambient_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_12 = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_19;
  color_19 = tmpvar_18;
  tmpvar_11 = (tmpvar_17 + (unity_Lightmap_HDR.x * color_19.xyz));
  mediump vec3 viewDir_20;
  viewDir_20 = worldViewDir_6;
  lowp vec4 c_21;
  lowp vec4 c_22;
  highp float nh_23;
  lowp float diff_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_24 = tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_20)
  )));
  nh_23 = tmpvar_26;
  mediump float y_27;
  y_27 = (_Shininess * 128.0);
  highp float tmpvar_28;
  tmpvar_28 = (pow (nh_23, y_27) * tmpvar_9.w);
  c_22.xyz = (((tmpvar_4 * tmpvar_1) * diff_24) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_28));
  c_22.w = (tmpvar_9.w * _Color.w);
  c_21.w = c_22.w;
  c_21.xyz = (c_22.xyz + (tmpvar_4 * tmpvar_11));
  c_3.w = c_21.w;
  highp float tmpvar_29;
  tmpvar_29 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_21.xyz, vec3(tmpvar_29));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_4 = (tmpvar_9.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  mediump vec3 normalWorld_10;
  normalWorld_10 = tmpvar_5;
  mediump vec3 tmpvar_11;
  mediump vec3 ambient_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = normalWorld_10;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, tmpvar_13);
  x_14.y = dot (unity_SHAg, tmpvar_13);
  x_14.z = dot (unity_SHAb, tmpvar_13);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normalWorld_10.xyzz * normalWorld_10.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  ambient_12 = max (vec3(0.0, 0.0, 0.0), (x_14 + (x1_15 + 
    (unity_SHC.xyz * ((normalWorld_10.x * normalWorld_10.x) - (normalWorld_10.y * normalWorld_10.y)))
  )));
  mediump vec3 tmpvar_17;
  tmpvar_17 = max (((1.055 * 
    pow (max (ambient_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_12 = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_19;
  color_19 = tmpvar_18;
  tmpvar_11 = (tmpvar_17 + (unity_Lightmap_HDR.x * color_19.xyz));
  mediump vec3 viewDir_20;
  viewDir_20 = worldViewDir_6;
  lowp vec4 c_21;
  lowp vec4 c_22;
  highp float nh_23;
  lowp float diff_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_24 = tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_20)
  )));
  nh_23 = tmpvar_26;
  mediump float y_27;
  y_27 = (_Shininess * 128.0);
  highp float tmpvar_28;
  tmpvar_28 = (pow (nh_23, y_27) * tmpvar_9.w);
  c_22.xyz = (((tmpvar_4 * tmpvar_1) * diff_24) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_28));
  c_22.w = (tmpvar_9.w * _Color.w);
  c_21.w = c_22.w;
  c_21.xyz = (c_22.xyz + (tmpvar_4 * tmpvar_11));
  c_3.w = c_21.w;
  highp float tmpvar_29;
  tmpvar_29 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_21.xyz, vec3(tmpvar_29));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_4 = (tmpvar_9.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  mediump vec3 normalWorld_10;
  normalWorld_10 = tmpvar_5;
  mediump vec3 tmpvar_11;
  mediump vec3 ambient_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = normalWorld_10;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, tmpvar_13);
  x_14.y = dot (unity_SHAg, tmpvar_13);
  x_14.z = dot (unity_SHAb, tmpvar_13);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normalWorld_10.xyzz * normalWorld_10.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  ambient_12 = max (vec3(0.0, 0.0, 0.0), (x_14 + (x1_15 + 
    (unity_SHC.xyz * ((normalWorld_10.x * normalWorld_10.x) - (normalWorld_10.y * normalWorld_10.y)))
  )));
  mediump vec3 tmpvar_17;
  tmpvar_17 = max (((1.055 * 
    pow (max (ambient_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_12 = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_19;
  color_19 = tmpvar_18;
  tmpvar_11 = (tmpvar_17 + (unity_Lightmap_HDR.x * color_19.xyz));
  mediump vec3 viewDir_20;
  viewDir_20 = worldViewDir_6;
  lowp vec4 c_21;
  lowp vec4 c_22;
  highp float nh_23;
  lowp float diff_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_24 = tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_20)
  )));
  nh_23 = tmpvar_26;
  mediump float y_27;
  y_27 = (_Shininess * 128.0);
  highp float tmpvar_28;
  tmpvar_28 = (pow (nh_23, y_27) * tmpvar_9.w);
  c_22.xyz = (((tmpvar_4 * tmpvar_1) * diff_24) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_28));
  c_22.w = (tmpvar_9.w * _Color.w);
  c_21.w = c_22.w;
  c_21.xyz = (c_22.xyz + (tmpvar_4 * tmpvar_11));
  c_3.w = c_21.w;
  highp float tmpvar_29;
  tmpvar_29 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_21.xyz, vec3(tmpvar_29));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec3 tmpvar_3;
  mediump vec4 tmpvar_4;
  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_5;
  color_5 = tmpvar_4;
  tmpvar_3 = (unity_Lightmap_HDR.x * color_5.xyz);
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (tmpvar_2.w * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = ((tmpvar_2.xyz * _Color.xyz) * tmpvar_3);
  c_1.w = c_6.w;
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_6.xyz, vec3(tmpvar_8));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec3 tmpvar_3;
  mediump vec4 tmpvar_4;
  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_5;
  color_5 = tmpvar_4;
  tmpvar_3 = (unity_Lightmap_HDR.x * color_5.xyz);
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (tmpvar_2.w * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = ((tmpvar_2.xyz * _Color.xyz) * tmpvar_3);
  c_1.w = c_6.w;
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_6.xyz, vec3(tmpvar_8));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec3 tmpvar_3;
  mediump vec4 tmpvar_4;
  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_5;
  color_5 = tmpvar_4;
  tmpvar_3 = (unity_Lightmap_HDR.x * color_5.xyz);
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (tmpvar_2.w * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = ((tmpvar_2.xyz * _Color.xyz) * tmpvar_3);
  c_1.w = c_6.w;
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_6.xyz, vec3(tmpvar_8));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec3 normalWorld_4;
  normalWorld_4 = tmpvar_2;
  mediump vec3 tmpvar_5;
  mediump vec3 ambient_6;
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = normalWorld_4;
  mediump vec3 x_8;
  x_8.x = dot (unity_SHAr, tmpvar_7);
  x_8.y = dot (unity_SHAg, tmpvar_7);
  x_8.z = dot (unity_SHAb, tmpvar_7);
  mediump vec3 x1_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_9.x = dot (unity_SHBr, tmpvar_10);
  x1_9.y = dot (unity_SHBg, tmpvar_10);
  x1_9.z = dot (unity_SHBb, tmpvar_10);
  ambient_6 = max (vec3(0.0, 0.0, 0.0), (x_8 + (x1_9 + 
    (unity_SHC.xyz * ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y)))
  )));
  mediump vec3 tmpvar_11;
  tmpvar_11 = max (((1.055 * 
    pow (max (ambient_6, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_6 = tmpvar_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  tmpvar_5 = (tmpvar_11 + (unity_Lightmap_HDR.x * color_13.xyz));
  lowp vec4 c_14;
  lowp vec4 c_15;
  c_15.xyz = vec3(0.0, 0.0, 0.0);
  c_15.w = (tmpvar_3.w * _Color.w);
  c_14.w = c_15.w;
  c_14.xyz = ((tmpvar_3.xyz * _Color.xyz) * tmpvar_5);
  c_1.w = c_14.w;
  highp float tmpvar_16;
  tmpvar_16 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_14.xyz, vec3(tmpvar_16));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec3 normalWorld_4;
  normalWorld_4 = tmpvar_2;
  mediump vec3 tmpvar_5;
  mediump vec3 ambient_6;
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = normalWorld_4;
  mediump vec3 x_8;
  x_8.x = dot (unity_SHAr, tmpvar_7);
  x_8.y = dot (unity_SHAg, tmpvar_7);
  x_8.z = dot (unity_SHAb, tmpvar_7);
  mediump vec3 x1_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_9.x = dot (unity_SHBr, tmpvar_10);
  x1_9.y = dot (unity_SHBg, tmpvar_10);
  x1_9.z = dot (unity_SHBb, tmpvar_10);
  ambient_6 = max (vec3(0.0, 0.0, 0.0), (x_8 + (x1_9 + 
    (unity_SHC.xyz * ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y)))
  )));
  mediump vec3 tmpvar_11;
  tmpvar_11 = max (((1.055 * 
    pow (max (ambient_6, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_6 = tmpvar_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  tmpvar_5 = (tmpvar_11 + (unity_Lightmap_HDR.x * color_13.xyz));
  lowp vec4 c_14;
  lowp vec4 c_15;
  c_15.xyz = vec3(0.0, 0.0, 0.0);
  c_15.w = (tmpvar_3.w * _Color.w);
  c_14.w = c_15.w;
  c_14.xyz = ((tmpvar_3.xyz * _Color.xyz) * tmpvar_5);
  c_1.w = c_14.w;
  highp float tmpvar_16;
  tmpvar_16 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_14.xyz, vec3(tmpvar_16));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec3 normalWorld_4;
  normalWorld_4 = tmpvar_2;
  mediump vec3 tmpvar_5;
  mediump vec3 ambient_6;
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = normalWorld_4;
  mediump vec3 x_8;
  x_8.x = dot (unity_SHAr, tmpvar_7);
  x_8.y = dot (unity_SHAg, tmpvar_7);
  x_8.z = dot (unity_SHAb, tmpvar_7);
  mediump vec3 x1_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_9.x = dot (unity_SHBr, tmpvar_10);
  x1_9.y = dot (unity_SHBg, tmpvar_10);
  x1_9.z = dot (unity_SHBb, tmpvar_10);
  ambient_6 = max (vec3(0.0, 0.0, 0.0), (x_8 + (x1_9 + 
    (unity_SHC.xyz * ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y)))
  )));
  mediump vec3 tmpvar_11;
  tmpvar_11 = max (((1.055 * 
    pow (max (ambient_6, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_6 = tmpvar_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  tmpvar_5 = (tmpvar_11 + (unity_Lightmap_HDR.x * color_13.xyz));
  lowp vec4 c_14;
  lowp vec4 c_15;
  c_15.xyz = vec3(0.0, 0.0, 0.0);
  c_15.w = (tmpvar_3.w * _Color.w);
  c_14.w = c_15.w;
  c_14.xyz = ((tmpvar_3.xyz * _Color.xyz) * tmpvar_5);
  c_1.w = c_14.w;
  highp float tmpvar_16;
  tmpvar_16 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_14.xyz, vec3(tmpvar_16));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 lightColor0_7;
  lightColor0_7 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_8;
  lightColor1_8 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_9;
  lightColor2_9 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_10;
  lightColor3_10 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_11;
  lightAttenSq_11 = unity_4LightAtten0;
  highp vec3 col_12;
  highp vec4 ndotl_13;
  highp vec4 lengthSq_14;
  highp vec4 tmpvar_15;
  tmpvar_15 = (unity_4LightPosX0 - tmpvar_4.x);
  highp vec4 tmpvar_16;
  tmpvar_16 = (unity_4LightPosY0 - tmpvar_4.y);
  highp vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosZ0 - tmpvar_4.z);
  lengthSq_14 = (tmpvar_15 * tmpvar_15);
  lengthSq_14 = (lengthSq_14 + (tmpvar_16 * tmpvar_16));
  lengthSq_14 = (lengthSq_14 + (tmpvar_17 * tmpvar_17));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (lengthSq_14, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_14 = tmpvar_18;
  ndotl_13 = (tmpvar_15 * tmpvar_6.x);
  ndotl_13 = (ndotl_13 + (tmpvar_16 * tmpvar_6.y));
  ndotl_13 = (ndotl_13 + (tmpvar_17 * tmpvar_6.z));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_13 * inversesqrt(tmpvar_18)));
  ndotl_13 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 * (1.0/((1.0 + 
    (tmpvar_18 * lightAttenSq_11)
  ))));
  col_12 = (lightColor0_7 * tmpvar_20.x);
  col_12 = (col_12 + (lightColor1_8 * tmpvar_20.y));
  col_12 = (col_12 + (lightColor2_9 * tmpvar_20.z));
  col_12 = (col_12 + (lightColor3_10 * tmpvar_20.w));
  tmpvar_1 = col_12;
  mediump vec3 normal_21;
  normal_21 = tmpvar_6;
  mediump vec3 ambient_22;
  mediump vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = normal_21;
  mediump vec3 res_24;
  mediump vec3 x_25;
  x_25.x = dot (unity_SHAr, tmpvar_23);
  x_25.y = dot (unity_SHAg, tmpvar_23);
  x_25.z = dot (unity_SHAb, tmpvar_23);
  mediump vec3 x1_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = (normal_21.xyzz * normal_21.yzzx);
  x1_26.x = dot (unity_SHBr, tmpvar_27);
  x1_26.y = dot (unity_SHBg, tmpvar_27);
  x1_26.z = dot (unity_SHBb, tmpvar_27);
  res_24 = (x_25 + (x1_26 + (unity_SHC.xyz * 
    ((normal_21.x * normal_21.x) - (normal_21.y * normal_21.y))
  )));
  mediump vec3 tmpvar_28;
  tmpvar_28 = max (((1.055 * 
    pow (max (res_24, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_24 = tmpvar_28;
  ambient_22 = (tmpvar_1 + max (vec3(0.0, 0.0, 0.0), tmpvar_28));
  tmpvar_1 = ambient_22;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = ambient_22;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_4 = (tmpvar_9.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  highp float nh_13;
  lowp float diff_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_14 = tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_10)
  )));
  nh_13 = tmpvar_16;
  mediump float y_17;
  y_17 = (_Shininess * 128.0);
  highp float tmpvar_18;
  tmpvar_18 = (pow (nh_13, y_17) * tmpvar_9.w);
  c_12.xyz = (((tmpvar_4 * tmpvar_1) * diff_14) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_18));
  c_12.w = (tmpvar_9.w * _Color.w);
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_4 * xlv_TEXCOORD3));
  c_3.w = c_11.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_19));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 lightColor0_7;
  lightColor0_7 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_8;
  lightColor1_8 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_9;
  lightColor2_9 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_10;
  lightColor3_10 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_11;
  lightAttenSq_11 = unity_4LightAtten0;
  highp vec3 col_12;
  highp vec4 ndotl_13;
  highp vec4 lengthSq_14;
  highp vec4 tmpvar_15;
  tmpvar_15 = (unity_4LightPosX0 - tmpvar_4.x);
  highp vec4 tmpvar_16;
  tmpvar_16 = (unity_4LightPosY0 - tmpvar_4.y);
  highp vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosZ0 - tmpvar_4.z);
  lengthSq_14 = (tmpvar_15 * tmpvar_15);
  lengthSq_14 = (lengthSq_14 + (tmpvar_16 * tmpvar_16));
  lengthSq_14 = (lengthSq_14 + (tmpvar_17 * tmpvar_17));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (lengthSq_14, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_14 = tmpvar_18;
  ndotl_13 = (tmpvar_15 * tmpvar_6.x);
  ndotl_13 = (ndotl_13 + (tmpvar_16 * tmpvar_6.y));
  ndotl_13 = (ndotl_13 + (tmpvar_17 * tmpvar_6.z));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_13 * inversesqrt(tmpvar_18)));
  ndotl_13 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 * (1.0/((1.0 + 
    (tmpvar_18 * lightAttenSq_11)
  ))));
  col_12 = (lightColor0_7 * tmpvar_20.x);
  col_12 = (col_12 + (lightColor1_8 * tmpvar_20.y));
  col_12 = (col_12 + (lightColor2_9 * tmpvar_20.z));
  col_12 = (col_12 + (lightColor3_10 * tmpvar_20.w));
  tmpvar_1 = col_12;
  mediump vec3 normal_21;
  normal_21 = tmpvar_6;
  mediump vec3 ambient_22;
  mediump vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = normal_21;
  mediump vec3 res_24;
  mediump vec3 x_25;
  x_25.x = dot (unity_SHAr, tmpvar_23);
  x_25.y = dot (unity_SHAg, tmpvar_23);
  x_25.z = dot (unity_SHAb, tmpvar_23);
  mediump vec3 x1_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = (normal_21.xyzz * normal_21.yzzx);
  x1_26.x = dot (unity_SHBr, tmpvar_27);
  x1_26.y = dot (unity_SHBg, tmpvar_27);
  x1_26.z = dot (unity_SHBb, tmpvar_27);
  res_24 = (x_25 + (x1_26 + (unity_SHC.xyz * 
    ((normal_21.x * normal_21.x) - (normal_21.y * normal_21.y))
  )));
  mediump vec3 tmpvar_28;
  tmpvar_28 = max (((1.055 * 
    pow (max (res_24, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_24 = tmpvar_28;
  ambient_22 = (tmpvar_1 + max (vec3(0.0, 0.0, 0.0), tmpvar_28));
  tmpvar_1 = ambient_22;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = ambient_22;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_4 = (tmpvar_9.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  highp float nh_13;
  lowp float diff_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_14 = tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_10)
  )));
  nh_13 = tmpvar_16;
  mediump float y_17;
  y_17 = (_Shininess * 128.0);
  highp float tmpvar_18;
  tmpvar_18 = (pow (nh_13, y_17) * tmpvar_9.w);
  c_12.xyz = (((tmpvar_4 * tmpvar_1) * diff_14) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_18));
  c_12.w = (tmpvar_9.w * _Color.w);
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_4 * xlv_TEXCOORD3));
  c_3.w = c_11.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_19));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 lightColor0_7;
  lightColor0_7 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_8;
  lightColor1_8 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_9;
  lightColor2_9 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_10;
  lightColor3_10 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_11;
  lightAttenSq_11 = unity_4LightAtten0;
  highp vec3 col_12;
  highp vec4 ndotl_13;
  highp vec4 lengthSq_14;
  highp vec4 tmpvar_15;
  tmpvar_15 = (unity_4LightPosX0 - tmpvar_4.x);
  highp vec4 tmpvar_16;
  tmpvar_16 = (unity_4LightPosY0 - tmpvar_4.y);
  highp vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosZ0 - tmpvar_4.z);
  lengthSq_14 = (tmpvar_15 * tmpvar_15);
  lengthSq_14 = (lengthSq_14 + (tmpvar_16 * tmpvar_16));
  lengthSq_14 = (lengthSq_14 + (tmpvar_17 * tmpvar_17));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (lengthSq_14, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_14 = tmpvar_18;
  ndotl_13 = (tmpvar_15 * tmpvar_6.x);
  ndotl_13 = (ndotl_13 + (tmpvar_16 * tmpvar_6.y));
  ndotl_13 = (ndotl_13 + (tmpvar_17 * tmpvar_6.z));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_13 * inversesqrt(tmpvar_18)));
  ndotl_13 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 * (1.0/((1.0 + 
    (tmpvar_18 * lightAttenSq_11)
  ))));
  col_12 = (lightColor0_7 * tmpvar_20.x);
  col_12 = (col_12 + (lightColor1_8 * tmpvar_20.y));
  col_12 = (col_12 + (lightColor2_9 * tmpvar_20.z));
  col_12 = (col_12 + (lightColor3_10 * tmpvar_20.w));
  tmpvar_1 = col_12;
  mediump vec3 normal_21;
  normal_21 = tmpvar_6;
  mediump vec3 ambient_22;
  mediump vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = normal_21;
  mediump vec3 res_24;
  mediump vec3 x_25;
  x_25.x = dot (unity_SHAr, tmpvar_23);
  x_25.y = dot (unity_SHAg, tmpvar_23);
  x_25.z = dot (unity_SHAb, tmpvar_23);
  mediump vec3 x1_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = (normal_21.xyzz * normal_21.yzzx);
  x1_26.x = dot (unity_SHBr, tmpvar_27);
  x1_26.y = dot (unity_SHBg, tmpvar_27);
  x1_26.z = dot (unity_SHBb, tmpvar_27);
  res_24 = (x_25 + (x1_26 + (unity_SHC.xyz * 
    ((normal_21.x * normal_21.x) - (normal_21.y * normal_21.y))
  )));
  mediump vec3 tmpvar_28;
  tmpvar_28 = max (((1.055 * 
    pow (max (res_24, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_24 = tmpvar_28;
  ambient_22 = (tmpvar_1 + max (vec3(0.0, 0.0, 0.0), tmpvar_28));
  tmpvar_1 = ambient_22;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = ambient_22;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_4 = (tmpvar_9.xyz * _Color.xyz);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  highp float nh_13;
  lowp float diff_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_14 = tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_10)
  )));
  nh_13 = tmpvar_16;
  mediump float y_17;
  y_17 = (_Shininess * 128.0);
  highp float tmpvar_18;
  tmpvar_18 = (pow (nh_13, y_17) * tmpvar_9.w);
  c_12.xyz = (((tmpvar_4 * tmpvar_1) * diff_14) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_18));
  c_12.w = (tmpvar_9.w * _Color.w);
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_4 * xlv_TEXCOORD3));
  c_3.w = c_11.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_19));
  gl_FragData[0] = c_3;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "FORWARD"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  GpuProgramID 93876
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec3 lightCoord_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_10).xyz;
  highp float tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, vec2(dot (lightCoord_4, lightCoord_4))).w;
  atten_3 = tmpvar_11;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_3);
  mediump vec3 viewDir_12;
  viewDir_12 = worldViewDir_6;
  lowp vec4 c_13;
  lowp vec4 c_14;
  highp float nh_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_12)
  )));
  nh_15 = tmpvar_18;
  mediump float y_19;
  y_19 = (_Shininess * 128.0);
  highp float tmpvar_20;
  tmpvar_20 = (pow (nh_15, y_19) * tmpvar_9.w);
  c_14.xyz = (((tmpvar_9.xyz * _Color.xyz) * (tmpvar_1 * diff_16)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_20));
  c_14.w = (tmpvar_9.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = c_14.xyz;
  gl_FragData[0] = c_13;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec3 lightCoord_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_10).xyz;
  highp float tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, vec2(dot (lightCoord_4, lightCoord_4))).w;
  atten_3 = tmpvar_11;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_3);
  mediump vec3 viewDir_12;
  viewDir_12 = worldViewDir_6;
  lowp vec4 c_13;
  lowp vec4 c_14;
  highp float nh_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_12)
  )));
  nh_15 = tmpvar_18;
  mediump float y_19;
  y_19 = (_Shininess * 128.0);
  highp float tmpvar_20;
  tmpvar_20 = (pow (nh_15, y_19) * tmpvar_9.w);
  c_14.xyz = (((tmpvar_9.xyz * _Color.xyz) * (tmpvar_1 * diff_16)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_20));
  c_14.w = (tmpvar_9.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = c_14.xyz;
  gl_FragData[0] = c_13;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec3 lightCoord_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_10).xyz;
  highp float tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, vec2(dot (lightCoord_4, lightCoord_4))).w;
  atten_3 = tmpvar_11;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_3);
  mediump vec3 viewDir_12;
  viewDir_12 = worldViewDir_6;
  lowp vec4 c_13;
  lowp vec4 c_14;
  highp float nh_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_12)
  )));
  nh_15 = tmpvar_18;
  mediump float y_19;
  y_19 = (_Shininess * 128.0);
  highp float tmpvar_20;
  tmpvar_20 = (pow (nh_15, y_19) * tmpvar_9.w);
  c_14.xyz = (((tmpvar_9.xyz * _Color.xyz) * (tmpvar_1 * diff_16)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_20));
  c_14.w = (tmpvar_9.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = c_14.xyz;
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec3 worldViewDir_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  worldViewDir_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 viewDir_8;
  viewDir_8 = worldViewDir_4;
  lowp vec4 c_9;
  lowp vec4 c_10;
  highp float nh_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_3, normalize(
    (tmpvar_2 + viewDir_8)
  )));
  nh_11 = tmpvar_14;
  mediump float y_15;
  y_15 = (_Shininess * 128.0);
  highp float tmpvar_16;
  tmpvar_16 = (pow (nh_11, y_15) * tmpvar_7.w);
  c_10.xyz = (((tmpvar_7.xyz * _Color.xyz) * (tmpvar_1 * diff_12)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_16));
  c_10.w = (tmpvar_7.w * _Color.w);
  c_9.w = c_10.w;
  c_9.xyz = c_10.xyz;
  gl_FragData[0] = c_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec3 worldViewDir_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  worldViewDir_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 viewDir_8;
  viewDir_8 = worldViewDir_4;
  lowp vec4 c_9;
  lowp vec4 c_10;
  highp float nh_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_3, normalize(
    (tmpvar_2 + viewDir_8)
  )));
  nh_11 = tmpvar_14;
  mediump float y_15;
  y_15 = (_Shininess * 128.0);
  highp float tmpvar_16;
  tmpvar_16 = (pow (nh_11, y_15) * tmpvar_7.w);
  c_10.xyz = (((tmpvar_7.xyz * _Color.xyz) * (tmpvar_1 * diff_12)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_16));
  c_10.w = (tmpvar_7.w * _Color.w);
  c_9.w = c_10.w;
  c_9.xyz = c_10.xyz;
  gl_FragData[0] = c_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec3 worldViewDir_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  worldViewDir_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 viewDir_8;
  viewDir_8 = worldViewDir_4;
  lowp vec4 c_9;
  lowp vec4 c_10;
  highp float nh_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_3, normalize(
    (tmpvar_2 + viewDir_8)
  )));
  nh_11 = tmpvar_14;
  mediump float y_15;
  y_15 = (_Shininess * 128.0);
  highp float tmpvar_16;
  tmpvar_16 = (pow (nh_11, y_15) * tmpvar_7.w);
  c_10.xyz = (((tmpvar_7.xyz * _Color.xyz) * (tmpvar_1 * diff_12)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_16));
  c_10.w = (tmpvar_7.w * _Color.w);
  c_9.w = c_10.w;
  c_9.xyz = c_10.xyz;
  gl_FragData[0] = c_9;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec4 lightCoord_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_10);
  lowp float tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, ((lightCoord_4.xy / lightCoord_4.w) + 0.5));
  tmpvar_11 = tmpvar_12.w;
  lowp float tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(dot (lightCoord_4.xyz, lightCoord_4.xyz)));
  tmpvar_13 = tmpvar_14.w;
  highp float tmpvar_15;
  tmpvar_15 = ((float(
    (lightCoord_4.z > 0.0)
  ) * tmpvar_11) * tmpvar_13);
  atten_3 = tmpvar_15;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_3);
  mediump vec3 viewDir_16;
  viewDir_16 = worldViewDir_6;
  lowp vec4 c_17;
  lowp vec4 c_18;
  highp float nh_19;
  lowp float diff_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_20 = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_16)
  )));
  nh_19 = tmpvar_22;
  mediump float y_23;
  y_23 = (_Shininess * 128.0);
  highp float tmpvar_24;
  tmpvar_24 = (pow (nh_19, y_23) * tmpvar_9.w);
  c_18.xyz = (((tmpvar_9.xyz * _Color.xyz) * (tmpvar_1 * diff_20)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_24));
  c_18.w = (tmpvar_9.w * _Color.w);
  c_17.w = c_18.w;
  c_17.xyz = c_18.xyz;
  gl_FragData[0] = c_17;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec4 lightCoord_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_10);
  lowp float tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, ((lightCoord_4.xy / lightCoord_4.w) + 0.5));
  tmpvar_11 = tmpvar_12.w;
  lowp float tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(dot (lightCoord_4.xyz, lightCoord_4.xyz)));
  tmpvar_13 = tmpvar_14.w;
  highp float tmpvar_15;
  tmpvar_15 = ((float(
    (lightCoord_4.z > 0.0)
  ) * tmpvar_11) * tmpvar_13);
  atten_3 = tmpvar_15;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_3);
  mediump vec3 viewDir_16;
  viewDir_16 = worldViewDir_6;
  lowp vec4 c_17;
  lowp vec4 c_18;
  highp float nh_19;
  lowp float diff_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_20 = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_16)
  )));
  nh_19 = tmpvar_22;
  mediump float y_23;
  y_23 = (_Shininess * 128.0);
  highp float tmpvar_24;
  tmpvar_24 = (pow (nh_19, y_23) * tmpvar_9.w);
  c_18.xyz = (((tmpvar_9.xyz * _Color.xyz) * (tmpvar_1 * diff_20)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_24));
  c_18.w = (tmpvar_9.w * _Color.w);
  c_17.w = c_18.w;
  c_17.xyz = c_18.xyz;
  gl_FragData[0] = c_17;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec4 lightCoord_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_10);
  lowp float tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, ((lightCoord_4.xy / lightCoord_4.w) + 0.5));
  tmpvar_11 = tmpvar_12.w;
  lowp float tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(dot (lightCoord_4.xyz, lightCoord_4.xyz)));
  tmpvar_13 = tmpvar_14.w;
  highp float tmpvar_15;
  tmpvar_15 = ((float(
    (lightCoord_4.z > 0.0)
  ) * tmpvar_11) * tmpvar_13);
  atten_3 = tmpvar_15;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_3);
  mediump vec3 viewDir_16;
  viewDir_16 = worldViewDir_6;
  lowp vec4 c_17;
  lowp vec4 c_18;
  highp float nh_19;
  lowp float diff_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_20 = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_16)
  )));
  nh_19 = tmpvar_22;
  mediump float y_23;
  y_23 = (_Shininess * 128.0);
  highp float tmpvar_24;
  tmpvar_24 = (pow (nh_19, y_23) * tmpvar_9.w);
  c_18.xyz = (((tmpvar_9.xyz * _Color.xyz) * (tmpvar_1 * diff_20)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_24));
  c_18.w = (tmpvar_9.w * _Color.w);
  c_17.w = c_18.w;
  c_17.xyz = c_18.xyz;
  gl_FragData[0] = c_17;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec3 lightCoord_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_10).xyz;
  highp float tmpvar_11;
  tmpvar_11 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_4, lightCoord_4))).w * textureCube (_LightTexture0, lightCoord_4).w);
  atten_3 = tmpvar_11;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_3);
  mediump vec3 viewDir_12;
  viewDir_12 = worldViewDir_6;
  lowp vec4 c_13;
  lowp vec4 c_14;
  highp float nh_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_12)
  )));
  nh_15 = tmpvar_18;
  mediump float y_19;
  y_19 = (_Shininess * 128.0);
  highp float tmpvar_20;
  tmpvar_20 = (pow (nh_15, y_19) * tmpvar_9.w);
  c_14.xyz = (((tmpvar_9.xyz * _Color.xyz) * (tmpvar_1 * diff_16)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_20));
  c_14.w = (tmpvar_9.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = c_14.xyz;
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec3 lightCoord_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_10).xyz;
  highp float tmpvar_11;
  tmpvar_11 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_4, lightCoord_4))).w * textureCube (_LightTexture0, lightCoord_4).w);
  atten_3 = tmpvar_11;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_3);
  mediump vec3 viewDir_12;
  viewDir_12 = worldViewDir_6;
  lowp vec4 c_13;
  lowp vec4 c_14;
  highp float nh_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_12)
  )));
  nh_15 = tmpvar_18;
  mediump float y_19;
  y_19 = (_Shininess * 128.0);
  highp float tmpvar_20;
  tmpvar_20 = (pow (nh_15, y_19) * tmpvar_9.w);
  c_14.xyz = (((tmpvar_9.xyz * _Color.xyz) * (tmpvar_1 * diff_16)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_20));
  c_14.w = (tmpvar_9.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = c_14.xyz;
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec3 lightCoord_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_10).xyz;
  highp float tmpvar_11;
  tmpvar_11 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_4, lightCoord_4))).w * textureCube (_LightTexture0, lightCoord_4).w);
  atten_3 = tmpvar_11;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_3);
  mediump vec3 viewDir_12;
  viewDir_12 = worldViewDir_6;
  lowp vec4 c_13;
  lowp vec4 c_14;
  highp float nh_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_12)
  )));
  nh_15 = tmpvar_18;
  mediump float y_19;
  y_19 = (_Shininess * 128.0);
  highp float tmpvar_20;
  tmpvar_20 = (pow (nh_15, y_19) * tmpvar_9.w);
  c_14.xyz = (((tmpvar_9.xyz * _Color.xyz) * (tmpvar_1 * diff_16)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_20));
  c_14.w = (tmpvar_9.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = c_14.xyz;
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = xlv_TEXCOORD2;
  highp float tmpvar_10;
  tmpvar_10 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_9).xy).w;
  atten_3 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_3);
  mediump vec3 viewDir_11;
  viewDir_11 = worldViewDir_5;
  lowp vec4 c_12;
  lowp vec4 c_13;
  highp float nh_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_15 = tmpvar_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_11)
  )));
  nh_14 = tmpvar_17;
  mediump float y_18;
  y_18 = (_Shininess * 128.0);
  highp float tmpvar_19;
  tmpvar_19 = (pow (nh_14, y_18) * tmpvar_8.w);
  c_13.xyz = (((tmpvar_8.xyz * _Color.xyz) * (tmpvar_1 * diff_15)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_19));
  c_13.w = (tmpvar_8.w * _Color.w);
  c_12.w = c_13.w;
  c_12.xyz = c_13.xyz;
  gl_FragData[0] = c_12;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = xlv_TEXCOORD2;
  highp float tmpvar_10;
  tmpvar_10 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_9).xy).w;
  atten_3 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_3);
  mediump vec3 viewDir_11;
  viewDir_11 = worldViewDir_5;
  lowp vec4 c_12;
  lowp vec4 c_13;
  highp float nh_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_15 = tmpvar_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_11)
  )));
  nh_14 = tmpvar_17;
  mediump float y_18;
  y_18 = (_Shininess * 128.0);
  highp float tmpvar_19;
  tmpvar_19 = (pow (nh_14, y_18) * tmpvar_8.w);
  c_13.xyz = (((tmpvar_8.xyz * _Color.xyz) * (tmpvar_1 * diff_15)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_19));
  c_13.w = (tmpvar_8.w * _Color.w);
  c_12.w = c_13.w;
  c_12.xyz = c_13.xyz;
  gl_FragData[0] = c_12;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = xlv_TEXCOORD2;
  highp float tmpvar_10;
  tmpvar_10 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_9).xy).w;
  atten_3 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_3);
  mediump vec3 viewDir_11;
  viewDir_11 = worldViewDir_5;
  lowp vec4 c_12;
  lowp vec4 c_13;
  highp float nh_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_15 = tmpvar_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_11)
  )));
  nh_14 = tmpvar_17;
  mediump float y_18;
  y_18 = (_Shininess * 128.0);
  highp float tmpvar_19;
  tmpvar_19 = (pow (nh_14, y_18) * tmpvar_8.w);
  c_13.xyz = (((tmpvar_8.xyz * _Color.xyz) * (tmpvar_1 * diff_15)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_19));
  c_13.w = (tmpvar_8.w * _Color.w);
  c_12.w = c_13.w;
  c_12.xyz = c_13.xyz;
  gl_FragData[0] = c_12;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  highp vec3 worldViewDir_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_8 = tmpvar_9;
  worldViewDir_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11).xyz;
  highp float tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_12;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_7;
  lowp vec4 c_14;
  lowp vec4 c_15;
  highp float nh_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_17 = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_13)
  )));
  nh_16 = tmpvar_19;
  mediump float y_20;
  y_20 = (_Shininess * 128.0);
  highp float tmpvar_21;
  tmpvar_21 = (pow (nh_16, y_20) * tmpvar_10.w);
  c_15.xyz = (((tmpvar_10.xyz * _Color.xyz) * (tmpvar_1 * diff_17)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_21));
  c_15.w = (tmpvar_10.w * _Color.w);
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  c_3.w = c_14.w;
  highp float tmpvar_22;
  tmpvar_22 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_15.xyz * vec3(tmpvar_22));
  gl_FragData[0] = c_3;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  highp vec3 worldViewDir_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_8 = tmpvar_9;
  worldViewDir_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11).xyz;
  highp float tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_12;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_7;
  lowp vec4 c_14;
  lowp vec4 c_15;
  highp float nh_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_17 = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_13)
  )));
  nh_16 = tmpvar_19;
  mediump float y_20;
  y_20 = (_Shininess * 128.0);
  highp float tmpvar_21;
  tmpvar_21 = (pow (nh_16, y_20) * tmpvar_10.w);
  c_15.xyz = (((tmpvar_10.xyz * _Color.xyz) * (tmpvar_1 * diff_17)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_21));
  c_15.w = (tmpvar_10.w * _Color.w);
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  c_3.w = c_14.w;
  highp float tmpvar_22;
  tmpvar_22 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_15.xyz * vec3(tmpvar_22));
  gl_FragData[0] = c_3;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  highp vec3 worldViewDir_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_8 = tmpvar_9;
  worldViewDir_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11).xyz;
  highp float tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_12;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_7;
  lowp vec4 c_14;
  lowp vec4 c_15;
  highp float nh_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_17 = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_13)
  )));
  nh_16 = tmpvar_19;
  mediump float y_20;
  y_20 = (_Shininess * 128.0);
  highp float tmpvar_21;
  tmpvar_21 = (pow (nh_16, y_20) * tmpvar_10.w);
  c_15.xyz = (((tmpvar_10.xyz * _Color.xyz) * (tmpvar_1 * diff_17)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_21));
  c_15.w = (tmpvar_10.w * _Color.w);
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  c_3.w = c_14.w;
  highp float tmpvar_22;
  tmpvar_22 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_15.xyz * vec3(tmpvar_22));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 viewDir_9;
  viewDir_9 = worldViewDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  highp float nh_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_9)
  )));
  nh_12 = tmpvar_15;
  mediump float y_16;
  y_16 = (_Shininess * 128.0);
  highp float tmpvar_17;
  tmpvar_17 = (pow (nh_12, y_16) * tmpvar_8.w);
  c_11.xyz = (((tmpvar_8.xyz * _Color.xyz) * (tmpvar_1 * diff_13)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_17));
  c_11.w = (tmpvar_8.w * _Color.w);
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  c_3.w = c_10.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_11.xyz * vec3(tmpvar_18));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 viewDir_9;
  viewDir_9 = worldViewDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  highp float nh_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_9)
  )));
  nh_12 = tmpvar_15;
  mediump float y_16;
  y_16 = (_Shininess * 128.0);
  highp float tmpvar_17;
  tmpvar_17 = (pow (nh_12, y_16) * tmpvar_8.w);
  c_11.xyz = (((tmpvar_8.xyz * _Color.xyz) * (tmpvar_1 * diff_13)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_17));
  c_11.w = (tmpvar_8.w * _Color.w);
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  c_3.w = c_10.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_11.xyz * vec3(tmpvar_18));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  highp vec3 worldViewDir_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  worldViewDir_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 viewDir_9;
  viewDir_9 = worldViewDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  highp float nh_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_4, normalize(
    (tmpvar_2 + viewDir_9)
  )));
  nh_12 = tmpvar_15;
  mediump float y_16;
  y_16 = (_Shininess * 128.0);
  highp float tmpvar_17;
  tmpvar_17 = (pow (nh_12, y_16) * tmpvar_8.w);
  c_11.xyz = (((tmpvar_8.xyz * _Color.xyz) * (tmpvar_1 * diff_13)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_17));
  c_11.w = (tmpvar_8.w * _Color.w);
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  c_3.w = c_10.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_11.xyz * vec3(tmpvar_18));
  gl_FragData[0] = c_3;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  highp vec3 worldViewDir_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_8 = tmpvar_9;
  worldViewDir_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11);
  lowp float tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, ((lightCoord_5.xy / lightCoord_5.w) + 0.5));
  tmpvar_12 = tmpvar_13.w;
  lowp float tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_LightTextureB0, vec2(dot (lightCoord_5.xyz, lightCoord_5.xyz)));
  tmpvar_14 = tmpvar_15.w;
  highp float tmpvar_16;
  tmpvar_16 = ((float(
    (lightCoord_5.z > 0.0)
  ) * tmpvar_12) * tmpvar_14);
  atten_4 = tmpvar_16;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_17;
  viewDir_17 = worldViewDir_7;
  lowp vec4 c_18;
  lowp vec4 c_19;
  highp float nh_20;
  lowp float diff_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_21 = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_17)
  )));
  nh_20 = tmpvar_23;
  mediump float y_24;
  y_24 = (_Shininess * 128.0);
  highp float tmpvar_25;
  tmpvar_25 = (pow (nh_20, y_24) * tmpvar_10.w);
  c_19.xyz = (((tmpvar_10.xyz * _Color.xyz) * (tmpvar_1 * diff_21)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_25));
  c_19.w = (tmpvar_10.w * _Color.w);
  c_18.w = c_19.w;
  c_18.xyz = c_19.xyz;
  c_3.w = c_18.w;
  highp float tmpvar_26;
  tmpvar_26 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_19.xyz * vec3(tmpvar_26));
  gl_FragData[0] = c_3;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  highp vec3 worldViewDir_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_8 = tmpvar_9;
  worldViewDir_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11);
  lowp float tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, ((lightCoord_5.xy / lightCoord_5.w) + 0.5));
  tmpvar_12 = tmpvar_13.w;
  lowp float tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_LightTextureB0, vec2(dot (lightCoord_5.xyz, lightCoord_5.xyz)));
  tmpvar_14 = tmpvar_15.w;
  highp float tmpvar_16;
  tmpvar_16 = ((float(
    (lightCoord_5.z > 0.0)
  ) * tmpvar_12) * tmpvar_14);
  atten_4 = tmpvar_16;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_17;
  viewDir_17 = worldViewDir_7;
  lowp vec4 c_18;
  lowp vec4 c_19;
  highp float nh_20;
  lowp float diff_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_21 = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_17)
  )));
  nh_20 = tmpvar_23;
  mediump float y_24;
  y_24 = (_Shininess * 128.0);
  highp float tmpvar_25;
  tmpvar_25 = (pow (nh_20, y_24) * tmpvar_10.w);
  c_19.xyz = (((tmpvar_10.xyz * _Color.xyz) * (tmpvar_1 * diff_21)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_25));
  c_19.w = (tmpvar_10.w * _Color.w);
  c_18.w = c_19.w;
  c_18.xyz = c_19.xyz;
  c_3.w = c_18.w;
  highp float tmpvar_26;
  tmpvar_26 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_19.xyz * vec3(tmpvar_26));
  gl_FragData[0] = c_3;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  highp vec3 worldViewDir_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_8 = tmpvar_9;
  worldViewDir_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11);
  lowp float tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, ((lightCoord_5.xy / lightCoord_5.w) + 0.5));
  tmpvar_12 = tmpvar_13.w;
  lowp float tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_LightTextureB0, vec2(dot (lightCoord_5.xyz, lightCoord_5.xyz)));
  tmpvar_14 = tmpvar_15.w;
  highp float tmpvar_16;
  tmpvar_16 = ((float(
    (lightCoord_5.z > 0.0)
  ) * tmpvar_12) * tmpvar_14);
  atten_4 = tmpvar_16;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_17;
  viewDir_17 = worldViewDir_7;
  lowp vec4 c_18;
  lowp vec4 c_19;
  highp float nh_20;
  lowp float diff_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_21 = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_17)
  )));
  nh_20 = tmpvar_23;
  mediump float y_24;
  y_24 = (_Shininess * 128.0);
  highp float tmpvar_25;
  tmpvar_25 = (pow (nh_20, y_24) * tmpvar_10.w);
  c_19.xyz = (((tmpvar_10.xyz * _Color.xyz) * (tmpvar_1 * diff_21)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_25));
  c_19.w = (tmpvar_10.w * _Color.w);
  c_18.w = c_19.w;
  c_18.xyz = c_19.xyz;
  c_3.w = c_18.w;
  highp float tmpvar_26;
  tmpvar_26 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_19.xyz * vec3(tmpvar_26));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  highp vec3 worldViewDir_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_8 = tmpvar_9;
  worldViewDir_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11).xyz;
  highp float tmpvar_12;
  tmpvar_12 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_12;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_7;
  lowp vec4 c_14;
  lowp vec4 c_15;
  highp float nh_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_17 = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_13)
  )));
  nh_16 = tmpvar_19;
  mediump float y_20;
  y_20 = (_Shininess * 128.0);
  highp float tmpvar_21;
  tmpvar_21 = (pow (nh_16, y_20) * tmpvar_10.w);
  c_15.xyz = (((tmpvar_10.xyz * _Color.xyz) * (tmpvar_1 * diff_17)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_21));
  c_15.w = (tmpvar_10.w * _Color.w);
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  c_3.w = c_14.w;
  highp float tmpvar_22;
  tmpvar_22 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_15.xyz * vec3(tmpvar_22));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  highp vec3 worldViewDir_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_8 = tmpvar_9;
  worldViewDir_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11).xyz;
  highp float tmpvar_12;
  tmpvar_12 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_12;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_7;
  lowp vec4 c_14;
  lowp vec4 c_15;
  highp float nh_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_17 = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_13)
  )));
  nh_16 = tmpvar_19;
  mediump float y_20;
  y_20 = (_Shininess * 128.0);
  highp float tmpvar_21;
  tmpvar_21 = (pow (nh_16, y_20) * tmpvar_10.w);
  c_15.xyz = (((tmpvar_10.xyz * _Color.xyz) * (tmpvar_1 * diff_17)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_21));
  c_15.w = (tmpvar_10.w * _Color.w);
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  c_3.w = c_14.w;
  highp float tmpvar_22;
  tmpvar_22 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_15.xyz * vec3(tmpvar_22));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  highp vec3 worldViewDir_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_8 = tmpvar_9;
  worldViewDir_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11).xyz;
  highp float tmpvar_12;
  tmpvar_12 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_12;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_7;
  lowp vec4 c_14;
  lowp vec4 c_15;
  highp float nh_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_17 = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_13)
  )));
  nh_16 = tmpvar_19;
  mediump float y_20;
  y_20 = (_Shininess * 128.0);
  highp float tmpvar_21;
  tmpvar_21 = (pow (nh_16, y_20) * tmpvar_10.w);
  c_15.xyz = (((tmpvar_10.xyz * _Color.xyz) * (tmpvar_1 * diff_17)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_21));
  c_15.w = (tmpvar_10.w * _Color.w);
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  c_3.w = c_14.w;
  highp float tmpvar_22;
  tmpvar_22 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_15.xyz * vec3(tmpvar_22));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD2;
  highp float tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_10).xy).w;
  atten_4 = tmpvar_11;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_12;
  viewDir_12 = worldViewDir_6;
  lowp vec4 c_13;
  lowp vec4 c_14;
  highp float nh_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_12)
  )));
  nh_15 = tmpvar_18;
  mediump float y_19;
  y_19 = (_Shininess * 128.0);
  highp float tmpvar_20;
  tmpvar_20 = (pow (nh_15, y_19) * tmpvar_9.w);
  c_14.xyz = (((tmpvar_9.xyz * _Color.xyz) * (tmpvar_1 * diff_16)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_20));
  c_14.w = (tmpvar_9.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = c_14.xyz;
  c_3.w = c_13.w;
  highp float tmpvar_21;
  tmpvar_21 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_14.xyz * vec3(tmpvar_21));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD2;
  highp float tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_10).xy).w;
  atten_4 = tmpvar_11;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_12;
  viewDir_12 = worldViewDir_6;
  lowp vec4 c_13;
  lowp vec4 c_14;
  highp float nh_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_12)
  )));
  nh_15 = tmpvar_18;
  mediump float y_19;
  y_19 = (_Shininess * 128.0);
  highp float tmpvar_20;
  tmpvar_20 = (pow (nh_15, y_19) * tmpvar_9.w);
  c_14.xyz = (((tmpvar_9.xyz * _Color.xyz) * (tmpvar_1 * diff_16)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_20));
  c_14.w = (tmpvar_9.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = c_14.xyz;
  c_3.w = c_13.w;
  highp float tmpvar_21;
  tmpvar_21 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_14.xyz * vec3(tmpvar_21));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform mediump float _Shininess;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  highp vec3 worldViewDir_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  worldViewDir_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD2));
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD2;
  highp float tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_10).xy).w;
  atten_4 = tmpvar_11;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_12;
  viewDir_12 = worldViewDir_6;
  lowp vec4 c_13;
  lowp vec4 c_14;
  highp float nh_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_12)
  )));
  nh_15 = tmpvar_18;
  mediump float y_19;
  y_19 = (_Shininess * 128.0);
  highp float tmpvar_20;
  tmpvar_20 = (pow (nh_15, y_19) * tmpvar_9.w);
  c_14.xyz = (((tmpvar_9.xyz * _Color.xyz) * (tmpvar_1 * diff_16)) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_20));
  c_14.w = (tmpvar_9.w * _Color.w);
  c_13.w = c_14.w;
  c_13.xyz = c_14.xyz;
  c_3.w = c_13.w;
  highp float tmpvar_21;
  tmpvar_21 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_14.xyz * vec3(tmpvar_21));
  gl_FragData[0] = c_3;
}


#endif
"
}
}
Program "fp" {
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
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
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
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
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
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "META"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 142729
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 vertex_1;
  vertex_1 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_2;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_2 = 0.0001;
    } else {
      tmpvar_2 = 0.0;
    };
    vertex_1.z = tmpvar_2;
  };
  if (unity_MetaVertexControl.y) {
    vertex_1.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_3;
    if ((vertex_1.z > 0.0)) {
      tmpvar_3 = 0.0001;
    } else {
      tmpvar_3 = 0.0;
    };
    vertex_1.z = tmpvar_3;
  };
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = vertex_1.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0).xyz * _Color.xyz);
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_4;
  res_4 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_5;
    tmpvar_5.w = 1.0;
    tmpvar_5.xyz = tmpvar_2;
    res_4.w = tmpvar_5.w;
    highp vec3 tmpvar_6;
    tmpvar_6 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_4.xyz = tmpvar_6;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_7;
    if (bool(unity_UseLinearSpace)) {
      emission_7 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_7 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = emission_7;
    res_4 = tmpvar_8;
  };
  tmpvar_1 = res_4;
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
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 vertex_1;
  vertex_1 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_2;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_2 = 0.0001;
    } else {
      tmpvar_2 = 0.0;
    };
    vertex_1.z = tmpvar_2;
  };
  if (unity_MetaVertexControl.y) {
    vertex_1.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_3;
    if ((vertex_1.z > 0.0)) {
      tmpvar_3 = 0.0001;
    } else {
      tmpvar_3 = 0.0;
    };
    vertex_1.z = tmpvar_3;
  };
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = vertex_1.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0).xyz * _Color.xyz);
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_4;
  res_4 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_5;
    tmpvar_5.w = 1.0;
    tmpvar_5.xyz = tmpvar_2;
    res_4.w = tmpvar_5.w;
    highp vec3 tmpvar_6;
    tmpvar_6 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_4.xyz = tmpvar_6;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_7;
    if (bool(unity_UseLinearSpace)) {
      emission_7 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_7 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = emission_7;
    res_4 = tmpvar_8;
  };
  tmpvar_1 = res_4;
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
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 vertex_1;
  vertex_1 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_2;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_2 = 0.0001;
    } else {
      tmpvar_2 = 0.0;
    };
    vertex_1.z = tmpvar_2;
  };
  if (unity_MetaVertexControl.y) {
    vertex_1.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_3;
    if ((vertex_1.z > 0.0)) {
      tmpvar_3 = 0.0001;
    } else {
      tmpvar_3 = 0.0;
    };
    vertex_1.z = tmpvar_3;
  };
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = vertex_1.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0).xyz * _Color.xyz);
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_4;
  res_4 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_5;
    tmpvar_5.w = 1.0;
    tmpvar_5.xyz = tmpvar_2;
    res_4.w = tmpvar_5.w;
    highp vec3 tmpvar_6;
    tmpvar_6 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_4.xyz = tmpvar_6;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_7;
    if (bool(unity_UseLinearSpace)) {
      emission_7 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_7 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = emission_7;
    res_4 = tmpvar_8;
  };
  tmpvar_1 = res_4;
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
Fallback "Legacy Shaders/Transparent/VertexLit"
}