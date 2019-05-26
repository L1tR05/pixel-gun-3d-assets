//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Decal/Transparent Diffuse Colored" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Offset -1, -1
  GpuProgramID 19976
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7 * tmpvar_1) * diff_12);
  c_11.w = tmpvar_8;
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7 * tmpvar_1) * diff_12);
  c_11.w = tmpvar_8;
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7 * tmpvar_1) * diff_12);
  c_11.w = tmpvar_8;
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), tmpvar_10);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7 * tmpvar_1) * diff_12);
  c_11.w = tmpvar_8;
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_7 * xlv_TEXCOORD3));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), tmpvar_10);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7 * tmpvar_1) * diff_12);
  c_11.w = tmpvar_8;
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_7 * xlv_TEXCOORD3));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), tmpvar_10);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7 * tmpvar_1) * diff_12);
  c_11.w = tmpvar_8;
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_7 * xlv_TEXCOORD3));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  mediump vec3 tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_10 = (unity_Lightmap_HDR.x * color_12.xyz);
  lowp vec4 c_13;
  lowp vec4 c_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_15 = tmpvar_16;
  c_14.xyz = ((tmpvar_7 * tmpvar_1) * diff_15);
  c_14.w = tmpvar_8;
  c_13.w = c_14.w;
  c_13.xyz = (c_14.xyz + (tmpvar_7 * tmpvar_10));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  mediump vec3 tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_10 = (unity_Lightmap_HDR.x * color_12.xyz);
  lowp vec4 c_13;
  lowp vec4 c_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_15 = tmpvar_16;
  c_14.xyz = ((tmpvar_7 * tmpvar_1) * diff_15);
  c_14.w = tmpvar_8;
  c_13.w = c_14.w;
  c_13.xyz = (c_14.xyz + (tmpvar_7 * tmpvar_10));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  mediump vec3 tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_10 = (unity_Lightmap_HDR.x * color_12.xyz);
  lowp vec4 c_13;
  lowp vec4 c_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_15 = tmpvar_16;
  c_14.xyz = ((tmpvar_7 * tmpvar_1) * diff_15);
  c_14.w = tmpvar_8;
  c_13.w = c_14.w;
  c_13.xyz = (c_14.xyz + (tmpvar_7 * tmpvar_10));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
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
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  mediump vec3 normalWorld_10;
  normalWorld_10 = tmpvar_3;
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
  lowp vec4 c_20;
  lowp vec4 c_21;
  lowp float diff_22;
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_22 = tmpvar_23;
  c_21.xyz = ((tmpvar_7 * tmpvar_1) * diff_22);
  c_21.w = tmpvar_8;
  c_20.w = c_21.w;
  c_20.xyz = (c_21.xyz + (tmpvar_7 * tmpvar_11));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
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
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  mediump vec3 normalWorld_10;
  normalWorld_10 = tmpvar_3;
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
  lowp vec4 c_20;
  lowp vec4 c_21;
  lowp float diff_22;
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_22 = tmpvar_23;
  c_21.xyz = ((tmpvar_7 * tmpvar_1) * diff_22);
  c_21.w = tmpvar_8;
  c_20.w = c_21.w;
  c_20.xyz = (c_21.xyz + (tmpvar_7 * tmpvar_11));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
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
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  mediump vec3 normalWorld_10;
  normalWorld_10 = tmpvar_3;
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
  lowp vec4 c_20;
  lowp vec4 c_21;
  lowp float diff_22;
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_22 = tmpvar_23;
  c_21.xyz = ((tmpvar_7 * tmpvar_1) * diff_22);
  c_21.w = tmpvar_8;
  c_20.w = c_21.w;
  c_20.xyz = (c_21.xyz + (tmpvar_7 * tmpvar_11));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = xlv_COLOR0;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_2 = (tmpvar_4.xyz * tmpvar_1.xyz);
  tmpvar_3 = (tmpvar_4.w * tmpvar_1.w);
  mediump vec3 tmpvar_5;
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_7;
  color_7 = tmpvar_6;
  tmpvar_5 = (unity_Lightmap_HDR.x * color_7.xyz);
  lowp vec4 c_8;
  lowp vec4 c_9;
  c_9.xyz = vec3(0.0, 0.0, 0.0);
  c_9.w = tmpvar_3;
  c_8.w = c_9.w;
  c_8.xyz = (tmpvar_2 * tmpvar_5);
  gl_FragData[0] = c_8;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = xlv_COLOR0;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_2 = (tmpvar_4.xyz * tmpvar_1.xyz);
  tmpvar_3 = (tmpvar_4.w * tmpvar_1.w);
  mediump vec3 tmpvar_5;
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_7;
  color_7 = tmpvar_6;
  tmpvar_5 = (unity_Lightmap_HDR.x * color_7.xyz);
  lowp vec4 c_8;
  lowp vec4 c_9;
  c_9.xyz = vec3(0.0, 0.0, 0.0);
  c_9.w = tmpvar_3;
  c_8.w = c_9.w;
  c_8.xyz = (tmpvar_2 * tmpvar_5);
  gl_FragData[0] = c_8;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = xlv_COLOR0;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_2 = (tmpvar_4.xyz * tmpvar_1.xyz);
  tmpvar_3 = (tmpvar_4.w * tmpvar_1.w);
  mediump vec3 tmpvar_5;
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_7;
  color_7 = tmpvar_6;
  tmpvar_5 = (unity_Lightmap_HDR.x * color_7.xyz);
  lowp vec4 c_8;
  lowp vec4 c_9;
  c_9.xyz = vec3(0.0, 0.0, 0.0);
  c_9.w = tmpvar_3;
  c_8.w = c_9.w;
  c_8.xyz = (tmpvar_2 * tmpvar_5);
  gl_FragData[0] = c_8;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
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
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_3 = (tmpvar_5.xyz * tmpvar_2.xyz);
  tmpvar_4 = (tmpvar_5.w * tmpvar_2.w);
  mediump vec3 normalWorld_6;
  normalWorld_6 = tmpvar_1;
  mediump vec3 tmpvar_7;
  mediump vec3 ambient_8;
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalWorld_6;
  mediump vec3 x_10;
  x_10.x = dot (unity_SHAr, tmpvar_9);
  x_10.y = dot (unity_SHAg, tmpvar_9);
  x_10.z = dot (unity_SHAb, tmpvar_9);
  mediump vec3 x1_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = (normalWorld_6.xyzz * normalWorld_6.yzzx);
  x1_11.x = dot (unity_SHBr, tmpvar_12);
  x1_11.y = dot (unity_SHBg, tmpvar_12);
  x1_11.z = dot (unity_SHBb, tmpvar_12);
  ambient_8 = max (vec3(0.0, 0.0, 0.0), (x_10 + (x1_11 + 
    (unity_SHC.xyz * ((normalWorld_6.x * normalWorld_6.x) - (normalWorld_6.y * normalWorld_6.y)))
  )));
  mediump vec3 tmpvar_13;
  tmpvar_13 = max (((1.055 * 
    pow (max (ambient_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_8 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_15;
  color_15 = tmpvar_14;
  tmpvar_7 = (tmpvar_13 + (unity_Lightmap_HDR.x * color_15.xyz));
  lowp vec4 c_16;
  lowp vec4 c_17;
  c_17.xyz = vec3(0.0, 0.0, 0.0);
  c_17.w = tmpvar_4;
  c_16.w = c_17.w;
  c_16.xyz = (tmpvar_3 * tmpvar_7);
  gl_FragData[0] = c_16;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
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
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_3 = (tmpvar_5.xyz * tmpvar_2.xyz);
  tmpvar_4 = (tmpvar_5.w * tmpvar_2.w);
  mediump vec3 normalWorld_6;
  normalWorld_6 = tmpvar_1;
  mediump vec3 tmpvar_7;
  mediump vec3 ambient_8;
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalWorld_6;
  mediump vec3 x_10;
  x_10.x = dot (unity_SHAr, tmpvar_9);
  x_10.y = dot (unity_SHAg, tmpvar_9);
  x_10.z = dot (unity_SHAb, tmpvar_9);
  mediump vec3 x1_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = (normalWorld_6.xyzz * normalWorld_6.yzzx);
  x1_11.x = dot (unity_SHBr, tmpvar_12);
  x1_11.y = dot (unity_SHBg, tmpvar_12);
  x1_11.z = dot (unity_SHBb, tmpvar_12);
  ambient_8 = max (vec3(0.0, 0.0, 0.0), (x_10 + (x1_11 + 
    (unity_SHC.xyz * ((normalWorld_6.x * normalWorld_6.x) - (normalWorld_6.y * normalWorld_6.y)))
  )));
  mediump vec3 tmpvar_13;
  tmpvar_13 = max (((1.055 * 
    pow (max (ambient_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_8 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_15;
  color_15 = tmpvar_14;
  tmpvar_7 = (tmpvar_13 + (unity_Lightmap_HDR.x * color_15.xyz));
  lowp vec4 c_16;
  lowp vec4 c_17;
  c_17.xyz = vec3(0.0, 0.0, 0.0);
  c_17.w = tmpvar_4;
  c_16.w = c_17.w;
  c_16.xyz = (tmpvar_3 * tmpvar_7);
  gl_FragData[0] = c_16;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
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
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_3 = (tmpvar_5.xyz * tmpvar_2.xyz);
  tmpvar_4 = (tmpvar_5.w * tmpvar_2.w);
  mediump vec3 normalWorld_6;
  normalWorld_6 = tmpvar_1;
  mediump vec3 tmpvar_7;
  mediump vec3 ambient_8;
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalWorld_6;
  mediump vec3 x_10;
  x_10.x = dot (unity_SHAr, tmpvar_9);
  x_10.y = dot (unity_SHAg, tmpvar_9);
  x_10.z = dot (unity_SHAb, tmpvar_9);
  mediump vec3 x1_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = (normalWorld_6.xyzz * normalWorld_6.yzzx);
  x1_11.x = dot (unity_SHBr, tmpvar_12);
  x1_11.y = dot (unity_SHBg, tmpvar_12);
  x1_11.z = dot (unity_SHBb, tmpvar_12);
  ambient_8 = max (vec3(0.0, 0.0, 0.0), (x_10 + (x1_11 + 
    (unity_SHC.xyz * ((normalWorld_6.x * normalWorld_6.x) - (normalWorld_6.y * normalWorld_6.y)))
  )));
  mediump vec3 tmpvar_13;
  tmpvar_13 = max (((1.055 * 
    pow (max (ambient_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_8 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_15;
  color_15 = tmpvar_14;
  tmpvar_7 = (tmpvar_13 + (unity_Lightmap_HDR.x * color_15.xyz));
  lowp vec4 c_16;
  lowp vec4 c_17;
  c_17.xyz = vec3(0.0, 0.0, 0.0);
  c_17.w = tmpvar_4;
  c_16.w = c_17.w;
  c_16.xyz = (tmpvar_3 * tmpvar_7);
  gl_FragData[0] = c_16;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ambient_21;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7 * tmpvar_1) * diff_12);
  c_11.w = tmpvar_8;
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_7 * xlv_TEXCOORD3));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ambient_21;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7 * tmpvar_1) * diff_12);
  c_11.w = tmpvar_8;
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_7 * xlv_TEXCOORD3));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ambient_21;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7 * tmpvar_1) * diff_12);
  c_11.w = tmpvar_8;
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_7 * xlv_TEXCOORD3));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8 * tmpvar_1) * diff_13);
  c_12.w = tmpvar_9;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  c_3.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_12.xyz, vec3(tmpvar_15));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8 * tmpvar_1) * diff_13);
  c_12.w = tmpvar_9;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  c_3.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_12.xyz, vec3(tmpvar_15));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8 * tmpvar_1) * diff_13);
  c_12.w = tmpvar_9;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  c_3.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_12.xyz, vec3(tmpvar_15));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8 * tmpvar_1) * diff_13);
  c_12.w = tmpvar_9;
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_8 * xlv_TEXCOORD3));
  c_3.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_15));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8 * tmpvar_1) * diff_13);
  c_12.w = tmpvar_9;
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_8 * xlv_TEXCOORD3));
  c_3.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_15));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
  xlv_TEXCOORD4 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8 * tmpvar_1) * diff_13);
  c_12.w = tmpvar_9;
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_8 * xlv_TEXCOORD3));
  c_3.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_15));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 tmpvar_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  tmpvar_11 = (unity_Lightmap_HDR.x * color_13.xyz);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_8 * tmpvar_1) * diff_16);
  c_15.w = tmpvar_9;
  c_14.w = c_15.w;
  c_14.xyz = (c_15.xyz + (tmpvar_8 * tmpvar_11));
  c_3.w = c_14.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_14.xyz, vec3(tmpvar_18));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 tmpvar_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  tmpvar_11 = (unity_Lightmap_HDR.x * color_13.xyz);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_8 * tmpvar_1) * diff_16);
  c_15.w = tmpvar_9;
  c_14.w = c_15.w;
  c_14.xyz = (c_15.xyz + (tmpvar_8 * tmpvar_11));
  c_3.w = c_14.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_14.xyz, vec3(tmpvar_18));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 tmpvar_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  tmpvar_11 = (unity_Lightmap_HDR.x * color_13.xyz);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_8 * tmpvar_1) * diff_16);
  c_15.w = tmpvar_9;
  c_14.w = c_15.w;
  c_14.xyz = (c_15.xyz + (tmpvar_8 * tmpvar_11));
  c_3.w = c_14.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_14.xyz, vec3(tmpvar_18));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
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
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_11;
  normalWorld_11 = tmpvar_4;
  mediump vec3 tmpvar_12;
  mediump vec3 ambient_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = normalWorld_11;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 x1_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normalWorld_11.xyzz * normalWorld_11.yzzx);
  x1_16.x = dot (unity_SHBr, tmpvar_17);
  x1_16.y = dot (unity_SHBg, tmpvar_17);
  x1_16.z = dot (unity_SHBb, tmpvar_17);
  ambient_13 = max (vec3(0.0, 0.0, 0.0), (x_15 + (x1_16 + 
    (unity_SHC.xyz * ((normalWorld_11.x * normalWorld_11.x) - (normalWorld_11.y * normalWorld_11.y)))
  )));
  mediump vec3 tmpvar_18;
  tmpvar_18 = max (((1.055 * 
    pow (max (ambient_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_13 = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_20;
  color_20 = tmpvar_19;
  tmpvar_12 = (tmpvar_18 + (unity_Lightmap_HDR.x * color_20.xyz));
  lowp vec4 c_21;
  lowp vec4 c_22;
  lowp float diff_23;
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_23 = tmpvar_24;
  c_22.xyz = ((tmpvar_8 * tmpvar_1) * diff_23);
  c_22.w = tmpvar_9;
  c_21.w = c_22.w;
  c_21.xyz = (c_22.xyz + (tmpvar_8 * tmpvar_12));
  c_3.w = c_21.w;
  highp float tmpvar_25;
  tmpvar_25 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_21.xyz, vec3(tmpvar_25));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
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
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_11;
  normalWorld_11 = tmpvar_4;
  mediump vec3 tmpvar_12;
  mediump vec3 ambient_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = normalWorld_11;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 x1_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normalWorld_11.xyzz * normalWorld_11.yzzx);
  x1_16.x = dot (unity_SHBr, tmpvar_17);
  x1_16.y = dot (unity_SHBg, tmpvar_17);
  x1_16.z = dot (unity_SHBb, tmpvar_17);
  ambient_13 = max (vec3(0.0, 0.0, 0.0), (x_15 + (x1_16 + 
    (unity_SHC.xyz * ((normalWorld_11.x * normalWorld_11.x) - (normalWorld_11.y * normalWorld_11.y)))
  )));
  mediump vec3 tmpvar_18;
  tmpvar_18 = max (((1.055 * 
    pow (max (ambient_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_13 = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_20;
  color_20 = tmpvar_19;
  tmpvar_12 = (tmpvar_18 + (unity_Lightmap_HDR.x * color_20.xyz));
  lowp vec4 c_21;
  lowp vec4 c_22;
  lowp float diff_23;
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_23 = tmpvar_24;
  c_22.xyz = ((tmpvar_8 * tmpvar_1) * diff_23);
  c_22.w = tmpvar_9;
  c_21.w = c_22.w;
  c_21.xyz = (c_22.xyz + (tmpvar_8 * tmpvar_12));
  c_3.w = c_21.w;
  highp float tmpvar_25;
  tmpvar_25 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_21.xyz, vec3(tmpvar_25));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
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
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_11;
  normalWorld_11 = tmpvar_4;
  mediump vec3 tmpvar_12;
  mediump vec3 ambient_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = normalWorld_11;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 x1_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normalWorld_11.xyzz * normalWorld_11.yzzx);
  x1_16.x = dot (unity_SHBr, tmpvar_17);
  x1_16.y = dot (unity_SHBg, tmpvar_17);
  x1_16.z = dot (unity_SHBb, tmpvar_17);
  ambient_13 = max (vec3(0.0, 0.0, 0.0), (x_15 + (x1_16 + 
    (unity_SHC.xyz * ((normalWorld_11.x * normalWorld_11.x) - (normalWorld_11.y * normalWorld_11.y)))
  )));
  mediump vec3 tmpvar_18;
  tmpvar_18 = max (((1.055 * 
    pow (max (ambient_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_13 = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_20;
  color_20 = tmpvar_19;
  tmpvar_12 = (tmpvar_18 + (unity_Lightmap_HDR.x * color_20.xyz));
  lowp vec4 c_21;
  lowp vec4 c_22;
  lowp float diff_23;
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_23 = tmpvar_24;
  c_22.xyz = ((tmpvar_8 * tmpvar_1) * diff_23);
  c_22.w = tmpvar_9;
  c_21.w = c_22.w;
  c_21.xyz = (c_22.xyz + (tmpvar_8 * tmpvar_12));
  c_3.w = c_21.w;
  highp float tmpvar_25;
  tmpvar_25 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_21.xyz, vec3(tmpvar_25));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
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
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_3 = (tmpvar_5.xyz * tmpvar_2.xyz);
  tmpvar_4 = (tmpvar_5.w * tmpvar_2.w);
  mediump vec3 tmpvar_6;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  tmpvar_6 = (unity_Lightmap_HDR.x * color_8.xyz);
  lowp vec4 c_9;
  lowp vec4 c_10;
  c_10.xyz = vec3(0.0, 0.0, 0.0);
  c_10.w = tmpvar_4;
  c_9.w = c_10.w;
  c_9.xyz = (tmpvar_3 * tmpvar_6);
  c_1.w = c_9.w;
  highp float tmpvar_11;
  tmpvar_11 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_9.xyz, vec3(tmpvar_11));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
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
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_3 = (tmpvar_5.xyz * tmpvar_2.xyz);
  tmpvar_4 = (tmpvar_5.w * tmpvar_2.w);
  mediump vec3 tmpvar_6;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  tmpvar_6 = (unity_Lightmap_HDR.x * color_8.xyz);
  lowp vec4 c_9;
  lowp vec4 c_10;
  c_10.xyz = vec3(0.0, 0.0, 0.0);
  c_10.w = tmpvar_4;
  c_9.w = c_10.w;
  c_9.xyz = (tmpvar_3 * tmpvar_6);
  c_1.w = c_9.w;
  highp float tmpvar_11;
  tmpvar_11 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_9.xyz, vec3(tmpvar_11));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
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
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_3 = (tmpvar_5.xyz * tmpvar_2.xyz);
  tmpvar_4 = (tmpvar_5.w * tmpvar_2.w);
  mediump vec3 tmpvar_6;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  tmpvar_6 = (unity_Lightmap_HDR.x * color_8.xyz);
  lowp vec4 c_9;
  lowp vec4 c_10;
  c_10.xyz = vec3(0.0, 0.0, 0.0);
  c_10.w = tmpvar_4;
  c_9.w = c_10.w;
  c_9.xyz = (tmpvar_3 * tmpvar_6);
  c_1.w = c_9.w;
  highp float tmpvar_11;
  tmpvar_11 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_9.xyz, vec3(tmpvar_11));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
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
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = xlv_COLOR0;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_4 = (tmpvar_6.xyz * tmpvar_3.xyz);
  tmpvar_5 = (tmpvar_6.w * tmpvar_3.w);
  mediump vec3 normalWorld_7;
  normalWorld_7 = tmpvar_2;
  mediump vec3 tmpvar_8;
  mediump vec3 ambient_9;
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = normalWorld_7;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, tmpvar_10);
  x_11.y = dot (unity_SHAg, tmpvar_10);
  x_11.z = dot (unity_SHAb, tmpvar_10);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normalWorld_7.xyzz * normalWorld_7.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  ambient_9 = max (vec3(0.0, 0.0, 0.0), (x_11 + (x1_12 + 
    (unity_SHC.xyz * ((normalWorld_7.x * normalWorld_7.x) - (normalWorld_7.y * normalWorld_7.y)))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (ambient_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_9 = tmpvar_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_16;
  color_16 = tmpvar_15;
  tmpvar_8 = (tmpvar_14 + (unity_Lightmap_HDR.x * color_16.xyz));
  lowp vec4 c_17;
  lowp vec4 c_18;
  c_18.xyz = vec3(0.0, 0.0, 0.0);
  c_18.w = tmpvar_5;
  c_17.w = c_18.w;
  c_17.xyz = (tmpvar_4 * tmpvar_8);
  c_1.w = c_17.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_17.xyz, vec3(tmpvar_19));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
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
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = xlv_COLOR0;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_4 = (tmpvar_6.xyz * tmpvar_3.xyz);
  tmpvar_5 = (tmpvar_6.w * tmpvar_3.w);
  mediump vec3 normalWorld_7;
  normalWorld_7 = tmpvar_2;
  mediump vec3 tmpvar_8;
  mediump vec3 ambient_9;
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = normalWorld_7;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, tmpvar_10);
  x_11.y = dot (unity_SHAg, tmpvar_10);
  x_11.z = dot (unity_SHAb, tmpvar_10);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normalWorld_7.xyzz * normalWorld_7.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  ambient_9 = max (vec3(0.0, 0.0, 0.0), (x_11 + (x1_12 + 
    (unity_SHC.xyz * ((normalWorld_7.x * normalWorld_7.x) - (normalWorld_7.y * normalWorld_7.y)))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (ambient_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_9 = tmpvar_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_16;
  color_16 = tmpvar_15;
  tmpvar_8 = (tmpvar_14 + (unity_Lightmap_HDR.x * color_16.xyz));
  lowp vec4 c_17;
  lowp vec4 c_18;
  c_18.xyz = vec3(0.0, 0.0, 0.0);
  c_18.w = tmpvar_5;
  c_17.w = c_18.w;
  c_17.xyz = (tmpvar_4 * tmpvar_8);
  c_1.w = c_17.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_17.xyz, vec3(tmpvar_19));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
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
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = xlv_COLOR0;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_4 = (tmpvar_6.xyz * tmpvar_3.xyz);
  tmpvar_5 = (tmpvar_6.w * tmpvar_3.w);
  mediump vec3 normalWorld_7;
  normalWorld_7 = tmpvar_2;
  mediump vec3 tmpvar_8;
  mediump vec3 ambient_9;
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = normalWorld_7;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, tmpvar_10);
  x_11.y = dot (unity_SHAg, tmpvar_10);
  x_11.z = dot (unity_SHAb, tmpvar_10);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normalWorld_7.xyzz * normalWorld_7.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  ambient_9 = max (vec3(0.0, 0.0, 0.0), (x_11 + (x1_12 + 
    (unity_SHC.xyz * ((normalWorld_7.x * normalWorld_7.x) - (normalWorld_7.y * normalWorld_7.y)))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (ambient_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_9 = tmpvar_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_16;
  color_16 = tmpvar_15;
  tmpvar_8 = (tmpvar_14 + (unity_Lightmap_HDR.x * color_16.xyz));
  lowp vec4 c_17;
  lowp vec4 c_18;
  c_18.xyz = vec3(0.0, 0.0, 0.0);
  c_18.w = tmpvar_5;
  c_17.w = c_18.w;
  c_17.xyz = (tmpvar_4 * tmpvar_8);
  c_1.w = c_17.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_17.xyz, vec3(tmpvar_19));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ambient_22;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8 * tmpvar_1) * diff_13);
  c_12.w = tmpvar_9;
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_8 * xlv_TEXCOORD3));
  c_3.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_15));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ambient_22;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8 * tmpvar_1) * diff_13);
  c_12.w = tmpvar_9;
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_8 * xlv_TEXCOORD3));
  c_3.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_15));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ambient_22;
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8 * tmpvar_1) * diff_13);
  c_12.w = tmpvar_9;
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_8 * xlv_TEXCOORD3));
  c_3.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_15));
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Offset -1, -1
  GpuProgramID 126188
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec3 lightCoord_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  highp vec4 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_6 = tmpvar_8;
  tmpvar_7 = xlv_COLOR0;
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_9 = (tmpvar_11.xyz * tmpvar_7.xyz);
  tmpvar_10 = (tmpvar_11.w * tmpvar_7.w);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_12).xyz;
  highp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, vec2(dot (lightCoord_4, lightCoord_4))).w;
  atten_3 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9 * tmpvar_1) * diff_16);
  c_15.w = tmpvar_10;
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  gl_FragData[0] = c_14;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec3 lightCoord_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  highp vec4 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_6 = tmpvar_8;
  tmpvar_7 = xlv_COLOR0;
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_9 = (tmpvar_11.xyz * tmpvar_7.xyz);
  tmpvar_10 = (tmpvar_11.w * tmpvar_7.w);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_12).xyz;
  highp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, vec2(dot (lightCoord_4, lightCoord_4))).w;
  atten_3 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9 * tmpvar_1) * diff_16);
  c_15.w = tmpvar_10;
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  gl_FragData[0] = c_14;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec3 lightCoord_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  highp vec4 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_6 = tmpvar_8;
  tmpvar_7 = xlv_COLOR0;
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_9 = (tmpvar_11.xyz * tmpvar_7.xyz);
  tmpvar_10 = (tmpvar_11.w * tmpvar_7.w);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_12).xyz;
  highp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, vec2(dot (lightCoord_4, lightCoord_4))).w;
  atten_3 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9 * tmpvar_1) * diff_16);
  c_15.w = tmpvar_10;
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  gl_FragData[0] = c_14;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7 * tmpvar_1) * diff_12);
  c_11.w = tmpvar_8;
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7 * tmpvar_1) * diff_12);
  c_11.w = tmpvar_8;
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec4 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  tmpvar_5 = xlv_COLOR0;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_7 = (tmpvar_9.xyz * tmpvar_5.xyz);
  tmpvar_8 = (tmpvar_9.w * tmpvar_5.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7 * tmpvar_1) * diff_12);
  c_11.w = tmpvar_8;
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec4 lightCoord_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  highp vec4 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_6 = tmpvar_8;
  tmpvar_7 = xlv_COLOR0;
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_9 = (tmpvar_11.xyz * tmpvar_7.xyz);
  tmpvar_10 = (tmpvar_11.w * tmpvar_7.w);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_12);
  lowp float tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTexture0, ((lightCoord_4.xy / lightCoord_4.w) + 0.5));
  tmpvar_13 = tmpvar_14.w;
  lowp float tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_LightTextureB0, vec2(dot (lightCoord_4.xyz, lightCoord_4.xyz)));
  tmpvar_15 = tmpvar_16.w;
  highp float tmpvar_17;
  tmpvar_17 = ((float(
    (lightCoord_4.z > 0.0)
  ) * tmpvar_13) * tmpvar_15);
  atten_3 = tmpvar_17;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_18;
  lowp vec4 c_19;
  lowp float diff_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_20 = tmpvar_21;
  c_19.xyz = ((tmpvar_9 * tmpvar_1) * diff_20);
  c_19.w = tmpvar_10;
  c_18.w = c_19.w;
  c_18.xyz = c_19.xyz;
  gl_FragData[0] = c_18;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec4 lightCoord_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  highp vec4 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_6 = tmpvar_8;
  tmpvar_7 = xlv_COLOR0;
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_9 = (tmpvar_11.xyz * tmpvar_7.xyz);
  tmpvar_10 = (tmpvar_11.w * tmpvar_7.w);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_12);
  lowp float tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTexture0, ((lightCoord_4.xy / lightCoord_4.w) + 0.5));
  tmpvar_13 = tmpvar_14.w;
  lowp float tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_LightTextureB0, vec2(dot (lightCoord_4.xyz, lightCoord_4.xyz)));
  tmpvar_15 = tmpvar_16.w;
  highp float tmpvar_17;
  tmpvar_17 = ((float(
    (lightCoord_4.z > 0.0)
  ) * tmpvar_13) * tmpvar_15);
  atten_3 = tmpvar_17;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_18;
  lowp vec4 c_19;
  lowp float diff_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_20 = tmpvar_21;
  c_19.xyz = ((tmpvar_9 * tmpvar_1) * diff_20);
  c_19.w = tmpvar_10;
  c_18.w = c_19.w;
  c_18.xyz = c_19.xyz;
  gl_FragData[0] = c_18;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec4 lightCoord_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  highp vec4 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_6 = tmpvar_8;
  tmpvar_7 = xlv_COLOR0;
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_9 = (tmpvar_11.xyz * tmpvar_7.xyz);
  tmpvar_10 = (tmpvar_11.w * tmpvar_7.w);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_12);
  lowp float tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTexture0, ((lightCoord_4.xy / lightCoord_4.w) + 0.5));
  tmpvar_13 = tmpvar_14.w;
  lowp float tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_LightTextureB0, vec2(dot (lightCoord_4.xyz, lightCoord_4.xyz)));
  tmpvar_15 = tmpvar_16.w;
  highp float tmpvar_17;
  tmpvar_17 = ((float(
    (lightCoord_4.z > 0.0)
  ) * tmpvar_13) * tmpvar_15);
  atten_3 = tmpvar_17;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_18;
  lowp vec4 c_19;
  lowp float diff_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_20 = tmpvar_21;
  c_19.xyz = ((tmpvar_9 * tmpvar_1) * diff_20);
  c_19.w = tmpvar_10;
  c_18.w = c_19.w;
  c_18.xyz = c_19.xyz;
  gl_FragData[0] = c_18;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec3 lightCoord_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  highp vec4 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_6 = tmpvar_8;
  tmpvar_7 = xlv_COLOR0;
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_9 = (tmpvar_11.xyz * tmpvar_7.xyz);
  tmpvar_10 = (tmpvar_11.w * tmpvar_7.w);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_12).xyz;
  highp float tmpvar_13;
  tmpvar_13 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_4, lightCoord_4))).w * textureCube (_LightTexture0, lightCoord_4).w);
  atten_3 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9 * tmpvar_1) * diff_16);
  c_15.w = tmpvar_10;
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  gl_FragData[0] = c_14;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec3 lightCoord_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  highp vec4 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_6 = tmpvar_8;
  tmpvar_7 = xlv_COLOR0;
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_9 = (tmpvar_11.xyz * tmpvar_7.xyz);
  tmpvar_10 = (tmpvar_11.w * tmpvar_7.w);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_12).xyz;
  highp float tmpvar_13;
  tmpvar_13 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_4, lightCoord_4))).w * textureCube (_LightTexture0, lightCoord_4).w);
  atten_3 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9 * tmpvar_1) * diff_16);
  c_15.w = tmpvar_10;
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  gl_FragData[0] = c_14;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  highp vec3 lightCoord_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  highp vec4 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_6 = tmpvar_8;
  tmpvar_7 = xlv_COLOR0;
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_9 = (tmpvar_11.xyz * tmpvar_7.xyz);
  tmpvar_10 = (tmpvar_11.w * tmpvar_7.w);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD2;
  lightCoord_4 = (unity_WorldToLight * tmpvar_12).xyz;
  highp float tmpvar_13;
  tmpvar_13 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_4, lightCoord_4))).w * textureCube (_LightTexture0, lightCoord_4).w);
  atten_3 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9 * tmpvar_1) * diff_16);
  c_15.w = tmpvar_10;
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  gl_FragData[0] = c_14;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD2;
  highp float tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_11).xy).w;
  atten_3 = tmpvar_12;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_13;
  lowp vec4 c_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_15 = tmpvar_16;
  c_14.xyz = ((tmpvar_8 * tmpvar_1) * diff_15);
  c_14.w = tmpvar_9;
  c_13.w = c_14.w;
  c_13.xyz = c_14.xyz;
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD2;
  highp float tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_11).xy).w;
  atten_3 = tmpvar_12;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_13;
  lowp vec4 c_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_15 = tmpvar_16;
  c_14.xyz = ((tmpvar_8 * tmpvar_1) * diff_15);
  c_14.w = tmpvar_9;
  c_13.w = c_14.w;
  c_13.xyz = c_14.xyz;
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD2;
  highp float tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_11).xy).w;
  atten_3 = tmpvar_12;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_13;
  lowp vec4 c_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_15 = tmpvar_16;
  c_14.xyz = ((tmpvar_8 * tmpvar_1) * diff_15);
  c_14.w = tmpvar_9;
  c_13.w = c_14.w;
  c_13.xyz = c_14.xyz;
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec4 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_9;
  tmpvar_8 = xlv_COLOR0;
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_10;
  lowp float tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_10 = (tmpvar_12.xyz * tmpvar_8.xyz);
  tmpvar_11 = (tmpvar_12.w * tmpvar_8.w);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_13).xyz;
  highp float tmpvar_14;
  tmpvar_14 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_10 * tmpvar_1) * diff_17);
  c_16.w = tmpvar_11;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  c_3.w = c_15.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_16.xyz * vec3(tmpvar_19));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec4 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_9;
  tmpvar_8 = xlv_COLOR0;
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_10;
  lowp float tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_10 = (tmpvar_12.xyz * tmpvar_8.xyz);
  tmpvar_11 = (tmpvar_12.w * tmpvar_8.w);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_13).xyz;
  highp float tmpvar_14;
  tmpvar_14 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_10 * tmpvar_1) * diff_17);
  c_16.w = tmpvar_11;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  c_3.w = c_15.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_16.xyz * vec3(tmpvar_19));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec4 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_9;
  tmpvar_8 = xlv_COLOR0;
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_10;
  lowp float tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_10 = (tmpvar_12.xyz * tmpvar_8.xyz);
  tmpvar_11 = (tmpvar_12.w * tmpvar_8.w);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_13).xyz;
  highp float tmpvar_14;
  tmpvar_14 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_10 * tmpvar_1) * diff_17);
  c_16.w = tmpvar_11;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  c_3.w = c_15.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_16.xyz * vec3(tmpvar_19));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8 * tmpvar_1) * diff_13);
  c_12.w = tmpvar_9;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  c_3.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_12.xyz * vec3(tmpvar_15));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8 * tmpvar_1) * diff_13);
  c_12.w = tmpvar_9;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  c_3.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_12.xyz * vec3(tmpvar_15));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  tmpvar_6 = xlv_COLOR0;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_8 = (tmpvar_10.xyz * tmpvar_6.xyz);
  tmpvar_9 = (tmpvar_10.w * tmpvar_6.w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8 * tmpvar_1) * diff_13);
  c_12.w = tmpvar_9;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  c_3.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_12.xyz * vec3(tmpvar_15));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec4 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_9;
  tmpvar_8 = xlv_COLOR0;
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_10;
  lowp float tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_10 = (tmpvar_12.xyz * tmpvar_8.xyz);
  tmpvar_11 = (tmpvar_12.w * tmpvar_8.w);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_13);
  lowp float tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_LightTexture0, ((lightCoord_5.xy / lightCoord_5.w) + 0.5));
  tmpvar_14 = tmpvar_15.w;
  lowp float tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_LightTextureB0, vec2(dot (lightCoord_5.xyz, lightCoord_5.xyz)));
  tmpvar_16 = tmpvar_17.w;
  highp float tmpvar_18;
  tmpvar_18 = ((float(
    (lightCoord_5.z > 0.0)
  ) * tmpvar_14) * tmpvar_16);
  atten_4 = tmpvar_18;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_19;
  lowp vec4 c_20;
  lowp float diff_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_21 = tmpvar_22;
  c_20.xyz = ((tmpvar_10 * tmpvar_1) * diff_21);
  c_20.w = tmpvar_11;
  c_19.w = c_20.w;
  c_19.xyz = c_20.xyz;
  c_3.w = c_19.w;
  highp float tmpvar_23;
  tmpvar_23 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_20.xyz * vec3(tmpvar_23));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec4 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_9;
  tmpvar_8 = xlv_COLOR0;
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_10;
  lowp float tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_10 = (tmpvar_12.xyz * tmpvar_8.xyz);
  tmpvar_11 = (tmpvar_12.w * tmpvar_8.w);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_13);
  lowp float tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_LightTexture0, ((lightCoord_5.xy / lightCoord_5.w) + 0.5));
  tmpvar_14 = tmpvar_15.w;
  lowp float tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_LightTextureB0, vec2(dot (lightCoord_5.xyz, lightCoord_5.xyz)));
  tmpvar_16 = tmpvar_17.w;
  highp float tmpvar_18;
  tmpvar_18 = ((float(
    (lightCoord_5.z > 0.0)
  ) * tmpvar_14) * tmpvar_16);
  atten_4 = tmpvar_18;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_19;
  lowp vec4 c_20;
  lowp float diff_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_21 = tmpvar_22;
  c_20.xyz = ((tmpvar_10 * tmpvar_1) * diff_21);
  c_20.w = tmpvar_11;
  c_19.w = c_20.w;
  c_19.xyz = c_20.xyz;
  c_3.w = c_19.w;
  highp float tmpvar_23;
  tmpvar_23 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_20.xyz * vec3(tmpvar_23));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec4 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_9;
  tmpvar_8 = xlv_COLOR0;
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_10;
  lowp float tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_10 = (tmpvar_12.xyz * tmpvar_8.xyz);
  tmpvar_11 = (tmpvar_12.w * tmpvar_8.w);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_13);
  lowp float tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_LightTexture0, ((lightCoord_5.xy / lightCoord_5.w) + 0.5));
  tmpvar_14 = tmpvar_15.w;
  lowp float tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_LightTextureB0, vec2(dot (lightCoord_5.xyz, lightCoord_5.xyz)));
  tmpvar_16 = tmpvar_17.w;
  highp float tmpvar_18;
  tmpvar_18 = ((float(
    (lightCoord_5.z > 0.0)
  ) * tmpvar_14) * tmpvar_16);
  atten_4 = tmpvar_18;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_19;
  lowp vec4 c_20;
  lowp float diff_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_21 = tmpvar_22;
  c_20.xyz = ((tmpvar_10 * tmpvar_1) * diff_21);
  c_20.w = tmpvar_11;
  c_19.w = c_20.w;
  c_19.xyz = c_20.xyz;
  c_3.w = c_19.w;
  highp float tmpvar_23;
  tmpvar_23 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_20.xyz * vec3(tmpvar_23));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec4 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_9;
  tmpvar_8 = xlv_COLOR0;
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_10;
  lowp float tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_10 = (tmpvar_12.xyz * tmpvar_8.xyz);
  tmpvar_11 = (tmpvar_12.w * tmpvar_8.w);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_13).xyz;
  highp float tmpvar_14;
  tmpvar_14 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_10 * tmpvar_1) * diff_17);
  c_16.w = tmpvar_11;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  c_3.w = c_15.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_16.xyz * vec3(tmpvar_19));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec4 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_9;
  tmpvar_8 = xlv_COLOR0;
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_10;
  lowp float tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_10 = (tmpvar_12.xyz * tmpvar_8.xyz);
  tmpvar_11 = (tmpvar_12.w * tmpvar_8.w);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_13).xyz;
  highp float tmpvar_14;
  tmpvar_14 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_10 * tmpvar_1) * diff_17);
  c_16.w = tmpvar_11;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  c_3.w = c_15.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_16.xyz * vec3(tmpvar_19));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec4 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_7 = tmpvar_9;
  tmpvar_8 = xlv_COLOR0;
  tmpvar_6 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_10;
  lowp float tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_10 = (tmpvar_12.xyz * tmpvar_8.xyz);
  tmpvar_11 = (tmpvar_12.w * tmpvar_8.w);
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = xlv_TEXCOORD2;
  lightCoord_5 = (unity_WorldToLight * tmpvar_13).xyz;
  highp float tmpvar_14;
  tmpvar_14 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_10 * tmpvar_1) * diff_17);
  c_16.w = tmpvar_11;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  c_3.w = c_15.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_16.xyz * vec3(tmpvar_19));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  highp vec4 tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_8;
  tmpvar_7 = xlv_COLOR0;
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_9 = (tmpvar_11.xyz * tmpvar_7.xyz);
  tmpvar_10 = (tmpvar_11.w * tmpvar_7.w);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD2;
  highp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_12).xy).w;
  atten_4 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9 * tmpvar_1) * diff_16);
  c_15.w = tmpvar_10;
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  c_3.w = c_14.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_15.xyz * vec3(tmpvar_18));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  highp vec4 tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_8;
  tmpvar_7 = xlv_COLOR0;
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_9 = (tmpvar_11.xyz * tmpvar_7.xyz);
  tmpvar_10 = (tmpvar_11.w * tmpvar_7.w);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD2;
  highp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_12).xy).w;
  atten_4 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9 * tmpvar_1) * diff_16);
  c_15.w = tmpvar_10;
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  c_3.w = c_14.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_15.xyz * vec3(tmpvar_18));
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
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
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
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR0;
varying highp float xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  highp vec4 tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_8;
  tmpvar_7 = xlv_COLOR0;
  tmpvar_5 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_9 = (tmpvar_11.xyz * tmpvar_7.xyz);
  tmpvar_10 = (tmpvar_11.w * tmpvar_7.w);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD2;
  highp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_12).xy).w;
  atten_4 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9 * tmpvar_1) * diff_16);
  c_15.w = tmpvar_10;
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  c_3.w = c_14.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_3.xyz = (c_15.xyz * vec3(tmpvar_18));
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  Offset -1, -1
  GpuProgramID 179116
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec4 vertex_2;
  vertex_2 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_3;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_3 = 0.0001;
    } else {
      tmpvar_3 = 0.0;
    };
    vertex_2.z = tmpvar_3;
  };
  if (unity_MetaVertexControl.y) {
    vertex_2.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_4;
    if ((vertex_2.z > 0.0)) {
      tmpvar_4 = 0.0001;
    } else {
      tmpvar_4 = 0.0;
    };
    vertex_2.z = tmpvar_4;
  };
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = vertex_2.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_COLOR0 = tmpvar_1;
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
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = xlv_COLOR0;
  lowp vec3 tmpvar_4;
  tmpvar_4 = ((texture2D (_MainTex, xlv_TEXCOORD0) * _Color).xyz * tmpvar_3.xyz);
  tmpvar_2 = tmpvar_4;
  mediump vec4 res_5;
  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_6;
    tmpvar_6.w = 1.0;
    tmpvar_6.xyz = tmpvar_2;
    res_5.w = tmpvar_6.w;
    highp vec3 tmpvar_7;
    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_5.xyz = tmpvar_7;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_8;
    if (bool(unity_UseLinearSpace)) {
      emission_8 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_8 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_9;
    tmpvar_9.w = 1.0;
    tmpvar_9.xyz = emission_8;
    res_5 = tmpvar_9;
  };
  tmpvar_1 = res_5;
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
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec4 vertex_2;
  vertex_2 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_3;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_3 = 0.0001;
    } else {
      tmpvar_3 = 0.0;
    };
    vertex_2.z = tmpvar_3;
  };
  if (unity_MetaVertexControl.y) {
    vertex_2.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_4;
    if ((vertex_2.z > 0.0)) {
      tmpvar_4 = 0.0001;
    } else {
      tmpvar_4 = 0.0;
    };
    vertex_2.z = tmpvar_4;
  };
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = vertex_2.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_COLOR0 = tmpvar_1;
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
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = xlv_COLOR0;
  lowp vec3 tmpvar_4;
  tmpvar_4 = ((texture2D (_MainTex, xlv_TEXCOORD0) * _Color).xyz * tmpvar_3.xyz);
  tmpvar_2 = tmpvar_4;
  mediump vec4 res_5;
  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_6;
    tmpvar_6.w = 1.0;
    tmpvar_6.xyz = tmpvar_2;
    res_5.w = tmpvar_6.w;
    highp vec3 tmpvar_7;
    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_5.xyz = tmpvar_7;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_8;
    if (bool(unity_UseLinearSpace)) {
      emission_8 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_8 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_9;
    tmpvar_9.w = 1.0;
    tmpvar_9.xyz = emission_8;
    res_5 = tmpvar_9;
  };
  tmpvar_1 = res_5;
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
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec4 vertex_2;
  vertex_2 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_3;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_3 = 0.0001;
    } else {
      tmpvar_3 = 0.0;
    };
    vertex_2.z = tmpvar_3;
  };
  if (unity_MetaVertexControl.y) {
    vertex_2.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_4;
    if ((vertex_2.z > 0.0)) {
      tmpvar_4 = 0.0001;
    } else {
      tmpvar_4 = 0.0;
    };
    vertex_2.z = tmpvar_4;
  };
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = vertex_2.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_COLOR0 = tmpvar_1;
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
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = xlv_COLOR0;
  lowp vec3 tmpvar_4;
  tmpvar_4 = ((texture2D (_MainTex, xlv_TEXCOORD0) * _Color).xyz * tmpvar_3.xyz);
  tmpvar_2 = tmpvar_4;
  mediump vec4 res_5;
  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_6;
    tmpvar_6.w = 1.0;
    tmpvar_6.xyz = tmpvar_2;
    res_5.w = tmpvar_6.w;
    highp vec3 tmpvar_7;
    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_5.xyz = tmpvar_7;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_8;
    if (bool(unity_UseLinearSpace)) {
      emission_8 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_8 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_9;
    tmpvar_9.w = 1.0;
    tmpvar_9.xyz = emission_8;
    res_5 = tmpvar_9;
  };
  tmpvar_1 = res_5;
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
Fallback "Decal/Transparent VertexLit"
}