//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Transparent/transparentWithFog" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "" { }
_Color ("Color", Color) = (1,1,1,1)
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  GpuProgramID 530
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 x_1;
  x_1 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_2;
  highp float tmpvar_3;
  tmpvar_3 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_1, x_1))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_2 = tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 x_1;
  x_1 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_2;
  highp float tmpvar_3;
  tmpvar_3 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_1, x_1))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_2 = tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 x_1;
  x_1 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_2;
  highp float tmpvar_3;
  tmpvar_3 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_1, x_1))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_2 = tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_8;
  mediump vec4 normal_10;
  normal_10 = tmpvar_9;
  mediump vec3 res_11;
  mediump vec3 x_12;
  x_12.x = dot (unity_SHAr, normal_10);
  x_12.y = dot (unity_SHAg, normal_10);
  x_12.z = dot (unity_SHAb, normal_10);
  mediump vec3 x1_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (normal_10.xyzz * normal_10.yzzx);
  x1_13.x = dot (unity_SHBr, tmpvar_14);
  x1_13.y = dot (unity_SHBg, tmpvar_14);
  x1_13.z = dot (unity_SHBb, tmpvar_14);
  res_11 = (x_12 + (x1_13 + (unity_SHC.xyz * 
    ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y))
  )));
  mediump vec3 tmpvar_15;
  tmpvar_15 = max (((1.055 * 
    pow (max (res_11, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_11 = tmpvar_15;
  shlight_1 = tmpvar_15;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_8;
  mediump vec4 normal_10;
  normal_10 = tmpvar_9;
  mediump vec3 res_11;
  mediump vec3 x_12;
  x_12.x = dot (unity_SHAr, normal_10);
  x_12.y = dot (unity_SHAg, normal_10);
  x_12.z = dot (unity_SHAb, normal_10);
  mediump vec3 x1_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (normal_10.xyzz * normal_10.yzzx);
  x1_13.x = dot (unity_SHBr, tmpvar_14);
  x1_13.y = dot (unity_SHBg, tmpvar_14);
  x1_13.z = dot (unity_SHBb, tmpvar_14);
  res_11 = (x_12 + (x1_13 + (unity_SHC.xyz * 
    ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y))
  )));
  mediump vec3 tmpvar_15;
  tmpvar_15 = max (((1.055 * 
    pow (max (res_11, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_11 = tmpvar_15;
  shlight_1 = tmpvar_15;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_8;
  mediump vec4 normal_10;
  normal_10 = tmpvar_9;
  mediump vec3 res_11;
  mediump vec3 x_12;
  x_12.x = dot (unity_SHAr, normal_10);
  x_12.y = dot (unity_SHAg, normal_10);
  x_12.z = dot (unity_SHAb, normal_10);
  mediump vec3 x1_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (normal_10.xyzz * normal_10.yzzx);
  x1_13.x = dot (unity_SHBr, tmpvar_14);
  x1_13.y = dot (unity_SHBg, tmpvar_14);
  x1_13.z = dot (unity_SHBb, tmpvar_14);
  res_11 = (x_12 + (x1_13 + (unity_SHC.xyz * 
    ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y))
  )));
  mediump vec3 tmpvar_15;
  tmpvar_15 = max (((1.055 * 
    pow (max (res_11, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_11 = tmpvar_15;
  shlight_1 = tmpvar_15;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_8;
  mediump vec4 normal_10;
  normal_10 = tmpvar_9;
  mediump vec3 res_11;
  mediump vec3 x_12;
  x_12.x = dot (unity_SHAr, normal_10);
  x_12.y = dot (unity_SHAg, normal_10);
  x_12.z = dot (unity_SHAb, normal_10);
  mediump vec3 x1_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (normal_10.xyzz * normal_10.yzzx);
  x1_13.x = dot (unity_SHBr, tmpvar_14);
  x1_13.y = dot (unity_SHBg, tmpvar_14);
  x1_13.z = dot (unity_SHBb, tmpvar_14);
  res_11 = (x_12 + (x1_13 + (unity_SHC.xyz * 
    ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y))
  )));
  mediump vec3 tmpvar_15;
  tmpvar_15 = max (((1.055 * 
    pow (max (res_11, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_11 = tmpvar_15;
  shlight_1 = tmpvar_15;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_8;
  mediump vec4 normal_10;
  normal_10 = tmpvar_9;
  mediump vec3 res_11;
  mediump vec3 x_12;
  x_12.x = dot (unity_SHAr, normal_10);
  x_12.y = dot (unity_SHAg, normal_10);
  x_12.z = dot (unity_SHAb, normal_10);
  mediump vec3 x1_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (normal_10.xyzz * normal_10.yzzx);
  x1_13.x = dot (unity_SHBr, tmpvar_14);
  x1_13.y = dot (unity_SHBg, tmpvar_14);
  x1_13.z = dot (unity_SHBb, tmpvar_14);
  res_11 = (x_12 + (x1_13 + (unity_SHC.xyz * 
    ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y))
  )));
  mediump vec3 tmpvar_15;
  tmpvar_15 = max (((1.055 * 
    pow (max (res_11, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_11 = tmpvar_15;
  shlight_1 = tmpvar_15;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_8;
  mediump vec4 normal_10;
  normal_10 = tmpvar_9;
  mediump vec3 res_11;
  mediump vec3 x_12;
  x_12.x = dot (unity_SHAr, normal_10);
  x_12.y = dot (unity_SHAg, normal_10);
  x_12.z = dot (unity_SHAb, normal_10);
  mediump vec3 x1_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (normal_10.xyzz * normal_10.yzzx);
  x1_13.x = dot (unity_SHBr, tmpvar_14);
  x1_13.y = dot (unity_SHBg, tmpvar_14);
  x1_13.z = dot (unity_SHBb, tmpvar_14);
  res_11 = (x_12 + (x1_13 + (unity_SHC.xyz * 
    ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y))
  )));
  mediump vec3 tmpvar_15;
  tmpvar_15 = max (((1.055 * 
    pow (max (res_11, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_11 = tmpvar_15;
  shlight_1 = tmpvar_15;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_1.xy = (tmpvar_7 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (tmpvar_7 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_1.xy = (tmpvar_7 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (tmpvar_7 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_1.xy = (tmpvar_7 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (tmpvar_7 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_1.xy = (tmpvar_7 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (tmpvar_7 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_1.xy = (tmpvar_7 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (tmpvar_7 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_1.xy = (tmpvar_7 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (tmpvar_7 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_1.xy = (tmpvar_7 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (tmpvar_7 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_1.xy = (tmpvar_7 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (tmpvar_7 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_1.xy = (tmpvar_7 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (tmpvar_7 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_1.xy = (tmpvar_7 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (tmpvar_7 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_1.xy = (tmpvar_7 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (tmpvar_7 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_1.xy = (tmpvar_7 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (tmpvar_7 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_10;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * lm_1);
  lowp vec4 color_11;
  color_11.w = c_3.w;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_11.xyz = tmpvar_12;
  c_3 = color_11;
  gl_FragData[0] = color_11;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_7));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD5 = tmpvar_1;
  xlv_TEXCOORD6 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_7));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD5 = tmpvar_1;
  xlv_TEXCOORD6 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_7));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD5 = tmpvar_1;
  xlv_TEXCOORD6 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec3 x_5;
  x_5 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_5, x_5))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_6 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10;
  mediump vec4 normal_12;
  normal_12 = tmpvar_11;
  mediump vec3 res_13;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, normal_12);
  x_14.y = dot (unity_SHAg, normal_12);
  x_14.z = dot (unity_SHAb, normal_12);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
  )));
  mediump vec3 tmpvar_17;
  tmpvar_17 = max (((1.055 * 
    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_13 = tmpvar_17;
  shlight_1 = tmpvar_17;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = tmpvar_3;
  xlv_TEXCOORD6 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec3 x_5;
  x_5 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_5, x_5))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_6 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10;
  mediump vec4 normal_12;
  normal_12 = tmpvar_11;
  mediump vec3 res_13;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, normal_12);
  x_14.y = dot (unity_SHAg, normal_12);
  x_14.z = dot (unity_SHAb, normal_12);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
  )));
  mediump vec3 tmpvar_17;
  tmpvar_17 = max (((1.055 * 
    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_13 = tmpvar_17;
  shlight_1 = tmpvar_17;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = tmpvar_3;
  xlv_TEXCOORD6 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec3 x_5;
  x_5 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_5, x_5))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_6 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10;
  mediump vec4 normal_12;
  normal_12 = tmpvar_11;
  mediump vec3 res_13;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, normal_12);
  x_14.y = dot (unity_SHAg, normal_12);
  x_14.z = dot (unity_SHAb, normal_12);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
  )));
  mediump vec3 tmpvar_17;
  tmpvar_17 = max (((1.055 * 
    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_13 = tmpvar_17;
  shlight_1 = tmpvar_17;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = tmpvar_3;
  xlv_TEXCOORD6 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  shlight_1 = tmpvar_16;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  shlight_1 = tmpvar_16;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  shlight_1 = tmpvar_16;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  shlight_1 = tmpvar_16;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  shlight_1 = tmpvar_16;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  shlight_1 = tmpvar_16;
  tmpvar_2 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  tmpvar_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_7.xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_6 = tmpvar_7;
  tmpvar_4 = c_6.xyz;
  tmpvar_5 = c_6.w;
  lowp float x_8;
  x_8 = (tmpvar_5 - _Cutoff);
  if ((x_8 < 0.0)) {
    discard;
  };
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_14;
  c_3.w = tmpvar_5;
  c_3.xyz = (tmpvar_4 * min (lm_1, vec3((tmpvar_9 * 2.0))));
  lowp vec4 color_15;
  color_15.w = c_3.w;
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (unity_FogColor.xyz, c_3.xyz, vec3(xlv_TEXCOORD3));
  color_15.xyz = tmpvar_16;
  c_3 = color_15;
  gl_FragData[0] = color_15;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 lightColor0_9;
  lightColor0_9 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_10;
  lightColor1_10 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_11;
  lightColor2_11 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_12;
  lightColor3_12 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_13;
  lightAttenSq_13 = unity_4LightAtten0;
  highp vec3 col_14;
  highp vec4 ndotl_15;
  highp vec4 lengthSq_16;
  highp vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_16 = (tmpvar_17 * tmpvar_17);
  lengthSq_16 = (lengthSq_16 + (tmpvar_18 * tmpvar_18));
  lengthSq_16 = (lengthSq_16 + (tmpvar_19 * tmpvar_19));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (lengthSq_16, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_16 = tmpvar_20;
  ndotl_15 = (tmpvar_17 * tmpvar_8.x);
  ndotl_15 = (ndotl_15 + (tmpvar_18 * tmpvar_8.y));
  ndotl_15 = (ndotl_15 + (tmpvar_19 * tmpvar_8.z));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_15 * inversesqrt(tmpvar_20)));
  ndotl_15 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_21 * (1.0/((1.0 + 
    (tmpvar_20 * lightAttenSq_13)
  ))));
  col_14 = (lightColor0_9 * tmpvar_22.x);
  col_14 = (col_14 + (lightColor1_10 * tmpvar_22.y));
  col_14 = (col_14 + (lightColor2_11 * tmpvar_22.z));
  col_14 = (col_14 + (lightColor3_12 * tmpvar_22.w));
  tmpvar_1 = col_14;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 lightColor0_9;
  lightColor0_9 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_10;
  lightColor1_10 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_11;
  lightColor2_11 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_12;
  lightColor3_12 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_13;
  lightAttenSq_13 = unity_4LightAtten0;
  highp vec3 col_14;
  highp vec4 ndotl_15;
  highp vec4 lengthSq_16;
  highp vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_16 = (tmpvar_17 * tmpvar_17);
  lengthSq_16 = (lengthSq_16 + (tmpvar_18 * tmpvar_18));
  lengthSq_16 = (lengthSq_16 + (tmpvar_19 * tmpvar_19));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (lengthSq_16, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_16 = tmpvar_20;
  ndotl_15 = (tmpvar_17 * tmpvar_8.x);
  ndotl_15 = (ndotl_15 + (tmpvar_18 * tmpvar_8.y));
  ndotl_15 = (ndotl_15 + (tmpvar_19 * tmpvar_8.z));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_15 * inversesqrt(tmpvar_20)));
  ndotl_15 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_21 * (1.0/((1.0 + 
    (tmpvar_20 * lightAttenSq_13)
  ))));
  col_14 = (lightColor0_9 * tmpvar_22.x);
  col_14 = (col_14 + (lightColor1_10 * tmpvar_22.y));
  col_14 = (col_14 + (lightColor2_11 * tmpvar_22.z));
  col_14 = (col_14 + (lightColor3_12 * tmpvar_22.w));
  tmpvar_1 = col_14;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec3 x_2;
  x_2 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_2, x_2))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 lightColor0_9;
  lightColor0_9 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_10;
  lightColor1_10 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_11;
  lightColor2_11 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_12;
  lightColor3_12 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_13;
  lightAttenSq_13 = unity_4LightAtten0;
  highp vec3 col_14;
  highp vec4 ndotl_15;
  highp vec4 lengthSq_16;
  highp vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_16 = (tmpvar_17 * tmpvar_17);
  lengthSq_16 = (lengthSq_16 + (tmpvar_18 * tmpvar_18));
  lengthSq_16 = (lengthSq_16 + (tmpvar_19 * tmpvar_19));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (lengthSq_16, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_16 = tmpvar_20;
  ndotl_15 = (tmpvar_17 * tmpvar_8.x);
  ndotl_15 = (ndotl_15 + (tmpvar_18 * tmpvar_8.y));
  ndotl_15 = (ndotl_15 + (tmpvar_19 * tmpvar_8.z));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_15 * inversesqrt(tmpvar_20)));
  ndotl_15 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_21 * (1.0/((1.0 + 
    (tmpvar_20 * lightAttenSq_13)
  ))));
  col_14 = (lightColor0_9 * tmpvar_22.x);
  col_14 = (col_14 + (lightColor1_10 * tmpvar_22.y));
  col_14 = (col_14 + (lightColor2_11 * tmpvar_22.z));
  col_14 = (col_14 + (lightColor3_12 * tmpvar_22.w));
  tmpvar_1 = col_14;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  shlight_1 = tmpvar_16;
  tmpvar_2 = shlight_1;
  highp vec3 lightColor0_17;
  lightColor0_17 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_18;
  lightColor1_18 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_19;
  lightColor2_19 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_20;
  lightColor3_20 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_21;
  lightAttenSq_21 = unity_4LightAtten0;
  highp vec3 col_22;
  highp vec4 ndotl_23;
  highp vec4 lengthSq_24;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_24 = (tmpvar_25 * tmpvar_25);
  lengthSq_24 = (lengthSq_24 + (tmpvar_26 * tmpvar_26));
  lengthSq_24 = (lengthSq_24 + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (lengthSq_24, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_24 = tmpvar_28;
  ndotl_23 = (tmpvar_25 * tmpvar_9.x);
  ndotl_23 = (ndotl_23 + (tmpvar_26 * tmpvar_9.y));
  ndotl_23 = (ndotl_23 + (tmpvar_27 * tmpvar_9.z));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_23 * inversesqrt(tmpvar_28)));
  ndotl_23 = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30 = (tmpvar_29 * (1.0/((1.0 + 
    (tmpvar_28 * lightAttenSq_21)
  ))));
  col_22 = (lightColor0_17 * tmpvar_30.x);
  col_22 = (col_22 + (lightColor1_18 * tmpvar_30.y));
  col_22 = (col_22 + (lightColor2_19 * tmpvar_30.z));
  col_22 = (col_22 + (lightColor3_20 * tmpvar_30.w));
  tmpvar_2 = (tmpvar_2 + col_22);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  shlight_1 = tmpvar_16;
  tmpvar_2 = shlight_1;
  highp vec3 lightColor0_17;
  lightColor0_17 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_18;
  lightColor1_18 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_19;
  lightColor2_19 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_20;
  lightColor3_20 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_21;
  lightAttenSq_21 = unity_4LightAtten0;
  highp vec3 col_22;
  highp vec4 ndotl_23;
  highp vec4 lengthSq_24;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_24 = (tmpvar_25 * tmpvar_25);
  lengthSq_24 = (lengthSq_24 + (tmpvar_26 * tmpvar_26));
  lengthSq_24 = (lengthSq_24 + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (lengthSq_24, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_24 = tmpvar_28;
  ndotl_23 = (tmpvar_25 * tmpvar_9.x);
  ndotl_23 = (ndotl_23 + (tmpvar_26 * tmpvar_9.y));
  ndotl_23 = (ndotl_23 + (tmpvar_27 * tmpvar_9.z));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_23 * inversesqrt(tmpvar_28)));
  ndotl_23 = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30 = (tmpvar_29 * (1.0/((1.0 + 
    (tmpvar_28 * lightAttenSq_21)
  ))));
  col_22 = (lightColor0_17 * tmpvar_30.x);
  col_22 = (col_22 + (lightColor1_18 * tmpvar_30.y));
  col_22 = (col_22 + (lightColor2_19 * tmpvar_30.z));
  col_22 = (col_22 + (lightColor3_20 * tmpvar_30.w));
  tmpvar_2 = (tmpvar_2 + col_22);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  shlight_1 = tmpvar_16;
  tmpvar_2 = shlight_1;
  highp vec3 lightColor0_17;
  lightColor0_17 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_18;
  lightColor1_18 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_19;
  lightColor2_19 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_20;
  lightColor3_20 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_21;
  lightAttenSq_21 = unity_4LightAtten0;
  highp vec3 col_22;
  highp vec4 ndotl_23;
  highp vec4 lengthSq_24;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_24 = (tmpvar_25 * tmpvar_25);
  lengthSq_24 = (lengthSq_24 + (tmpvar_26 * tmpvar_26));
  lengthSq_24 = (lengthSq_24 + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (lengthSq_24, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_24 = tmpvar_28;
  ndotl_23 = (tmpvar_25 * tmpvar_9.x);
  ndotl_23 = (ndotl_23 + (tmpvar_26 * tmpvar_9.y));
  ndotl_23 = (ndotl_23 + (tmpvar_27 * tmpvar_9.z));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_23 * inversesqrt(tmpvar_28)));
  ndotl_23 = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30 = (tmpvar_29 * (1.0/((1.0 + 
    (tmpvar_28 * lightAttenSq_21)
  ))));
  col_22 = (lightColor0_17 * tmpvar_30.x);
  col_22 = (col_22 + (lightColor1_18 * tmpvar_30.y));
  col_22 = (col_22 + (lightColor2_19 * tmpvar_30.z));
  col_22 = (col_22 + (lightColor3_20 * tmpvar_30.w));
  tmpvar_2 = (tmpvar_2 + col_22);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec3 lightColor0_11;
  lightColor0_11 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_12;
  lightColor1_12 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_13;
  lightColor2_13 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_14;
  lightColor3_14 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_15;
  lightAttenSq_15 = unity_4LightAtten0;
  highp vec3 col_16;
  highp vec4 ndotl_17;
  highp vec4 lengthSq_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (lengthSq_18, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_18 = tmpvar_22;
  ndotl_17 = (tmpvar_19 * tmpvar_10.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_10.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_10.z));
  highp vec4 tmpvar_23;
  tmpvar_23 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_17 * inversesqrt(tmpvar_22)));
  ndotl_17 = tmpvar_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_23 * (1.0/((1.0 + 
    (tmpvar_22 * lightAttenSq_15)
  ))));
  col_16 = (lightColor0_11 * tmpvar_24.x);
  col_16 = (col_16 + (lightColor1_12 * tmpvar_24.y));
  col_16 = (col_16 + (lightColor2_13 * tmpvar_24.z));
  col_16 = (col_16 + (lightColor3_14 * tmpvar_24.w));
  tmpvar_1 = col_16;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = tmpvar_2;
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec3 lightColor0_11;
  lightColor0_11 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_12;
  lightColor1_12 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_13;
  lightColor2_13 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_14;
  lightColor3_14 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_15;
  lightAttenSq_15 = unity_4LightAtten0;
  highp vec3 col_16;
  highp vec4 ndotl_17;
  highp vec4 lengthSq_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (lengthSq_18, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_18 = tmpvar_22;
  ndotl_17 = (tmpvar_19 * tmpvar_10.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_10.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_10.z));
  highp vec4 tmpvar_23;
  tmpvar_23 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_17 * inversesqrt(tmpvar_22)));
  ndotl_17 = tmpvar_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_23 * (1.0/((1.0 + 
    (tmpvar_22 * lightAttenSq_15)
  ))));
  col_16 = (lightColor0_11 * tmpvar_24.x);
  col_16 = (col_16 + (lightColor1_12 * tmpvar_24.y));
  col_16 = (col_16 + (lightColor2_13 * tmpvar_24.z));
  col_16 = (col_16 + (lightColor3_14 * tmpvar_24.w));
  tmpvar_1 = col_16;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = tmpvar_2;
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec3 lightColor0_11;
  lightColor0_11 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_12;
  lightColor1_12 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_13;
  lightColor2_13 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_14;
  lightColor3_14 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_15;
  lightAttenSq_15 = unity_4LightAtten0;
  highp vec3 col_16;
  highp vec4 ndotl_17;
  highp vec4 lengthSq_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (lengthSq_18, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_18 = tmpvar_22;
  ndotl_17 = (tmpvar_19 * tmpvar_10.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_10.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_10.z));
  highp vec4 tmpvar_23;
  tmpvar_23 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_17 * inversesqrt(tmpvar_22)));
  ndotl_17 = tmpvar_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_23 * (1.0/((1.0 + 
    (tmpvar_22 * lightAttenSq_15)
  ))));
  col_16 = (lightColor0_11 * tmpvar_24.x);
  col_16 = (col_16 + (lightColor1_12 * tmpvar_24.y));
  col_16 = (col_16 + (lightColor2_13 * tmpvar_24.z));
  col_16 = (col_16 + (lightColor3_14 * tmpvar_24.w));
  tmpvar_1 = col_16;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = tmpvar_2;
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec3 x_5;
  x_5 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_5, x_5))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_6 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_WorldToObject[0].xyz;
  tmpvar_10[1] = unity_WorldToObject[1].xyz;
  tmpvar_10[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_glesNormal * tmpvar_10));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_11;
  mediump vec4 normal_13;
  normal_13 = tmpvar_12;
  mediump vec3 res_14;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, normal_13);
  x_15.y = dot (unity_SHAg, normal_13);
  x_15.z = dot (unity_SHAb, normal_13);
  mediump vec3 x1_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normal_13.xyzz * normal_13.yzzx);
  x1_16.x = dot (unity_SHBr, tmpvar_17);
  x1_16.y = dot (unity_SHBg, tmpvar_17);
  x1_16.z = dot (unity_SHBb, tmpvar_17);
  res_14 = (x_15 + (x1_16 + (unity_SHC.xyz * 
    ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y))
  )));
  mediump vec3 tmpvar_18;
  tmpvar_18 = max (((1.055 * 
    pow (max (res_14, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_14 = tmpvar_18;
  shlight_1 = tmpvar_18;
  tmpvar_2 = shlight_1;
  highp vec3 lightColor0_19;
  lightColor0_19 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_20;
  lightColor1_20 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_21;
  lightColor2_21 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_22;
  lightColor3_22 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_23;
  lightAttenSq_23 = unity_4LightAtten0;
  highp vec3 col_24;
  highp vec4 ndotl_25;
  highp vec4 lengthSq_26;
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_26 = (tmpvar_27 * tmpvar_27);
  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_26 = tmpvar_30;
  ndotl_25 = (tmpvar_27 * tmpvar_11.x);
  ndotl_25 = (ndotl_25 + (tmpvar_28 * tmpvar_11.y));
  ndotl_25 = (ndotl_25 + (tmpvar_29 * tmpvar_11.z));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_25 * inversesqrt(tmpvar_30)));
  ndotl_25 = tmpvar_31;
  highp vec4 tmpvar_32;
  tmpvar_32 = (tmpvar_31 * (1.0/((1.0 + 
    (tmpvar_30 * lightAttenSq_23)
  ))));
  col_24 = (lightColor0_19 * tmpvar_32.x);
  col_24 = (col_24 + (lightColor1_20 * tmpvar_32.y));
  col_24 = (col_24 + (lightColor2_21 * tmpvar_32.z));
  col_24 = (col_24 + (lightColor3_22 * tmpvar_32.w));
  tmpvar_2 = (tmpvar_2 + col_24);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = tmpvar_3;
  xlv_TEXCOORD6 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec3 x_5;
  x_5 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_5, x_5))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_6 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_WorldToObject[0].xyz;
  tmpvar_10[1] = unity_WorldToObject[1].xyz;
  tmpvar_10[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_glesNormal * tmpvar_10));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_11;
  mediump vec4 normal_13;
  normal_13 = tmpvar_12;
  mediump vec3 res_14;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, normal_13);
  x_15.y = dot (unity_SHAg, normal_13);
  x_15.z = dot (unity_SHAb, normal_13);
  mediump vec3 x1_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normal_13.xyzz * normal_13.yzzx);
  x1_16.x = dot (unity_SHBr, tmpvar_17);
  x1_16.y = dot (unity_SHBg, tmpvar_17);
  x1_16.z = dot (unity_SHBb, tmpvar_17);
  res_14 = (x_15 + (x1_16 + (unity_SHC.xyz * 
    ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y))
  )));
  mediump vec3 tmpvar_18;
  tmpvar_18 = max (((1.055 * 
    pow (max (res_14, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_14 = tmpvar_18;
  shlight_1 = tmpvar_18;
  tmpvar_2 = shlight_1;
  highp vec3 lightColor0_19;
  lightColor0_19 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_20;
  lightColor1_20 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_21;
  lightColor2_21 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_22;
  lightColor3_22 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_23;
  lightAttenSq_23 = unity_4LightAtten0;
  highp vec3 col_24;
  highp vec4 ndotl_25;
  highp vec4 lengthSq_26;
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_26 = (tmpvar_27 * tmpvar_27);
  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_26 = tmpvar_30;
  ndotl_25 = (tmpvar_27 * tmpvar_11.x);
  ndotl_25 = (ndotl_25 + (tmpvar_28 * tmpvar_11.y));
  ndotl_25 = (ndotl_25 + (tmpvar_29 * tmpvar_11.z));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_25 * inversesqrt(tmpvar_30)));
  ndotl_25 = tmpvar_31;
  highp vec4 tmpvar_32;
  tmpvar_32 = (tmpvar_31 * (1.0/((1.0 + 
    (tmpvar_30 * lightAttenSq_23)
  ))));
  col_24 = (lightColor0_19 * tmpvar_32.x);
  col_24 = (col_24 + (lightColor1_20 * tmpvar_32.y));
  col_24 = (col_24 + (lightColor2_21 * tmpvar_32.z));
  col_24 = (col_24 + (lightColor3_22 * tmpvar_32.w));
  tmpvar_2 = (tmpvar_2 + col_24);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = tmpvar_3;
  xlv_TEXCOORD6 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec3 x_5;
  x_5 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_5, x_5))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_6 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_WorldToObject[0].xyz;
  tmpvar_10[1] = unity_WorldToObject[1].xyz;
  tmpvar_10[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_glesNormal * tmpvar_10));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_11;
  mediump vec4 normal_13;
  normal_13 = tmpvar_12;
  mediump vec3 res_14;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, normal_13);
  x_15.y = dot (unity_SHAg, normal_13);
  x_15.z = dot (unity_SHAb, normal_13);
  mediump vec3 x1_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normal_13.xyzz * normal_13.yzzx);
  x1_16.x = dot (unity_SHBr, tmpvar_17);
  x1_16.y = dot (unity_SHBg, tmpvar_17);
  x1_16.z = dot (unity_SHBb, tmpvar_17);
  res_14 = (x_15 + (x1_16 + (unity_SHC.xyz * 
    ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y))
  )));
  mediump vec3 tmpvar_18;
  tmpvar_18 = max (((1.055 * 
    pow (max (res_14, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_14 = tmpvar_18;
  shlight_1 = tmpvar_18;
  tmpvar_2 = shlight_1;
  highp vec3 lightColor0_19;
  lightColor0_19 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_20;
  lightColor1_20 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_21;
  lightColor2_21 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_22;
  lightColor3_22 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_23;
  lightAttenSq_23 = unity_4LightAtten0;
  highp vec3 col_24;
  highp vec4 ndotl_25;
  highp vec4 lengthSq_26;
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_26 = (tmpvar_27 * tmpvar_27);
  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_26 = tmpvar_30;
  ndotl_25 = (tmpvar_27 * tmpvar_11.x);
  ndotl_25 = (ndotl_25 + (tmpvar_28 * tmpvar_11.y));
  ndotl_25 = (ndotl_25 + (tmpvar_29 * tmpvar_11.z));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_25 * inversesqrt(tmpvar_30)));
  ndotl_25 = tmpvar_31;
  highp vec4 tmpvar_32;
  tmpvar_32 = (tmpvar_31 * (1.0/((1.0 + 
    (tmpvar_30 * lightAttenSq_23)
  ))));
  col_24 = (lightColor0_19 * tmpvar_32.x);
  col_24 = (col_24 + (lightColor1_20 * tmpvar_32.y));
  col_24 = (col_24 + (lightColor2_21 * tmpvar_32.z));
  col_24 = (col_24 + (lightColor3_22 * tmpvar_32.w));
  tmpvar_2 = (tmpvar_2 + col_24);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = tmpvar_3;
  xlv_TEXCOORD6 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 lightColor0_10;
  lightColor0_10 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_11;
  lightColor1_11 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_12;
  lightColor2_12 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_13;
  lightColor3_13 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_14;
  lightAttenSq_14 = unity_4LightAtten0;
  highp vec3 col_15;
  highp vec4 ndotl_16;
  highp vec4 lengthSq_17;
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_9.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_9.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_9.z));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_16 * inversesqrt(tmpvar_21)));
  ndotl_16 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * (1.0/((1.0 + 
    (tmpvar_21 * lightAttenSq_14)
  ))));
  col_15 = (lightColor0_10 * tmpvar_23.x);
  col_15 = (col_15 + (lightColor1_11 * tmpvar_23.y));
  col_15 = (col_15 + (lightColor2_12 * tmpvar_23.z));
  col_15 = (col_15 + (lightColor3_13 * tmpvar_23.w));
  tmpvar_1 = col_15;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 lightColor0_10;
  lightColor0_10 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_11;
  lightColor1_11 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_12;
  lightColor2_12 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_13;
  lightColor3_13 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_14;
  lightAttenSq_14 = unity_4LightAtten0;
  highp vec3 col_15;
  highp vec4 ndotl_16;
  highp vec4 lengthSq_17;
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_9.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_9.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_9.z));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_16 * inversesqrt(tmpvar_21)));
  ndotl_16 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * (1.0/((1.0 + 
    (tmpvar_21 * lightAttenSq_14)
  ))));
  col_15 = (lightColor0_10 * tmpvar_23.x);
  col_15 = (col_15 + (lightColor1_11 * tmpvar_23.y));
  col_15 = (col_15 + (lightColor2_12 * tmpvar_23.z));
  col_15 = (col_15 + (lightColor3_13 * tmpvar_23.w));
  tmpvar_1 = col_15;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 lightColor0_10;
  lightColor0_10 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_11;
  lightColor1_11 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_12;
  lightColor2_12 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_13;
  lightColor3_13 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_14;
  lightAttenSq_14 = unity_4LightAtten0;
  highp vec3 col_15;
  highp vec4 ndotl_16;
  highp vec4 lengthSq_17;
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_9.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_9.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_9.z));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_16 * inversesqrt(tmpvar_21)));
  ndotl_16 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * (1.0/((1.0 + 
    (tmpvar_21 * lightAttenSq_14)
  ))));
  col_15 = (lightColor0_10 * tmpvar_23.x);
  col_15 = (col_15 + (lightColor1_11 * tmpvar_23.y));
  col_15 = (col_15 + (lightColor2_12 * tmpvar_23.z));
  col_15 = (col_15 + (lightColor3_13 * tmpvar_23.w));
  tmpvar_1 = col_15;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10;
  mediump vec4 normal_12;
  normal_12 = tmpvar_11;
  mediump vec3 res_13;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, normal_12);
  x_14.y = dot (unity_SHAg, normal_12);
  x_14.z = dot (unity_SHAb, normal_12);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
  )));
  mediump vec3 tmpvar_17;
  tmpvar_17 = max (((1.055 * 
    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_13 = tmpvar_17;
  shlight_1 = tmpvar_17;
  tmpvar_2 = shlight_1;
  highp vec3 lightColor0_18;
  lightColor0_18 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_19;
  lightColor1_19 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_20;
  lightColor2_20 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_21;
  lightColor3_21 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_22;
  lightAttenSq_22 = unity_4LightAtten0;
  highp vec3 col_23;
  highp vec4 ndotl_24;
  highp vec4 lengthSq_25;
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_10.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_10.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_10.z));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_24 * inversesqrt(tmpvar_29)));
  ndotl_24 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31 = (tmpvar_30 * (1.0/((1.0 + 
    (tmpvar_29 * lightAttenSq_22)
  ))));
  col_23 = (lightColor0_18 * tmpvar_31.x);
  col_23 = (col_23 + (lightColor1_19 * tmpvar_31.y));
  col_23 = (col_23 + (lightColor2_20 * tmpvar_31.z));
  col_23 = (col_23 + (lightColor3_21 * tmpvar_31.w));
  tmpvar_2 = (tmpvar_2 + col_23);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10;
  mediump vec4 normal_12;
  normal_12 = tmpvar_11;
  mediump vec3 res_13;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, normal_12);
  x_14.y = dot (unity_SHAg, normal_12);
  x_14.z = dot (unity_SHAb, normal_12);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
  )));
  mediump vec3 tmpvar_17;
  tmpvar_17 = max (((1.055 * 
    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_13 = tmpvar_17;
  shlight_1 = tmpvar_17;
  tmpvar_2 = shlight_1;
  highp vec3 lightColor0_18;
  lightColor0_18 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_19;
  lightColor1_19 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_20;
  lightColor2_20 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_21;
  lightColor3_21 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_22;
  lightAttenSq_22 = unity_4LightAtten0;
  highp vec3 col_23;
  highp vec4 ndotl_24;
  highp vec4 lengthSq_25;
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_10.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_10.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_10.z));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_24 * inversesqrt(tmpvar_29)));
  ndotl_24 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31 = (tmpvar_30 * (1.0/((1.0 + 
    (tmpvar_29 * lightAttenSq_22)
  ))));
  col_23 = (lightColor0_18 * tmpvar_31.x);
  col_23 = (col_23 + (lightColor1_19 * tmpvar_31.y));
  col_23 = (col_23 + (lightColor2_20 * tmpvar_31.z));
  col_23 = (col_23 + (lightColor3_21 * tmpvar_31.w));
  tmpvar_2 = (tmpvar_2 + col_23);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10;
  mediump vec4 normal_12;
  normal_12 = tmpvar_11;
  mediump vec3 res_13;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, normal_12);
  x_14.y = dot (unity_SHAg, normal_12);
  x_14.z = dot (unity_SHAb, normal_12);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
  )));
  mediump vec3 tmpvar_17;
  tmpvar_17 = max (((1.055 * 
    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_13 = tmpvar_17;
  shlight_1 = tmpvar_17;
  tmpvar_2 = shlight_1;
  highp vec3 lightColor0_18;
  lightColor0_18 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_19;
  lightColor1_19 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_20;
  lightColor2_20 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_21;
  lightColor3_21 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_22;
  lightAttenSq_22 = unity_4LightAtten0;
  highp vec3 col_23;
  highp vec4 ndotl_24;
  highp vec4 lengthSq_25;
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_10.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_10.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_10.z));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_24 * inversesqrt(tmpvar_29)));
  ndotl_24 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31 = (tmpvar_30 * (1.0/((1.0 + 
    (tmpvar_29 * lightAttenSq_22)
  ))));
  col_23 = (lightColor0_18 * tmpvar_31.x);
  col_23 = (col_23 + (lightColor1_19 * tmpvar_31.y));
  col_23 = (col_23 + (lightColor2_20 * tmpvar_31.z));
  col_23 = (col_23 + (lightColor3_21 * tmpvar_31.w));
  tmpvar_2 = (tmpvar_2 + col_23);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 lightColor0_10;
  lightColor0_10 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_11;
  lightColor1_11 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_12;
  lightColor2_12 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_13;
  lightColor3_13 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_14;
  lightAttenSq_14 = unity_4LightAtten0;
  highp vec3 col_15;
  highp vec4 ndotl_16;
  highp vec4 lengthSq_17;
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_9.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_9.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_9.z));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_16 * inversesqrt(tmpvar_21)));
  ndotl_16 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * (1.0/((1.0 + 
    (tmpvar_21 * lightAttenSq_14)
  ))));
  col_15 = (lightColor0_10 * tmpvar_23.x);
  col_15 = (col_15 + (lightColor1_11 * tmpvar_23.y));
  col_15 = (col_15 + (lightColor2_12 * tmpvar_23.z));
  col_15 = (col_15 + (lightColor3_13 * tmpvar_23.w));
  tmpvar_1 = col_15;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 lightColor0_10;
  lightColor0_10 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_11;
  lightColor1_11 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_12;
  lightColor2_12 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_13;
  lightColor3_13 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_14;
  lightAttenSq_14 = unity_4LightAtten0;
  highp vec3 col_15;
  highp vec4 ndotl_16;
  highp vec4 lengthSq_17;
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_9.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_9.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_9.z));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_16 * inversesqrt(tmpvar_21)));
  ndotl_16 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * (1.0/((1.0 + 
    (tmpvar_21 * lightAttenSq_14)
  ))));
  col_15 = (lightColor0_10 * tmpvar_23.x);
  col_15 = (col_15 + (lightColor1_11 * tmpvar_23.y));
  col_15 = (col_15 + (lightColor2_12 * tmpvar_23.z));
  col_15 = (col_15 + (lightColor3_13 * tmpvar_23.w));
  tmpvar_1 = col_15;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 x_3;
  x_3 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_3, x_3))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_4 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 lightColor0_10;
  lightColor0_10 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_11;
  lightColor1_11 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_12;
  lightColor2_12 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_13;
  lightColor3_13 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_14;
  lightAttenSq_14 = unity_4LightAtten0;
  highp vec3 col_15;
  highp vec4 ndotl_16;
  highp vec4 lengthSq_17;
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_9.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_9.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_9.z));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_16 * inversesqrt(tmpvar_21)));
  ndotl_16 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * (1.0/((1.0 + 
    (tmpvar_21 * lightAttenSq_14)
  ))));
  col_15 = (lightColor0_10 * tmpvar_23.x);
  col_15 = (col_15 + (lightColor1_11 * tmpvar_23.y));
  col_15 = (col_15 + (lightColor2_12 * tmpvar_23.z));
  col_15 = (col_15 + (lightColor3_13 * tmpvar_23.w));
  tmpvar_1 = col_15;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10;
  mediump vec4 normal_12;
  normal_12 = tmpvar_11;
  mediump vec3 res_13;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, normal_12);
  x_14.y = dot (unity_SHAg, normal_12);
  x_14.z = dot (unity_SHAb, normal_12);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
  )));
  mediump vec3 tmpvar_17;
  tmpvar_17 = max (((1.055 * 
    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_13 = tmpvar_17;
  shlight_1 = tmpvar_17;
  tmpvar_2 = shlight_1;
  highp vec3 lightColor0_18;
  lightColor0_18 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_19;
  lightColor1_19 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_20;
  lightColor2_20 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_21;
  lightColor3_21 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_22;
  lightAttenSq_22 = unity_4LightAtten0;
  highp vec3 col_23;
  highp vec4 ndotl_24;
  highp vec4 lengthSq_25;
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_10.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_10.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_10.z));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_24 * inversesqrt(tmpvar_29)));
  ndotl_24 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31 = (tmpvar_30 * (1.0/((1.0 + 
    (tmpvar_29 * lightAttenSq_22)
  ))));
  col_23 = (lightColor0_18 * tmpvar_31.x);
  col_23 = (col_23 + (lightColor1_19 * tmpvar_31.y));
  col_23 = (col_23 + (lightColor2_20 * tmpvar_31.z));
  col_23 = (col_23 + (lightColor3_21 * tmpvar_31.w));
  tmpvar_2 = (tmpvar_2 + col_23);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10;
  mediump vec4 normal_12;
  normal_12 = tmpvar_11;
  mediump vec3 res_13;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, normal_12);
  x_14.y = dot (unity_SHAg, normal_12);
  x_14.z = dot (unity_SHAb, normal_12);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
  )));
  mediump vec3 tmpvar_17;
  tmpvar_17 = max (((1.055 * 
    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_13 = tmpvar_17;
  shlight_1 = tmpvar_17;
  tmpvar_2 = shlight_1;
  highp vec3 lightColor0_18;
  lightColor0_18 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_19;
  lightColor1_19 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_20;
  lightColor2_20 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_21;
  lightColor3_21 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_22;
  lightAttenSq_22 = unity_4LightAtten0;
  highp vec3 col_23;
  highp vec4 ndotl_24;
  highp vec4 lengthSq_25;
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_10.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_10.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_10.z));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_24 * inversesqrt(tmpvar_29)));
  ndotl_24 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31 = (tmpvar_30 * (1.0/((1.0 + 
    (tmpvar_29 * lightAttenSq_22)
  ))));
  col_23 = (lightColor0_18 * tmpvar_31.x);
  col_23 = (col_23 + (lightColor1_19 * tmpvar_31.y));
  col_23 = (col_23 + (lightColor2_20 * tmpvar_31.z));
  col_23 = (col_23 + (lightColor3_21 * tmpvar_31.w));
  tmpvar_2 = (tmpvar_2 + col_23);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec3 x_4;
  x_4 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_4, x_4))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_5 = tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10;
  mediump vec4 normal_12;
  normal_12 = tmpvar_11;
  mediump vec3 res_13;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, normal_12);
  x_14.y = dot (unity_SHAg, normal_12);
  x_14.z = dot (unity_SHAb, normal_12);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
  )));
  mediump vec3 tmpvar_17;
  tmpvar_17 = max (((1.055 * 
    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_13 = tmpvar_17;
  shlight_1 = tmpvar_17;
  tmpvar_2 = shlight_1;
  highp vec3 lightColor0_18;
  lightColor0_18 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_19;
  lightColor1_19 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_20;
  lightColor2_20 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_21;
  lightColor3_21 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_22;
  lightAttenSq_22 = unity_4LightAtten0;
  highp vec3 col_23;
  highp vec4 ndotl_24;
  highp vec4 lengthSq_25;
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_10.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_10.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_10.z));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_24 * inversesqrt(tmpvar_29)));
  ndotl_24 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31 = (tmpvar_30 * (1.0/((1.0 + 
    (tmpvar_29 * lightAttenSq_22)
  ))));
  col_23 = (lightColor0_18 * tmpvar_31.x);
  col_23 = (col_23 + (lightColor1_19 * tmpvar_31.y));
  col_23 = (col_23 + (lightColor2_20 * tmpvar_31.z));
  col_23 = (col_23 + (lightColor3_21 * tmpvar_31.w));
  tmpvar_2 = (tmpvar_2 + col_23);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_4 = tmpvar_5;
  tmpvar_2 = c_4.xyz;
  tmpvar_3 = c_4.w;
  lowp float x_6;
  x_6 = (tmpvar_3 - _Cutoff);
  if ((x_6 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8.xyz = tmpvar_2;
  tmpvar_8.w = tmpvar_3;
  tmpvar_7 = tmpvar_8;
  c_1 = (c_1 + tmpvar_7);
  lowp vec4 color_9;
  color_9.w = c_1.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = mix (unity_FogColor.xyz, c_1.xyz, vec3(xlv_TEXCOORD3));
  color_9.xyz = tmpvar_10;
  c_1 = color_9;
  gl_FragData[0] = color_9;
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
Keywords { "DIRECTIONAL" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
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
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
""
}
}
}
 Pass {
  Name "META"
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Cull Off
  GpuProgramID 127927
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD1;
void main ()
{
  highp vec3 x_1;
  x_1 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_2;
  highp float tmpvar_3;
  tmpvar_3 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_1, x_1))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_2 = tmpvar_3;
  highp vec4 vertex_4;
  vertex_4 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_5;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_5 = 0.0001;
    } else {
      tmpvar_5 = 0.0;
    };
    vertex_4.z = tmpvar_5;
  };
  if (unity_MetaVertexControl.y) {
    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_6;
    if ((vertex_4.z > 0.0)) {
      tmpvar_6 = 0.0001;
    } else {
      tmpvar_6 = 0.0;
    };
    vertex_4.z = tmpvar_6;
  };
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = vertex_4.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float x_7;
  x_7 = (tmpvar_4 - _Cutoff);
  if ((x_7 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_8;
  res_8 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_9;
    tmpvar_9.w = 1.0;
    tmpvar_9.xyz = tmpvar_2;
    res_8.w = tmpvar_9.w;
    highp vec3 tmpvar_10;
    tmpvar_10 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_8.xyz = tmpvar_10;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_11;
    if (bool(unity_UseLinearSpace)) {
      emission_11 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_11 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_12;
    tmpvar_12.w = 1.0;
    tmpvar_12.xyz = emission_11;
    res_8 = tmpvar_12;
  };
  tmpvar_1 = res_8;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD1;
void main ()
{
  highp vec3 x_1;
  x_1 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_2;
  highp float tmpvar_3;
  tmpvar_3 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_1, x_1))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_2 = tmpvar_3;
  highp vec4 vertex_4;
  vertex_4 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_5;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_5 = 0.0001;
    } else {
      tmpvar_5 = 0.0;
    };
    vertex_4.z = tmpvar_5;
  };
  if (unity_MetaVertexControl.y) {
    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_6;
    if ((vertex_4.z > 0.0)) {
      tmpvar_6 = 0.0001;
    } else {
      tmpvar_6 = 0.0;
    };
    vertex_4.z = tmpvar_6;
  };
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = vertex_4.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float x_7;
  x_7 = (tmpvar_4 - _Cutoff);
  if ((x_7 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_8;
  res_8 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_9;
    tmpvar_9.w = 1.0;
    tmpvar_9.xyz = tmpvar_2;
    res_8.w = tmpvar_9.w;
    highp vec3 tmpvar_10;
    tmpvar_10 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_8.xyz = tmpvar_10;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_11;
    if (bool(unity_UseLinearSpace)) {
      emission_11 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_11 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_12;
    tmpvar_12.w = 1.0;
    tmpvar_12.xyz = emission_11;
    res_8 = tmpvar_12;
  };
  tmpvar_1 = res_8;
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
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD1;
void main ()
{
  highp vec3 x_1;
  x_1 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_2;
  highp float tmpvar_3;
  tmpvar_3 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_1, x_1))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_2 = tmpvar_3;
  highp vec4 vertex_4;
  vertex_4 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_5;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_5 = 0.0001;
    } else {
      tmpvar_5 = 0.0;
    };
    vertex_4.z = tmpvar_5;
  };
  if (unity_MetaVertexControl.y) {
    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_6;
    if ((vertex_4.z > 0.0)) {
      tmpvar_6 = 0.0001;
    } else {
      tmpvar_6 = 0.0;
    };
    vertex_4.z = tmpvar_6;
  };
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = vertex_4.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float x_7;
  x_7 = (tmpvar_4 - _Cutoff);
  if ((x_7 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_8;
  res_8 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_9;
    tmpvar_9.w = 1.0;
    tmpvar_9.xyz = tmpvar_2;
    res_8.w = tmpvar_9.w;
    highp vec3 tmpvar_10;
    tmpvar_10 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_8.xyz = tmpvar_10;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_11;
    if (bool(unity_UseLinearSpace)) {
      emission_11 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_11 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_12;
    tmpvar_12.w = 1.0;
    tmpvar_12.xyz = emission_11;
    res_8 = tmpvar_12;
  };
  tmpvar_1 = res_8;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "EDITOR_VISUALIZATION" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD1;
void main ()
{
  highp vec3 x_1;
  x_1 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_2;
  highp float tmpvar_3;
  tmpvar_3 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_1, x_1))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_2 = tmpvar_3;
  highp vec4 vertex_4;
  vertex_4 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_5;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_5 = 0.0001;
    } else {
      tmpvar_5 = 0.0;
    };
    vertex_4.z = tmpvar_5;
  };
  if (unity_MetaVertexControl.y) {
    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_6;
    if ((vertex_4.z > 0.0)) {
      tmpvar_6 = 0.0001;
    } else {
      tmpvar_6 = 0.0;
    };
    vertex_4.z = tmpvar_6;
  };
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = vertex_4.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform highp int unity_VisualizationMode;
uniform highp int _CheckAlbedo;
uniform mediump vec4 _AlbedoCompareColor;
uniform mediump float _AlbedoMinLuminance;
uniform mediump float _AlbedoMaxLuminance;
uniform mediump float _AlbedoHueTolerance;
uniform mediump float _AlbedoSaturationTolerance;
uniform mediump vec4 unity_MaterialValidateLowColor;
uniform mediump vec4 unity_MaterialValidateHighColor;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float x_7;
  x_7 = (tmpvar_4 - _Cutoff);
  if ((x_7 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_8;
  res_8 = vec4(0.0, 0.0, 0.0, 0.0);
  if ((unity_VisualizationMode == 0)) {
    mediump vec4 tmpvar_9;
    mediump vec3 baseColor_10;
    baseColor_10 = tmpvar_2;
    highp float value_11;
    value_11 = tmpvar_2.x;
    highp float tmpvar_12;
    if ((value_11 <= 0.04045)) {
      tmpvar_12 = (value_11 / 12.92);
    } else {
      if ((value_11 < 1.0)) {
        tmpvar_12 = pow (((value_11 + 0.055) / 1.055), 2.4);
      } else {
        tmpvar_12 = pow (value_11, 2.2);
      };
    };
    highp float value_13;
    value_13 = tmpvar_2.y;
    highp float tmpvar_14;
    if ((value_13 <= 0.04045)) {
      tmpvar_14 = (value_13 / 12.92);
    } else {
      if ((value_13 < 1.0)) {
        tmpvar_14 = pow (((value_13 + 0.055) / 1.055), 2.4);
      } else {
        tmpvar_14 = pow (value_13, 2.2);
      };
    };
    highp float value_15;
    value_15 = tmpvar_2.z;
    highp float tmpvar_16;
    if ((value_15 <= 0.04045)) {
      tmpvar_16 = (value_15 / 12.92);
    } else {
      if ((value_15 < 1.0)) {
        tmpvar_16 = pow (((value_15 + 0.055) / 1.055), 2.4);
      } else {
        tmpvar_16 = pow (value_15, 2.2);
      };
    };
    highp vec3 tmpvar_17;
    tmpvar_17.x = tmpvar_12;
    tmpvar_17.y = tmpvar_14;
    tmpvar_17.z = tmpvar_16;
    baseColor_10 = tmpvar_17;
    mediump vec3 tmpvar_18;
    tmpvar_18 = vec3(dot (baseColor_10, vec3(0.2126729, 0.7151522, 0.072175)));
    mediump float tmpvar_19;
    if (bool(_CheckAlbedo)) {
      tmpvar_19 = dot (baseColor_10, vec3(0.2126729, 0.7151522, 0.072175));
    } else {
      tmpvar_19 = dot (baseColor_10, vec3(0.3333, 0.3333, 0.3333));
    };
    if ((_CheckAlbedo == 0)) {
      if ((tmpvar_19 < 0.012)) {
        tmpvar_9 = unity_MaterialValidateLowColor;
      } else {
        if ((tmpvar_19 > 0.9)) {
          tmpvar_9 = unity_MaterialValidateHighColor;
        } else {
          mediump vec4 tmpvar_20;
          tmpvar_20.w = 0.0;
          tmpvar_20.xyz = tmpvar_18;
          tmpvar_9 = tmpvar_20;
        };
      };
    } else {
      if ((_AlbedoMinLuminance > tmpvar_19)) {
        tmpvar_9 = unity_MaterialValidateLowColor;
      } else {
        if ((_AlbedoMaxLuminance < tmpvar_19)) {
          tmpvar_9 = unity_MaterialValidateHighColor;
        } else {
          mediump vec3 tmpvar_21;
          if (((tmpvar_2.z > tmpvar_2.y) && (tmpvar_2.z > tmpvar_2.x))) {
            mediump float dominantColor_22;
            dominantColor_22 = tmpvar_2.z;
            mediump float colorone_23;
            colorone_23 = tmpvar_2.x;
            mediump float colortwo_24;
            colortwo_24 = tmpvar_2.y;
            mediump float S_25;
            mediump float H_26;
            if ((tmpvar_2.z != 0.0)) {
              mediump float small_27;
              small_27 = 0.0;
              if ((tmpvar_2.x > tmpvar_2.y)) {
                small_27 = colortwo_24;
              } else {
                small_27 = colorone_23;
              };
              mediump float tmpvar_28;
              tmpvar_28 = (tmpvar_2.z - small_27);
              if ((tmpvar_28 != 0.0)) {
                S_25 = (tmpvar_28 / tmpvar_2.z);
                H_26 = (4.0 + ((tmpvar_2.x - tmpvar_2.y) / tmpvar_28));
              } else {
                S_25 = 0.0;
                H_26 = (4.0 + (tmpvar_2.x - tmpvar_2.y));
              };
              H_26 = (H_26 / 6.0);
              if ((H_26 < 6.0)) {
                H_26 += 1.0;
              };
            } else {
              S_25 = 0.0;
              H_26 = 0.0;
            };
            mediump vec3 tmpvar_29;
            tmpvar_29.x = H_26;
            tmpvar_29.y = S_25;
            tmpvar_29.z = dominantColor_22;
            tmpvar_21 = tmpvar_29;
          } else {
            if ((tmpvar_2.y > tmpvar_2.x)) {
              mediump float dominantColor_30;
              dominantColor_30 = tmpvar_2.y;
              mediump float colorone_31;
              colorone_31 = tmpvar_2.z;
              mediump float colortwo_32;
              colortwo_32 = tmpvar_2.x;
              mediump float S_33;
              mediump float H_34;
              if ((tmpvar_2.y != 0.0)) {
                mediump float small_35;
                small_35 = 0.0;
                if ((tmpvar_2.z > tmpvar_2.x)) {
                  small_35 = colortwo_32;
                } else {
                  small_35 = colorone_31;
                };
                mediump float tmpvar_36;
                tmpvar_36 = (tmpvar_2.y - small_35);
                if ((tmpvar_36 != 0.0)) {
                  S_33 = (tmpvar_36 / tmpvar_2.y);
                  H_34 = (2.0 + ((tmpvar_2.z - tmpvar_2.x) / tmpvar_36));
                } else {
                  S_33 = 0.0;
                  H_34 = (2.0 + (tmpvar_2.z - tmpvar_2.x));
                };
                H_34 = (H_34 / 6.0);
                if ((H_34 < 6.0)) {
                  H_34 += 1.0;
                };
              } else {
                S_33 = 0.0;
                H_34 = 0.0;
              };
              mediump vec3 tmpvar_37;
              tmpvar_37.x = H_34;
              tmpvar_37.y = S_33;
              tmpvar_37.z = dominantColor_30;
              tmpvar_21 = tmpvar_37;
            } else {
              mediump float dominantColor_38;
              dominantColor_38 = tmpvar_2.x;
              mediump float colorone_39;
              colorone_39 = tmpvar_2.y;
              mediump float colortwo_40;
              colortwo_40 = tmpvar_2.z;
              mediump float S_41;
              mediump float H_42;
              if ((tmpvar_2.x != 0.0)) {
                mediump float small_43;
                small_43 = 0.0;
                if ((tmpvar_2.y > tmpvar_2.z)) {
                  small_43 = colortwo_40;
                } else {
                  small_43 = colorone_39;
                };
                mediump float tmpvar_44;
                tmpvar_44 = (tmpvar_2.x - small_43);
                if ((tmpvar_44 != 0.0)) {
                  S_41 = (tmpvar_44 / tmpvar_2.x);
                  H_42 = ((tmpvar_2.y - tmpvar_2.z) / tmpvar_44);
                } else {
                  S_41 = 0.0;
                  H_42 = (tmpvar_2.y - tmpvar_2.z);
                };
                H_42 = (H_42 / 6.0);
                if ((H_42 < 6.0)) {
                  H_42 += 1.0;
                };
              } else {
                S_41 = 0.0;
                H_42 = 0.0;
              };
              mediump vec3 tmpvar_45;
              tmpvar_45.x = H_42;
              tmpvar_45.y = S_41;
              tmpvar_45.z = dominantColor_38;
              tmpvar_21 = tmpvar_45;
            };
          };
          mediump vec3 rgbColor_46;
          rgbColor_46 = _AlbedoCompareColor.xyz;
          mediump vec3 tmpvar_47;
          if (((_AlbedoCompareColor.z > _AlbedoCompareColor.y) && (_AlbedoCompareColor.z > _AlbedoCompareColor.x))) {
            mediump float dominantColor_48;
            dominantColor_48 = rgbColor_46.z;
            mediump float colorone_49;
            colorone_49 = rgbColor_46.x;
            mediump float colortwo_50;
            colortwo_50 = rgbColor_46.y;
            mediump float S_51;
            mediump float H_52;
            if ((_AlbedoCompareColor.z != 0.0)) {
              mediump float small_53;
              small_53 = 0.0;
              if ((_AlbedoCompareColor.x > _AlbedoCompareColor.y)) {
                small_53 = colortwo_50;
              } else {
                small_53 = colorone_49;
              };
              mediump float tmpvar_54;
              tmpvar_54 = (_AlbedoCompareColor.z - small_53);
              if ((tmpvar_54 != 0.0)) {
                S_51 = (tmpvar_54 / _AlbedoCompareColor.z);
                H_52 = (4.0 + ((_AlbedoCompareColor.x - _AlbedoCompareColor.y) / tmpvar_54));
              } else {
                S_51 = 0.0;
                H_52 = (4.0 + (_AlbedoCompareColor.x - _AlbedoCompareColor.y));
              };
              H_52 = (H_52 / 6.0);
              if ((H_52 < 6.0)) {
                H_52 += 1.0;
              };
            } else {
              S_51 = 0.0;
              H_52 = 0.0;
            };
            mediump vec3 tmpvar_55;
            tmpvar_55.x = H_52;
            tmpvar_55.y = S_51;
            tmpvar_55.z = dominantColor_48;
            tmpvar_47 = tmpvar_55;
          } else {
            if ((_AlbedoCompareColor.y > _AlbedoCompareColor.x)) {
              mediump float dominantColor_56;
              dominantColor_56 = rgbColor_46.y;
              mediump float colorone_57;
              colorone_57 = rgbColor_46.z;
              mediump float colortwo_58;
              colortwo_58 = rgbColor_46.x;
              mediump float S_59;
              mediump float H_60;
              if ((_AlbedoCompareColor.y != 0.0)) {
                mediump float small_61;
                small_61 = 0.0;
                if ((_AlbedoCompareColor.z > _AlbedoCompareColor.x)) {
                  small_61 = colortwo_58;
                } else {
                  small_61 = colorone_57;
                };
                mediump float tmpvar_62;
                tmpvar_62 = (_AlbedoCompareColor.y - small_61);
                if ((tmpvar_62 != 0.0)) {
                  S_59 = (tmpvar_62 / _AlbedoCompareColor.y);
                  H_60 = (2.0 + ((_AlbedoCompareColor.z - _AlbedoCompareColor.x) / tmpvar_62));
                } else {
                  S_59 = 0.0;
                  H_60 = (2.0 + (_AlbedoCompareColor.z - _AlbedoCompareColor.x));
                };
                H_60 = (H_60 / 6.0);
                if ((H_60 < 6.0)) {
                  H_60 += 1.0;
                };
              } else {
                S_59 = 0.0;
                H_60 = 0.0;
              };
              mediump vec3 tmpvar_63;
              tmpvar_63.x = H_60;
              tmpvar_63.y = S_59;
              tmpvar_63.z = dominantColor_56;
              tmpvar_47 = tmpvar_63;
            } else {
              mediump float dominantColor_64;
              dominantColor_64 = rgbColor_46.x;
              mediump float colorone_65;
              colorone_65 = rgbColor_46.y;
              mediump float colortwo_66;
              colortwo_66 = rgbColor_46.z;
              mediump float S_67;
              mediump float H_68;
              if ((_AlbedoCompareColor.x != 0.0)) {
                mediump float small_69;
                small_69 = 0.0;
                if ((_AlbedoCompareColor.y > _AlbedoCompareColor.z)) {
                  small_69 = colortwo_66;
                } else {
                  small_69 = colorone_65;
                };
                mediump float tmpvar_70;
                tmpvar_70 = (_AlbedoCompareColor.x - small_69);
                if ((tmpvar_70 != 0.0)) {
                  S_67 = (tmpvar_70 / _AlbedoCompareColor.x);
                  H_68 = ((_AlbedoCompareColor.y - _AlbedoCompareColor.z) / tmpvar_70);
                } else {
                  S_67 = 0.0;
                  H_68 = (_AlbedoCompareColor.y - _AlbedoCompareColor.z);
                };
                H_68 = (H_68 / 6.0);
                if ((H_68 < 6.0)) {
                  H_68 += 1.0;
                };
              } else {
                S_67 = 0.0;
                H_68 = 0.0;
              };
              mediump vec3 tmpvar_71;
              tmpvar_71.x = H_68;
              tmpvar_71.y = S_67;
              tmpvar_71.z = dominantColor_64;
              tmpvar_47 = tmpvar_71;
            };
          };
          if ((((tmpvar_47.y - _AlbedoSaturationTolerance) > tmpvar_21.y) || ((
            (tmpvar_47.x - _AlbedoHueTolerance)
           > tmpvar_21.x) && (
            ((tmpvar_47.x - _AlbedoHueTolerance) + 1.0)
           > tmpvar_21.x)))) {
            tmpvar_9 = unity_MaterialValidateLowColor;
          } else {
            if (((tmpvar_21.y > (tmpvar_47.y + _AlbedoSaturationTolerance)) || ((tmpvar_21.x > 
              (tmpvar_47.x + _AlbedoHueTolerance)
            ) && (tmpvar_21.x > 
              ((tmpvar_47.x + _AlbedoHueTolerance) - 1.0)
            )))) {
              tmpvar_9 = unity_MaterialValidateHighColor;
            } else {
              mediump vec4 tmpvar_72;
              tmpvar_72.w = 0.0;
              tmpvar_72.xyz = tmpvar_18;
              tmpvar_9 = tmpvar_72;
            };
          };
        };
      };
    };
    res_8 = tmpvar_9;
  } else {
    if ((unity_VisualizationMode == 1)) {
      res_8 = unity_MaterialValidateLowColor;
    };
  };
  tmpvar_1 = res_8;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "EDITOR_VISUALIZATION" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD1;
void main ()
{
  highp vec3 x_1;
  x_1 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_2;
  highp float tmpvar_3;
  tmpvar_3 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_1, x_1))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_2 = tmpvar_3;
  highp vec4 vertex_4;
  vertex_4 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_5;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_5 = 0.0001;
    } else {
      tmpvar_5 = 0.0;
    };
    vertex_4.z = tmpvar_5;
  };
  if (unity_MetaVertexControl.y) {
    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_6;
    if ((vertex_4.z > 0.0)) {
      tmpvar_6 = 0.0001;
    } else {
      tmpvar_6 = 0.0;
    };
    vertex_4.z = tmpvar_6;
  };
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = vertex_4.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform highp int unity_VisualizationMode;
uniform highp int _CheckAlbedo;
uniform mediump vec4 _AlbedoCompareColor;
uniform mediump float _AlbedoMinLuminance;
uniform mediump float _AlbedoMaxLuminance;
uniform mediump float _AlbedoHueTolerance;
uniform mediump float _AlbedoSaturationTolerance;
uniform mediump vec4 unity_MaterialValidateLowColor;
uniform mediump vec4 unity_MaterialValidateHighColor;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float x_7;
  x_7 = (tmpvar_4 - _Cutoff);
  if ((x_7 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_8;
  res_8 = vec4(0.0, 0.0, 0.0, 0.0);
  if ((unity_VisualizationMode == 0)) {
    mediump vec4 tmpvar_9;
    mediump vec3 baseColor_10;
    baseColor_10 = tmpvar_2;
    highp float value_11;
    value_11 = tmpvar_2.x;
    highp float tmpvar_12;
    if ((value_11 <= 0.04045)) {
      tmpvar_12 = (value_11 / 12.92);
    } else {
      if ((value_11 < 1.0)) {
        tmpvar_12 = pow (((value_11 + 0.055) / 1.055), 2.4);
      } else {
        tmpvar_12 = pow (value_11, 2.2);
      };
    };
    highp float value_13;
    value_13 = tmpvar_2.y;
    highp float tmpvar_14;
    if ((value_13 <= 0.04045)) {
      tmpvar_14 = (value_13 / 12.92);
    } else {
      if ((value_13 < 1.0)) {
        tmpvar_14 = pow (((value_13 + 0.055) / 1.055), 2.4);
      } else {
        tmpvar_14 = pow (value_13, 2.2);
      };
    };
    highp float value_15;
    value_15 = tmpvar_2.z;
    highp float tmpvar_16;
    if ((value_15 <= 0.04045)) {
      tmpvar_16 = (value_15 / 12.92);
    } else {
      if ((value_15 < 1.0)) {
        tmpvar_16 = pow (((value_15 + 0.055) / 1.055), 2.4);
      } else {
        tmpvar_16 = pow (value_15, 2.2);
      };
    };
    highp vec3 tmpvar_17;
    tmpvar_17.x = tmpvar_12;
    tmpvar_17.y = tmpvar_14;
    tmpvar_17.z = tmpvar_16;
    baseColor_10 = tmpvar_17;
    mediump vec3 tmpvar_18;
    tmpvar_18 = vec3(dot (baseColor_10, vec3(0.2126729, 0.7151522, 0.072175)));
    mediump float tmpvar_19;
    if (bool(_CheckAlbedo)) {
      tmpvar_19 = dot (baseColor_10, vec3(0.2126729, 0.7151522, 0.072175));
    } else {
      tmpvar_19 = dot (baseColor_10, vec3(0.3333, 0.3333, 0.3333));
    };
    if ((_CheckAlbedo == 0)) {
      if ((tmpvar_19 < 0.012)) {
        tmpvar_9 = unity_MaterialValidateLowColor;
      } else {
        if ((tmpvar_19 > 0.9)) {
          tmpvar_9 = unity_MaterialValidateHighColor;
        } else {
          mediump vec4 tmpvar_20;
          tmpvar_20.w = 0.0;
          tmpvar_20.xyz = tmpvar_18;
          tmpvar_9 = tmpvar_20;
        };
      };
    } else {
      if ((_AlbedoMinLuminance > tmpvar_19)) {
        tmpvar_9 = unity_MaterialValidateLowColor;
      } else {
        if ((_AlbedoMaxLuminance < tmpvar_19)) {
          tmpvar_9 = unity_MaterialValidateHighColor;
        } else {
          mediump vec3 tmpvar_21;
          if (((tmpvar_2.z > tmpvar_2.y) && (tmpvar_2.z > tmpvar_2.x))) {
            mediump float dominantColor_22;
            dominantColor_22 = tmpvar_2.z;
            mediump float colorone_23;
            colorone_23 = tmpvar_2.x;
            mediump float colortwo_24;
            colortwo_24 = tmpvar_2.y;
            mediump float S_25;
            mediump float H_26;
            if ((tmpvar_2.z != 0.0)) {
              mediump float small_27;
              small_27 = 0.0;
              if ((tmpvar_2.x > tmpvar_2.y)) {
                small_27 = colortwo_24;
              } else {
                small_27 = colorone_23;
              };
              mediump float tmpvar_28;
              tmpvar_28 = (tmpvar_2.z - small_27);
              if ((tmpvar_28 != 0.0)) {
                S_25 = (tmpvar_28 / tmpvar_2.z);
                H_26 = (4.0 + ((tmpvar_2.x - tmpvar_2.y) / tmpvar_28));
              } else {
                S_25 = 0.0;
                H_26 = (4.0 + (tmpvar_2.x - tmpvar_2.y));
              };
              H_26 = (H_26 / 6.0);
              if ((H_26 < 6.0)) {
                H_26 += 1.0;
              };
            } else {
              S_25 = 0.0;
              H_26 = 0.0;
            };
            mediump vec3 tmpvar_29;
            tmpvar_29.x = H_26;
            tmpvar_29.y = S_25;
            tmpvar_29.z = dominantColor_22;
            tmpvar_21 = tmpvar_29;
          } else {
            if ((tmpvar_2.y > tmpvar_2.x)) {
              mediump float dominantColor_30;
              dominantColor_30 = tmpvar_2.y;
              mediump float colorone_31;
              colorone_31 = tmpvar_2.z;
              mediump float colortwo_32;
              colortwo_32 = tmpvar_2.x;
              mediump float S_33;
              mediump float H_34;
              if ((tmpvar_2.y != 0.0)) {
                mediump float small_35;
                small_35 = 0.0;
                if ((tmpvar_2.z > tmpvar_2.x)) {
                  small_35 = colortwo_32;
                } else {
                  small_35 = colorone_31;
                };
                mediump float tmpvar_36;
                tmpvar_36 = (tmpvar_2.y - small_35);
                if ((tmpvar_36 != 0.0)) {
                  S_33 = (tmpvar_36 / tmpvar_2.y);
                  H_34 = (2.0 + ((tmpvar_2.z - tmpvar_2.x) / tmpvar_36));
                } else {
                  S_33 = 0.0;
                  H_34 = (2.0 + (tmpvar_2.z - tmpvar_2.x));
                };
                H_34 = (H_34 / 6.0);
                if ((H_34 < 6.0)) {
                  H_34 += 1.0;
                };
              } else {
                S_33 = 0.0;
                H_34 = 0.0;
              };
              mediump vec3 tmpvar_37;
              tmpvar_37.x = H_34;
              tmpvar_37.y = S_33;
              tmpvar_37.z = dominantColor_30;
              tmpvar_21 = tmpvar_37;
            } else {
              mediump float dominantColor_38;
              dominantColor_38 = tmpvar_2.x;
              mediump float colorone_39;
              colorone_39 = tmpvar_2.y;
              mediump float colortwo_40;
              colortwo_40 = tmpvar_2.z;
              mediump float S_41;
              mediump float H_42;
              if ((tmpvar_2.x != 0.0)) {
                mediump float small_43;
                small_43 = 0.0;
                if ((tmpvar_2.y > tmpvar_2.z)) {
                  small_43 = colortwo_40;
                } else {
                  small_43 = colorone_39;
                };
                mediump float tmpvar_44;
                tmpvar_44 = (tmpvar_2.x - small_43);
                if ((tmpvar_44 != 0.0)) {
                  S_41 = (tmpvar_44 / tmpvar_2.x);
                  H_42 = ((tmpvar_2.y - tmpvar_2.z) / tmpvar_44);
                } else {
                  S_41 = 0.0;
                  H_42 = (tmpvar_2.y - tmpvar_2.z);
                };
                H_42 = (H_42 / 6.0);
                if ((H_42 < 6.0)) {
                  H_42 += 1.0;
                };
              } else {
                S_41 = 0.0;
                H_42 = 0.0;
              };
              mediump vec3 tmpvar_45;
              tmpvar_45.x = H_42;
              tmpvar_45.y = S_41;
              tmpvar_45.z = dominantColor_38;
              tmpvar_21 = tmpvar_45;
            };
          };
          mediump vec3 rgbColor_46;
          rgbColor_46 = _AlbedoCompareColor.xyz;
          mediump vec3 tmpvar_47;
          if (((_AlbedoCompareColor.z > _AlbedoCompareColor.y) && (_AlbedoCompareColor.z > _AlbedoCompareColor.x))) {
            mediump float dominantColor_48;
            dominantColor_48 = rgbColor_46.z;
            mediump float colorone_49;
            colorone_49 = rgbColor_46.x;
            mediump float colortwo_50;
            colortwo_50 = rgbColor_46.y;
            mediump float S_51;
            mediump float H_52;
            if ((_AlbedoCompareColor.z != 0.0)) {
              mediump float small_53;
              small_53 = 0.0;
              if ((_AlbedoCompareColor.x > _AlbedoCompareColor.y)) {
                small_53 = colortwo_50;
              } else {
                small_53 = colorone_49;
              };
              mediump float tmpvar_54;
              tmpvar_54 = (_AlbedoCompareColor.z - small_53);
              if ((tmpvar_54 != 0.0)) {
                S_51 = (tmpvar_54 / _AlbedoCompareColor.z);
                H_52 = (4.0 + ((_AlbedoCompareColor.x - _AlbedoCompareColor.y) / tmpvar_54));
              } else {
                S_51 = 0.0;
                H_52 = (4.0 + (_AlbedoCompareColor.x - _AlbedoCompareColor.y));
              };
              H_52 = (H_52 / 6.0);
              if ((H_52 < 6.0)) {
                H_52 += 1.0;
              };
            } else {
              S_51 = 0.0;
              H_52 = 0.0;
            };
            mediump vec3 tmpvar_55;
            tmpvar_55.x = H_52;
            tmpvar_55.y = S_51;
            tmpvar_55.z = dominantColor_48;
            tmpvar_47 = tmpvar_55;
          } else {
            if ((_AlbedoCompareColor.y > _AlbedoCompareColor.x)) {
              mediump float dominantColor_56;
              dominantColor_56 = rgbColor_46.y;
              mediump float colorone_57;
              colorone_57 = rgbColor_46.z;
              mediump float colortwo_58;
              colortwo_58 = rgbColor_46.x;
              mediump float S_59;
              mediump float H_60;
              if ((_AlbedoCompareColor.y != 0.0)) {
                mediump float small_61;
                small_61 = 0.0;
                if ((_AlbedoCompareColor.z > _AlbedoCompareColor.x)) {
                  small_61 = colortwo_58;
                } else {
                  small_61 = colorone_57;
                };
                mediump float tmpvar_62;
                tmpvar_62 = (_AlbedoCompareColor.y - small_61);
                if ((tmpvar_62 != 0.0)) {
                  S_59 = (tmpvar_62 / _AlbedoCompareColor.y);
                  H_60 = (2.0 + ((_AlbedoCompareColor.z - _AlbedoCompareColor.x) / tmpvar_62));
                } else {
                  S_59 = 0.0;
                  H_60 = (2.0 + (_AlbedoCompareColor.z - _AlbedoCompareColor.x));
                };
                H_60 = (H_60 / 6.0);
                if ((H_60 < 6.0)) {
                  H_60 += 1.0;
                };
              } else {
                S_59 = 0.0;
                H_60 = 0.0;
              };
              mediump vec3 tmpvar_63;
              tmpvar_63.x = H_60;
              tmpvar_63.y = S_59;
              tmpvar_63.z = dominantColor_56;
              tmpvar_47 = tmpvar_63;
            } else {
              mediump float dominantColor_64;
              dominantColor_64 = rgbColor_46.x;
              mediump float colorone_65;
              colorone_65 = rgbColor_46.y;
              mediump float colortwo_66;
              colortwo_66 = rgbColor_46.z;
              mediump float S_67;
              mediump float H_68;
              if ((_AlbedoCompareColor.x != 0.0)) {
                mediump float small_69;
                small_69 = 0.0;
                if ((_AlbedoCompareColor.y > _AlbedoCompareColor.z)) {
                  small_69 = colortwo_66;
                } else {
                  small_69 = colorone_65;
                };
                mediump float tmpvar_70;
                tmpvar_70 = (_AlbedoCompareColor.x - small_69);
                if ((tmpvar_70 != 0.0)) {
                  S_67 = (tmpvar_70 / _AlbedoCompareColor.x);
                  H_68 = ((_AlbedoCompareColor.y - _AlbedoCompareColor.z) / tmpvar_70);
                } else {
                  S_67 = 0.0;
                  H_68 = (_AlbedoCompareColor.y - _AlbedoCompareColor.z);
                };
                H_68 = (H_68 / 6.0);
                if ((H_68 < 6.0)) {
                  H_68 += 1.0;
                };
              } else {
                S_67 = 0.0;
                H_68 = 0.0;
              };
              mediump vec3 tmpvar_71;
              tmpvar_71.x = H_68;
              tmpvar_71.y = S_67;
              tmpvar_71.z = dominantColor_64;
              tmpvar_47 = tmpvar_71;
            };
          };
          if ((((tmpvar_47.y - _AlbedoSaturationTolerance) > tmpvar_21.y) || ((
            (tmpvar_47.x - _AlbedoHueTolerance)
           > tmpvar_21.x) && (
            ((tmpvar_47.x - _AlbedoHueTolerance) + 1.0)
           > tmpvar_21.x)))) {
            tmpvar_9 = unity_MaterialValidateLowColor;
          } else {
            if (((tmpvar_21.y > (tmpvar_47.y + _AlbedoSaturationTolerance)) || ((tmpvar_21.x > 
              (tmpvar_47.x + _AlbedoHueTolerance)
            ) && (tmpvar_21.x > 
              ((tmpvar_47.x + _AlbedoHueTolerance) - 1.0)
            )))) {
              tmpvar_9 = unity_MaterialValidateHighColor;
            } else {
              mediump vec4 tmpvar_72;
              tmpvar_72.w = 0.0;
              tmpvar_72.xyz = tmpvar_18;
              tmpvar_9 = tmpvar_72;
            };
          };
        };
      };
    };
    res_8 = tmpvar_9;
  } else {
    if ((unity_VisualizationMode == 1)) {
      res_8 = unity_MaterialValidateLowColor;
    };
  };
  tmpvar_1 = res_8;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "EDITOR_VISUALIZATION" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform mediump vec4 unity_FogStart;
uniform mediump vec4 unity_FogEnd;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD1;
void main ()
{
  highp vec3 x_1;
  x_1 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  mediump float tmpvar_2;
  highp float tmpvar_3;
  tmpvar_3 = clamp (((unity_FogEnd.x - 
    sqrt(dot (x_1, x_1))
  ) / (unity_FogEnd.x - unity_FogStart.x)), 0.0, 1.0);
  tmpvar_2 = tmpvar_3;
  highp vec4 vertex_4;
  vertex_4 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_5;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_5 = 0.0001;
    } else {
      tmpvar_5 = 0.0;
    };
    vertex_4.z = tmpvar_5;
  };
  if (unity_MetaVertexControl.y) {
    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_6;
    if ((vertex_4.z > 0.0)) {
      tmpvar_6 = 0.0001;
    } else {
      tmpvar_6 = 0.0;
    };
    vertex_4.z = tmpvar_6;
  };
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = vertex_4.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform highp int unity_VisualizationMode;
uniform highp int _CheckAlbedo;
uniform mediump vec4 _AlbedoCompareColor;
uniform mediump float _AlbedoMinLuminance;
uniform mediump float _AlbedoMaxLuminance;
uniform mediump float _AlbedoHueTolerance;
uniform mediump float _AlbedoSaturationTolerance;
uniform mediump vec4 unity_MaterialValidateLowColor;
uniform mediump vec4 unity_MaterialValidateHighColor;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float x_7;
  x_7 = (tmpvar_4 - _Cutoff);
  if ((x_7 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_8;
  res_8 = vec4(0.0, 0.0, 0.0, 0.0);
  if ((unity_VisualizationMode == 0)) {
    mediump vec4 tmpvar_9;
    mediump vec3 baseColor_10;
    baseColor_10 = tmpvar_2;
    highp float value_11;
    value_11 = tmpvar_2.x;
    highp float tmpvar_12;
    if ((value_11 <= 0.04045)) {
      tmpvar_12 = (value_11 / 12.92);
    } else {
      if ((value_11 < 1.0)) {
        tmpvar_12 = pow (((value_11 + 0.055) / 1.055), 2.4);
      } else {
        tmpvar_12 = pow (value_11, 2.2);
      };
    };
    highp float value_13;
    value_13 = tmpvar_2.y;
    highp float tmpvar_14;
    if ((value_13 <= 0.04045)) {
      tmpvar_14 = (value_13 / 12.92);
    } else {
      if ((value_13 < 1.0)) {
        tmpvar_14 = pow (((value_13 + 0.055) / 1.055), 2.4);
      } else {
        tmpvar_14 = pow (value_13, 2.2);
      };
    };
    highp float value_15;
    value_15 = tmpvar_2.z;
    highp float tmpvar_16;
    if ((value_15 <= 0.04045)) {
      tmpvar_16 = (value_15 / 12.92);
    } else {
      if ((value_15 < 1.0)) {
        tmpvar_16 = pow (((value_15 + 0.055) / 1.055), 2.4);
      } else {
        tmpvar_16 = pow (value_15, 2.2);
      };
    };
    highp vec3 tmpvar_17;
    tmpvar_17.x = tmpvar_12;
    tmpvar_17.y = tmpvar_14;
    tmpvar_17.z = tmpvar_16;
    baseColor_10 = tmpvar_17;
    mediump vec3 tmpvar_18;
    tmpvar_18 = vec3(dot (baseColor_10, vec3(0.2126729, 0.7151522, 0.072175)));
    mediump float tmpvar_19;
    if (bool(_CheckAlbedo)) {
      tmpvar_19 = dot (baseColor_10, vec3(0.2126729, 0.7151522, 0.072175));
    } else {
      tmpvar_19 = dot (baseColor_10, vec3(0.3333, 0.3333, 0.3333));
    };
    if ((_CheckAlbedo == 0)) {
      if ((tmpvar_19 < 0.012)) {
        tmpvar_9 = unity_MaterialValidateLowColor;
      } else {
        if ((tmpvar_19 > 0.9)) {
          tmpvar_9 = unity_MaterialValidateHighColor;
        } else {
          mediump vec4 tmpvar_20;
          tmpvar_20.w = 0.0;
          tmpvar_20.xyz = tmpvar_18;
          tmpvar_9 = tmpvar_20;
        };
      };
    } else {
      if ((_AlbedoMinLuminance > tmpvar_19)) {
        tmpvar_9 = unity_MaterialValidateLowColor;
      } else {
        if ((_AlbedoMaxLuminance < tmpvar_19)) {
          tmpvar_9 = unity_MaterialValidateHighColor;
        } else {
          mediump vec3 tmpvar_21;
          if (((tmpvar_2.z > tmpvar_2.y) && (tmpvar_2.z > tmpvar_2.x))) {
            mediump float dominantColor_22;
            dominantColor_22 = tmpvar_2.z;
            mediump float colorone_23;
            colorone_23 = tmpvar_2.x;
            mediump float colortwo_24;
            colortwo_24 = tmpvar_2.y;
            mediump float S_25;
            mediump float H_26;
            if ((tmpvar_2.z != 0.0)) {
              mediump float small_27;
              small_27 = 0.0;
              if ((tmpvar_2.x > tmpvar_2.y)) {
                small_27 = colortwo_24;
              } else {
                small_27 = colorone_23;
              };
              mediump float tmpvar_28;
              tmpvar_28 = (tmpvar_2.z - small_27);
              if ((tmpvar_28 != 0.0)) {
                S_25 = (tmpvar_28 / tmpvar_2.z);
                H_26 = (4.0 + ((tmpvar_2.x - tmpvar_2.y) / tmpvar_28));
              } else {
                S_25 = 0.0;
                H_26 = (4.0 + (tmpvar_2.x - tmpvar_2.y));
              };
              H_26 = (H_26 / 6.0);
              if ((H_26 < 6.0)) {
                H_26 += 1.0;
              };
            } else {
              S_25 = 0.0;
              H_26 = 0.0;
            };
            mediump vec3 tmpvar_29;
            tmpvar_29.x = H_26;
            tmpvar_29.y = S_25;
            tmpvar_29.z = dominantColor_22;
            tmpvar_21 = tmpvar_29;
          } else {
            if ((tmpvar_2.y > tmpvar_2.x)) {
              mediump float dominantColor_30;
              dominantColor_30 = tmpvar_2.y;
              mediump float colorone_31;
              colorone_31 = tmpvar_2.z;
              mediump float colortwo_32;
              colortwo_32 = tmpvar_2.x;
              mediump float S_33;
              mediump float H_34;
              if ((tmpvar_2.y != 0.0)) {
                mediump float small_35;
                small_35 = 0.0;
                if ((tmpvar_2.z > tmpvar_2.x)) {
                  small_35 = colortwo_32;
                } else {
                  small_35 = colorone_31;
                };
                mediump float tmpvar_36;
                tmpvar_36 = (tmpvar_2.y - small_35);
                if ((tmpvar_36 != 0.0)) {
                  S_33 = (tmpvar_36 / tmpvar_2.y);
                  H_34 = (2.0 + ((tmpvar_2.z - tmpvar_2.x) / tmpvar_36));
                } else {
                  S_33 = 0.0;
                  H_34 = (2.0 + (tmpvar_2.z - tmpvar_2.x));
                };
                H_34 = (H_34 / 6.0);
                if ((H_34 < 6.0)) {
                  H_34 += 1.0;
                };
              } else {
                S_33 = 0.0;
                H_34 = 0.0;
              };
              mediump vec3 tmpvar_37;
              tmpvar_37.x = H_34;
              tmpvar_37.y = S_33;
              tmpvar_37.z = dominantColor_30;
              tmpvar_21 = tmpvar_37;
            } else {
              mediump float dominantColor_38;
              dominantColor_38 = tmpvar_2.x;
              mediump float colorone_39;
              colorone_39 = tmpvar_2.y;
              mediump float colortwo_40;
              colortwo_40 = tmpvar_2.z;
              mediump float S_41;
              mediump float H_42;
              if ((tmpvar_2.x != 0.0)) {
                mediump float small_43;
                small_43 = 0.0;
                if ((tmpvar_2.y > tmpvar_2.z)) {
                  small_43 = colortwo_40;
                } else {
                  small_43 = colorone_39;
                };
                mediump float tmpvar_44;
                tmpvar_44 = (tmpvar_2.x - small_43);
                if ((tmpvar_44 != 0.0)) {
                  S_41 = (tmpvar_44 / tmpvar_2.x);
                  H_42 = ((tmpvar_2.y - tmpvar_2.z) / tmpvar_44);
                } else {
                  S_41 = 0.0;
                  H_42 = (tmpvar_2.y - tmpvar_2.z);
                };
                H_42 = (H_42 / 6.0);
                if ((H_42 < 6.0)) {
                  H_42 += 1.0;
                };
              } else {
                S_41 = 0.0;
                H_42 = 0.0;
              };
              mediump vec3 tmpvar_45;
              tmpvar_45.x = H_42;
              tmpvar_45.y = S_41;
              tmpvar_45.z = dominantColor_38;
              tmpvar_21 = tmpvar_45;
            };
          };
          mediump vec3 rgbColor_46;
          rgbColor_46 = _AlbedoCompareColor.xyz;
          mediump vec3 tmpvar_47;
          if (((_AlbedoCompareColor.z > _AlbedoCompareColor.y) && (_AlbedoCompareColor.z > _AlbedoCompareColor.x))) {
            mediump float dominantColor_48;
            dominantColor_48 = rgbColor_46.z;
            mediump float colorone_49;
            colorone_49 = rgbColor_46.x;
            mediump float colortwo_50;
            colortwo_50 = rgbColor_46.y;
            mediump float S_51;
            mediump float H_52;
            if ((_AlbedoCompareColor.z != 0.0)) {
              mediump float small_53;
              small_53 = 0.0;
              if ((_AlbedoCompareColor.x > _AlbedoCompareColor.y)) {
                small_53 = colortwo_50;
              } else {
                small_53 = colorone_49;
              };
              mediump float tmpvar_54;
              tmpvar_54 = (_AlbedoCompareColor.z - small_53);
              if ((tmpvar_54 != 0.0)) {
                S_51 = (tmpvar_54 / _AlbedoCompareColor.z);
                H_52 = (4.0 + ((_AlbedoCompareColor.x - _AlbedoCompareColor.y) / tmpvar_54));
              } else {
                S_51 = 0.0;
                H_52 = (4.0 + (_AlbedoCompareColor.x - _AlbedoCompareColor.y));
              };
              H_52 = (H_52 / 6.0);
              if ((H_52 < 6.0)) {
                H_52 += 1.0;
              };
            } else {
              S_51 = 0.0;
              H_52 = 0.0;
            };
            mediump vec3 tmpvar_55;
            tmpvar_55.x = H_52;
            tmpvar_55.y = S_51;
            tmpvar_55.z = dominantColor_48;
            tmpvar_47 = tmpvar_55;
          } else {
            if ((_AlbedoCompareColor.y > _AlbedoCompareColor.x)) {
              mediump float dominantColor_56;
              dominantColor_56 = rgbColor_46.y;
              mediump float colorone_57;
              colorone_57 = rgbColor_46.z;
              mediump float colortwo_58;
              colortwo_58 = rgbColor_46.x;
              mediump float S_59;
              mediump float H_60;
              if ((_AlbedoCompareColor.y != 0.0)) {
                mediump float small_61;
                small_61 = 0.0;
                if ((_AlbedoCompareColor.z > _AlbedoCompareColor.x)) {
                  small_61 = colortwo_58;
                } else {
                  small_61 = colorone_57;
                };
                mediump float tmpvar_62;
                tmpvar_62 = (_AlbedoCompareColor.y - small_61);
                if ((tmpvar_62 != 0.0)) {
                  S_59 = (tmpvar_62 / _AlbedoCompareColor.y);
                  H_60 = (2.0 + ((_AlbedoCompareColor.z - _AlbedoCompareColor.x) / tmpvar_62));
                } else {
                  S_59 = 0.0;
                  H_60 = (2.0 + (_AlbedoCompareColor.z - _AlbedoCompareColor.x));
                };
                H_60 = (H_60 / 6.0);
                if ((H_60 < 6.0)) {
                  H_60 += 1.0;
                };
              } else {
                S_59 = 0.0;
                H_60 = 0.0;
              };
              mediump vec3 tmpvar_63;
              tmpvar_63.x = H_60;
              tmpvar_63.y = S_59;
              tmpvar_63.z = dominantColor_56;
              tmpvar_47 = tmpvar_63;
            } else {
              mediump float dominantColor_64;
              dominantColor_64 = rgbColor_46.x;
              mediump float colorone_65;
              colorone_65 = rgbColor_46.y;
              mediump float colortwo_66;
              colortwo_66 = rgbColor_46.z;
              mediump float S_67;
              mediump float H_68;
              if ((_AlbedoCompareColor.x != 0.0)) {
                mediump float small_69;
                small_69 = 0.0;
                if ((_AlbedoCompareColor.y > _AlbedoCompareColor.z)) {
                  small_69 = colortwo_66;
                } else {
                  small_69 = colorone_65;
                };
                mediump float tmpvar_70;
                tmpvar_70 = (_AlbedoCompareColor.x - small_69);
                if ((tmpvar_70 != 0.0)) {
                  S_67 = (tmpvar_70 / _AlbedoCompareColor.x);
                  H_68 = ((_AlbedoCompareColor.y - _AlbedoCompareColor.z) / tmpvar_70);
                } else {
                  S_67 = 0.0;
                  H_68 = (_AlbedoCompareColor.y - _AlbedoCompareColor.z);
                };
                H_68 = (H_68 / 6.0);
                if ((H_68 < 6.0)) {
                  H_68 += 1.0;
                };
              } else {
                S_67 = 0.0;
                H_68 = 0.0;
              };
              mediump vec3 tmpvar_71;
              tmpvar_71.x = H_68;
              tmpvar_71.y = S_67;
              tmpvar_71.z = dominantColor_64;
              tmpvar_47 = tmpvar_71;
            };
          };
          if ((((tmpvar_47.y - _AlbedoSaturationTolerance) > tmpvar_21.y) || ((
            (tmpvar_47.x - _AlbedoHueTolerance)
           > tmpvar_21.x) && (
            ((tmpvar_47.x - _AlbedoHueTolerance) + 1.0)
           > tmpvar_21.x)))) {
            tmpvar_9 = unity_MaterialValidateLowColor;
          } else {
            if (((tmpvar_21.y > (tmpvar_47.y + _AlbedoSaturationTolerance)) || ((tmpvar_21.x > 
              (tmpvar_47.x + _AlbedoHueTolerance)
            ) && (tmpvar_21.x > 
              ((tmpvar_47.x + _AlbedoHueTolerance) - 1.0)
            )))) {
              tmpvar_9 = unity_MaterialValidateHighColor;
            } else {
              mediump vec4 tmpvar_72;
              tmpvar_72.w = 0.0;
              tmpvar_72.xyz = tmpvar_18;
              tmpvar_9 = tmpvar_72;
            };
          };
        };
      };
    };
    res_8 = tmpvar_9;
  } else {
    if ((unity_VisualizationMode == 1)) {
      res_8 = unity_MaterialValidateLowColor;
    };
  };
  tmpvar_1 = res_8;
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
SubProgram "gles hw_tier00 " {
Keywords { "EDITOR_VISUALIZATION" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "EDITOR_VISUALIZATION" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "EDITOR_VISUALIZATION" }
""
}
}
}
}
Fallback "Unlit/Transparent"
}