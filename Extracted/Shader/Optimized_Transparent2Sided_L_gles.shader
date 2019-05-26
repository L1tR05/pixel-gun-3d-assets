//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Optimized/Transparent2Sided_L" {
Properties {
_MainTex ("Albedo (RGB)", 2D) = "white" { }
_CutOff ("cut", Range(0, 1)) = 0.3
}
SubShader {
 LOD 200
 Tags { "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  LOD 200
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
  GpuProgramID 34293
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_6;
  mediump vec4 normal_8;
  normal_8 = tmpvar_7;
  mediump vec3 res_9;
  mediump vec3 x_10;
  x_10.x = dot (unity_SHAr, normal_8);
  x_10.y = dot (unity_SHAg, normal_8);
  x_10.z = dot (unity_SHAb, normal_8);
  mediump vec3 x1_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = (normal_8.xyzz * normal_8.yzzx);
  x1_11.x = dot (unity_SHBr, tmpvar_12);
  x1_11.y = dot (unity_SHBg, tmpvar_12);
  x1_11.z = dot (unity_SHBb, tmpvar_12);
  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
    ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y))
  )));
  mediump vec3 tmpvar_13;
  tmpvar_13 = max (((1.055 * 
    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_9 = tmpvar_13;
  shlight_1 = tmpvar_13;
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_6;
  mediump vec4 normal_8;
  normal_8 = tmpvar_7;
  mediump vec3 res_9;
  mediump vec3 x_10;
  x_10.x = dot (unity_SHAr, normal_8);
  x_10.y = dot (unity_SHAg, normal_8);
  x_10.z = dot (unity_SHAb, normal_8);
  mediump vec3 x1_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = (normal_8.xyzz * normal_8.yzzx);
  x1_11.x = dot (unity_SHBr, tmpvar_12);
  x1_11.y = dot (unity_SHBg, tmpvar_12);
  x1_11.z = dot (unity_SHBb, tmpvar_12);
  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
    ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y))
  )));
  mediump vec3 tmpvar_13;
  tmpvar_13 = max (((1.055 * 
    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_9 = tmpvar_13;
  shlight_1 = tmpvar_13;
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_6;
  mediump vec4 normal_8;
  normal_8 = tmpvar_7;
  mediump vec3 res_9;
  mediump vec3 x_10;
  x_10.x = dot (unity_SHAr, normal_8);
  x_10.y = dot (unity_SHAg, normal_8);
  x_10.z = dot (unity_SHAb, normal_8);
  mediump vec3 x1_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = (normal_8.xyzz * normal_8.yzzx);
  x1_11.x = dot (unity_SHBr, tmpvar_12);
  x1_11.y = dot (unity_SHBg, tmpvar_12);
  x1_11.z = dot (unity_SHBb, tmpvar_12);
  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
    ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y))
  )));
  mediump vec3 tmpvar_13;
  tmpvar_13 = max (((1.055 * 
    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_9 = tmpvar_13;
  shlight_1 = tmpvar_13;
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
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
  tmpvar_2 = col_12;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
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
  tmpvar_2 = col_12;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
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
  tmpvar_2 = col_12;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec4 normal_9;
  normal_9 = tmpvar_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, normal_9);
  x_11.y = dot (unity_SHAg, normal_9);
  x_11.z = dot (unity_SHAb, normal_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_9.xyzz * normal_9.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_10 = tmpvar_14;
  shlight_1 = tmpvar_14;
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_15;
  lightColor0_15 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_16;
  lightColor1_16 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_17;
  lightColor2_17 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_18;
  lightColor3_18 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_19;
  lightAttenSq_19 = unity_4LightAtten0;
  highp vec3 col_20;
  highp vec4 ndotl_21;
  highp vec4 lengthSq_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_22 = (tmpvar_23 * tmpvar_23);
  lengthSq_22 = (lengthSq_22 + (tmpvar_24 * tmpvar_24));
  lengthSq_22 = (lengthSq_22 + (tmpvar_25 * tmpvar_25));
  highp vec4 tmpvar_26;
  tmpvar_26 = max (lengthSq_22, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_22 = tmpvar_26;
  ndotl_21 = (tmpvar_23 * tmpvar_7.x);
  ndotl_21 = (ndotl_21 + (tmpvar_24 * tmpvar_7.y));
  ndotl_21 = (ndotl_21 + (tmpvar_25 * tmpvar_7.z));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_21 * inversesqrt(tmpvar_26)));
  ndotl_21 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_27 * (1.0/((1.0 + 
    (tmpvar_26 * lightAttenSq_19)
  ))));
  col_20 = (lightColor0_15 * tmpvar_28.x);
  col_20 = (col_20 + (lightColor1_16 * tmpvar_28.y));
  col_20 = (col_20 + (lightColor2_17 * tmpvar_28.z));
  col_20 = (col_20 + (lightColor3_18 * tmpvar_28.w));
  tmpvar_3 = (tmpvar_3 + col_20);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec4 normal_9;
  normal_9 = tmpvar_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, normal_9);
  x_11.y = dot (unity_SHAg, normal_9);
  x_11.z = dot (unity_SHAb, normal_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_9.xyzz * normal_9.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_10 = tmpvar_14;
  shlight_1 = tmpvar_14;
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_15;
  lightColor0_15 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_16;
  lightColor1_16 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_17;
  lightColor2_17 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_18;
  lightColor3_18 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_19;
  lightAttenSq_19 = unity_4LightAtten0;
  highp vec3 col_20;
  highp vec4 ndotl_21;
  highp vec4 lengthSq_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_22 = (tmpvar_23 * tmpvar_23);
  lengthSq_22 = (lengthSq_22 + (tmpvar_24 * tmpvar_24));
  lengthSq_22 = (lengthSq_22 + (tmpvar_25 * tmpvar_25));
  highp vec4 tmpvar_26;
  tmpvar_26 = max (lengthSq_22, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_22 = tmpvar_26;
  ndotl_21 = (tmpvar_23 * tmpvar_7.x);
  ndotl_21 = (ndotl_21 + (tmpvar_24 * tmpvar_7.y));
  ndotl_21 = (ndotl_21 + (tmpvar_25 * tmpvar_7.z));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_21 * inversesqrt(tmpvar_26)));
  ndotl_21 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_27 * (1.0/((1.0 + 
    (tmpvar_26 * lightAttenSq_19)
  ))));
  col_20 = (lightColor0_15 * tmpvar_28.x);
  col_20 = (col_20 + (lightColor1_16 * tmpvar_28.y));
  col_20 = (col_20 + (lightColor2_17 * tmpvar_28.z));
  col_20 = (col_20 + (lightColor3_18 * tmpvar_28.w));
  tmpvar_3 = (tmpvar_3 + col_20);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec4 normal_9;
  normal_9 = tmpvar_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, normal_9);
  x_11.y = dot (unity_SHAg, normal_9);
  x_11.z = dot (unity_SHAb, normal_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_9.xyzz * normal_9.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_10 = tmpvar_14;
  shlight_1 = tmpvar_14;
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_15;
  lightColor0_15 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_16;
  lightColor1_16 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_17;
  lightColor2_17 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_18;
  lightColor3_18 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_19;
  lightAttenSq_19 = unity_4LightAtten0;
  highp vec3 col_20;
  highp vec4 ndotl_21;
  highp vec4 lengthSq_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_22 = (tmpvar_23 * tmpvar_23);
  lengthSq_22 = (lengthSq_22 + (tmpvar_24 * tmpvar_24));
  lengthSq_22 = (lengthSq_22 + (tmpvar_25 * tmpvar_25));
  highp vec4 tmpvar_26;
  tmpvar_26 = max (lengthSq_22, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_22 = tmpvar_26;
  ndotl_21 = (tmpvar_23 * tmpvar_7.x);
  ndotl_21 = (ndotl_21 + (tmpvar_24 * tmpvar_7.y));
  ndotl_21 = (ndotl_21 + (tmpvar_25 * tmpvar_7.z));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_21 * inversesqrt(tmpvar_26)));
  ndotl_21 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_27 * (1.0/((1.0 + 
    (tmpvar_26 * lightAttenSq_19)
  ))));
  col_20 = (lightColor0_15 * tmpvar_28.x);
  col_20 = (col_20 + (lightColor1_16 * tmpvar_28.y));
  col_20 = (col_20 + (lightColor2_17 * tmpvar_28.z));
  col_20 = (col_20 + (lightColor3_18 * tmpvar_28.w));
  tmpvar_3 = (tmpvar_3 + col_20);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_13;
  tmpvar_13 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_13));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_13;
  tmpvar_13 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_13));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_13;
  tmpvar_13 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_13));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec4 normal_9;
  normal_9 = tmpvar_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, normal_9);
  x_11.y = dot (unity_SHAg, normal_9);
  x_11.z = dot (unity_SHAb, normal_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_9.xyzz * normal_9.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_10 = tmpvar_14;
  shlight_1 = tmpvar_14;
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_13;
  tmpvar_13 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_13));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec4 normal_9;
  normal_9 = tmpvar_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, normal_9);
  x_11.y = dot (unity_SHAg, normal_9);
  x_11.z = dot (unity_SHAb, normal_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_9.xyzz * normal_9.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_10 = tmpvar_14;
  shlight_1 = tmpvar_14;
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_13;
  tmpvar_13 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_13));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec4 normal_9;
  normal_9 = tmpvar_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, normal_9);
  x_11.y = dot (unity_SHAg, normal_9);
  x_11.z = dot (unity_SHAb, normal_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_9.xyzz * normal_9.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_10 = tmpvar_14;
  shlight_1 = tmpvar_14;
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_13;
  tmpvar_13 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_13));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 lightColor0_8;
  lightColor0_8 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_9;
  lightColor1_9 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_10;
  lightColor2_10 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_11;
  lightColor3_11 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_12;
  lightAttenSq_12 = unity_4LightAtten0;
  highp vec3 col_13;
  highp vec4 ndotl_14;
  highp vec4 lengthSq_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_15 = (tmpvar_16 * tmpvar_16);
  lengthSq_15 = (lengthSq_15 + (tmpvar_17 * tmpvar_17));
  lengthSq_15 = (lengthSq_15 + (tmpvar_18 * tmpvar_18));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (lengthSq_15, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_15 = tmpvar_19;
  ndotl_14 = (tmpvar_16 * tmpvar_7.x);
  ndotl_14 = (ndotl_14 + (tmpvar_17 * tmpvar_7.y));
  ndotl_14 = (ndotl_14 + (tmpvar_18 * tmpvar_7.z));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_14 * inversesqrt(tmpvar_19)));
  ndotl_14 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_20 * (1.0/((1.0 + 
    (tmpvar_19 * lightAttenSq_12)
  ))));
  col_13 = (lightColor0_8 * tmpvar_21.x);
  col_13 = (col_13 + (lightColor1_9 * tmpvar_21.y));
  col_13 = (col_13 + (lightColor2_10 * tmpvar_21.z));
  col_13 = (col_13 + (lightColor3_11 * tmpvar_21.w));
  tmpvar_2 = col_13;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_13;
  tmpvar_13 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_13));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 lightColor0_8;
  lightColor0_8 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_9;
  lightColor1_9 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_10;
  lightColor2_10 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_11;
  lightColor3_11 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_12;
  lightAttenSq_12 = unity_4LightAtten0;
  highp vec3 col_13;
  highp vec4 ndotl_14;
  highp vec4 lengthSq_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_15 = (tmpvar_16 * tmpvar_16);
  lengthSq_15 = (lengthSq_15 + (tmpvar_17 * tmpvar_17));
  lengthSq_15 = (lengthSq_15 + (tmpvar_18 * tmpvar_18));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (lengthSq_15, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_15 = tmpvar_19;
  ndotl_14 = (tmpvar_16 * tmpvar_7.x);
  ndotl_14 = (ndotl_14 + (tmpvar_17 * tmpvar_7.y));
  ndotl_14 = (ndotl_14 + (tmpvar_18 * tmpvar_7.z));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_14 * inversesqrt(tmpvar_19)));
  ndotl_14 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_20 * (1.0/((1.0 + 
    (tmpvar_19 * lightAttenSq_12)
  ))));
  col_13 = (lightColor0_8 * tmpvar_21.x);
  col_13 = (col_13 + (lightColor1_9 * tmpvar_21.y));
  col_13 = (col_13 + (lightColor2_10 * tmpvar_21.z));
  col_13 = (col_13 + (lightColor3_11 * tmpvar_21.w));
  tmpvar_2 = col_13;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_13;
  tmpvar_13 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_13));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 lightColor0_8;
  lightColor0_8 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_9;
  lightColor1_9 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_10;
  lightColor2_10 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_11;
  lightColor3_11 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_12;
  lightAttenSq_12 = unity_4LightAtten0;
  highp vec3 col_13;
  highp vec4 ndotl_14;
  highp vec4 lengthSq_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_15 = (tmpvar_16 * tmpvar_16);
  lengthSq_15 = (lengthSq_15 + (tmpvar_17 * tmpvar_17));
  lengthSq_15 = (lengthSq_15 + (tmpvar_18 * tmpvar_18));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (lengthSq_15, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_15 = tmpvar_19;
  ndotl_14 = (tmpvar_16 * tmpvar_7.x);
  ndotl_14 = (ndotl_14 + (tmpvar_17 * tmpvar_7.y));
  ndotl_14 = (ndotl_14 + (tmpvar_18 * tmpvar_7.z));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_14 * inversesqrt(tmpvar_19)));
  ndotl_14 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_20 * (1.0/((1.0 + 
    (tmpvar_19 * lightAttenSq_12)
  ))));
  col_13 = (lightColor0_8 * tmpvar_21.x);
  col_13 = (col_13 + (lightColor1_9 * tmpvar_21.y));
  col_13 = (col_13 + (lightColor2_10 * tmpvar_21.z));
  col_13 = (col_13 + (lightColor3_11 * tmpvar_21.w));
  tmpvar_2 = col_13;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_13;
  tmpvar_13 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_13));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
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
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_16;
  lightColor0_16 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_17;
  lightColor1_17 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_18;
  lightColor2_18 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_19;
  lightColor3_19 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_20;
  lightAttenSq_20 = unity_4LightAtten0;
  highp vec3 col_21;
  highp vec4 ndotl_22;
  highp vec4 lengthSq_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_23 = (tmpvar_24 * tmpvar_24);
  lengthSq_23 = (lengthSq_23 + (tmpvar_25 * tmpvar_25));
  lengthSq_23 = (lengthSq_23 + (tmpvar_26 * tmpvar_26));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (lengthSq_23, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_23 = tmpvar_27;
  ndotl_22 = (tmpvar_24 * tmpvar_8.x);
  ndotl_22 = (ndotl_22 + (tmpvar_25 * tmpvar_8.y));
  ndotl_22 = (ndotl_22 + (tmpvar_26 * tmpvar_8.z));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_22 * inversesqrt(tmpvar_27)));
  ndotl_22 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_28 * (1.0/((1.0 + 
    (tmpvar_27 * lightAttenSq_20)
  ))));
  col_21 = (lightColor0_16 * tmpvar_29.x);
  col_21 = (col_21 + (lightColor1_17 * tmpvar_29.y));
  col_21 = (col_21 + (lightColor2_18 * tmpvar_29.z));
  col_21 = (col_21 + (lightColor3_19 * tmpvar_29.w));
  tmpvar_3 = (tmpvar_3 + col_21);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_13;
  tmpvar_13 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_13));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
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
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_16;
  lightColor0_16 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_17;
  lightColor1_17 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_18;
  lightColor2_18 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_19;
  lightColor3_19 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_20;
  lightAttenSq_20 = unity_4LightAtten0;
  highp vec3 col_21;
  highp vec4 ndotl_22;
  highp vec4 lengthSq_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_23 = (tmpvar_24 * tmpvar_24);
  lengthSq_23 = (lengthSq_23 + (tmpvar_25 * tmpvar_25));
  lengthSq_23 = (lengthSq_23 + (tmpvar_26 * tmpvar_26));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (lengthSq_23, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_23 = tmpvar_27;
  ndotl_22 = (tmpvar_24 * tmpvar_8.x);
  ndotl_22 = (ndotl_22 + (tmpvar_25 * tmpvar_8.y));
  ndotl_22 = (ndotl_22 + (tmpvar_26 * tmpvar_8.z));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_22 * inversesqrt(tmpvar_27)));
  ndotl_22 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_28 * (1.0/((1.0 + 
    (tmpvar_27 * lightAttenSq_20)
  ))));
  col_21 = (lightColor0_16 * tmpvar_29.x);
  col_21 = (col_21 + (lightColor1_17 * tmpvar_29.y));
  col_21 = (col_21 + (lightColor2_18 * tmpvar_29.z));
  col_21 = (col_21 + (lightColor3_19 * tmpvar_29.w));
  tmpvar_3 = (tmpvar_3 + col_21);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_13;
  tmpvar_13 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_13));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
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
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_16;
  lightColor0_16 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_17;
  lightColor1_17 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_18;
  lightColor2_18 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_19;
  lightColor3_19 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_20;
  lightAttenSq_20 = unity_4LightAtten0;
  highp vec3 col_21;
  highp vec4 ndotl_22;
  highp vec4 lengthSq_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_23 = (tmpvar_24 * tmpvar_24);
  lengthSq_23 = (lengthSq_23 + (tmpvar_25 * tmpvar_25));
  lengthSq_23 = (lengthSq_23 + (tmpvar_26 * tmpvar_26));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (lengthSq_23, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_23 = tmpvar_27;
  ndotl_22 = (tmpvar_24 * tmpvar_8.x);
  ndotl_22 = (ndotl_22 + (tmpvar_25 * tmpvar_8.y));
  ndotl_22 = (ndotl_22 + (tmpvar_26 * tmpvar_8.z));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_22 * inversesqrt(tmpvar_27)));
  ndotl_22 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_28 * (1.0/((1.0 + 
    (tmpvar_27 * lightAttenSq_20)
  ))));
  col_21 = (lightColor0_16 * tmpvar_29.x);
  col_21 = (col_21 + (lightColor1_17 * tmpvar_29.y));
  col_21 = (col_21 + (lightColor2_18 * tmpvar_29.z));
  col_21 = (col_21 + (lightColor3_19 * tmpvar_29.w));
  tmpvar_3 = (tmpvar_3 + col_21);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_2, lightDir_9));
  diff_11 = tmpvar_12;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_13;
  tmpvar_13 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_13));
  gl_FragData[0] = c_1;
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
  Name "META"
  LOD 200
  Tags { "LIGHTMODE" = "META" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
  Cull Off
  GpuProgramID 85261
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
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
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
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec2 tmpvar_3;
  tmpvar_3 = xlv_TEXCOORD0;
  lowp vec3 tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_3);
  tmpvar_4 = tmpvar_5.xyz;
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_4;
  mediump vec4 res_7;
  res_7 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = tmpvar_2;
    res_7.w = tmpvar_8.w;
    highp vec3 tmpvar_9;
    tmpvar_9 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_7.xyz = tmpvar_9;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_10;
    if (bool(unity_UseLinearSpace)) {
      emission_10 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_10 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = emission_10;
    res_7 = tmpvar_11;
  };
  tmpvar_1 = res_7;
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
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
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
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec2 tmpvar_3;
  tmpvar_3 = xlv_TEXCOORD0;
  lowp vec3 tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_3);
  tmpvar_4 = tmpvar_5.xyz;
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_4;
  mediump vec4 res_7;
  res_7 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = tmpvar_2;
    res_7.w = tmpvar_8.w;
    highp vec3 tmpvar_9;
    tmpvar_9 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_7.xyz = tmpvar_9;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_10;
    if (bool(unity_UseLinearSpace)) {
      emission_10 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_10 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = emission_10;
    res_7 = tmpvar_11;
  };
  tmpvar_1 = res_7;
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
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
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
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec2 tmpvar_3;
  tmpvar_3 = xlv_TEXCOORD0;
  lowp vec3 tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_3);
  tmpvar_4 = tmpvar_5.xyz;
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_4;
  mediump vec4 res_7;
  res_7 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = tmpvar_2;
    res_7.w = tmpvar_8.w;
    highp vec3 tmpvar_9;
    tmpvar_9 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_7.xyz = tmpvar_9;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_10;
    if (bool(unity_UseLinearSpace)) {
      emission_10 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_10 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = emission_10;
    res_7 = tmpvar_11;
  };
  tmpvar_1 = res_7;
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
  Name "FORWARD"
  LOD 200
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
  Cull Front
  GpuProgramID 187399
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_6;
  mediump vec4 normal_8;
  normal_8 = tmpvar_7;
  mediump vec3 res_9;
  mediump vec3 x_10;
  x_10.x = dot (unity_SHAr, normal_8);
  x_10.y = dot (unity_SHAg, normal_8);
  x_10.z = dot (unity_SHAb, normal_8);
  mediump vec3 x1_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = (normal_8.xyzz * normal_8.yzzx);
  x1_11.x = dot (unity_SHBr, tmpvar_12);
  x1_11.y = dot (unity_SHBg, tmpvar_12);
  x1_11.z = dot (unity_SHBb, tmpvar_12);
  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
    ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y))
  )));
  mediump vec3 tmpvar_13;
  tmpvar_13 = max (((1.055 * 
    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_9 = tmpvar_13;
  shlight_1 = tmpvar_13;
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_6;
  mediump vec4 normal_8;
  normal_8 = tmpvar_7;
  mediump vec3 res_9;
  mediump vec3 x_10;
  x_10.x = dot (unity_SHAr, normal_8);
  x_10.y = dot (unity_SHAg, normal_8);
  x_10.z = dot (unity_SHAb, normal_8);
  mediump vec3 x1_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = (normal_8.xyzz * normal_8.yzzx);
  x1_11.x = dot (unity_SHBr, tmpvar_12);
  x1_11.y = dot (unity_SHBg, tmpvar_12);
  x1_11.z = dot (unity_SHBb, tmpvar_12);
  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
    ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y))
  )));
  mediump vec3 tmpvar_13;
  tmpvar_13 = max (((1.055 * 
    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_9 = tmpvar_13;
  shlight_1 = tmpvar_13;
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_6;
  mediump vec4 normal_8;
  normal_8 = tmpvar_7;
  mediump vec3 res_9;
  mediump vec3 x_10;
  x_10.x = dot (unity_SHAr, normal_8);
  x_10.y = dot (unity_SHAg, normal_8);
  x_10.z = dot (unity_SHAb, normal_8);
  mediump vec3 x1_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = (normal_8.xyzz * normal_8.yzzx);
  x1_11.x = dot (unity_SHBr, tmpvar_12);
  x1_11.y = dot (unity_SHBg, tmpvar_12);
  x1_11.z = dot (unity_SHBb, tmpvar_12);
  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
    ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y))
  )));
  mediump vec3 tmpvar_13;
  tmpvar_13 = max (((1.055 * 
    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_9 = tmpvar_13;
  shlight_1 = tmpvar_13;
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  gl_FragData[0] = c_3;
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
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
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
  tmpvar_2 = col_12;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
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
  tmpvar_2 = col_12;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec2 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
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
  tmpvar_2 = col_12;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec4 normal_9;
  normal_9 = tmpvar_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, normal_9);
  x_11.y = dot (unity_SHAg, normal_9);
  x_11.z = dot (unity_SHAb, normal_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_9.xyzz * normal_9.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_10 = tmpvar_14;
  shlight_1 = tmpvar_14;
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_15;
  lightColor0_15 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_16;
  lightColor1_16 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_17;
  lightColor2_17 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_18;
  lightColor3_18 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_19;
  lightAttenSq_19 = unity_4LightAtten0;
  highp vec3 col_20;
  highp vec4 ndotl_21;
  highp vec4 lengthSq_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_22 = (tmpvar_23 * tmpvar_23);
  lengthSq_22 = (lengthSq_22 + (tmpvar_24 * tmpvar_24));
  lengthSq_22 = (lengthSq_22 + (tmpvar_25 * tmpvar_25));
  highp vec4 tmpvar_26;
  tmpvar_26 = max (lengthSq_22, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_22 = tmpvar_26;
  ndotl_21 = (tmpvar_23 * tmpvar_7.x);
  ndotl_21 = (ndotl_21 + (tmpvar_24 * tmpvar_7.y));
  ndotl_21 = (ndotl_21 + (tmpvar_25 * tmpvar_7.z));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_21 * inversesqrt(tmpvar_26)));
  ndotl_21 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_27 * (1.0/((1.0 + 
    (tmpvar_26 * lightAttenSq_19)
  ))));
  col_20 = (lightColor0_15 * tmpvar_28.x);
  col_20 = (col_20 + (lightColor1_16 * tmpvar_28.y));
  col_20 = (col_20 + (lightColor2_17 * tmpvar_28.z));
  col_20 = (col_20 + (lightColor3_18 * tmpvar_28.w));
  tmpvar_3 = (tmpvar_3 + col_20);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec4 normal_9;
  normal_9 = tmpvar_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, normal_9);
  x_11.y = dot (unity_SHAg, normal_9);
  x_11.z = dot (unity_SHAb, normal_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_9.xyzz * normal_9.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_10 = tmpvar_14;
  shlight_1 = tmpvar_14;
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_15;
  lightColor0_15 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_16;
  lightColor1_16 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_17;
  lightColor2_17 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_18;
  lightColor3_18 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_19;
  lightAttenSq_19 = unity_4LightAtten0;
  highp vec3 col_20;
  highp vec4 ndotl_21;
  highp vec4 lengthSq_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_22 = (tmpvar_23 * tmpvar_23);
  lengthSq_22 = (lengthSq_22 + (tmpvar_24 * tmpvar_24));
  lengthSq_22 = (lengthSq_22 + (tmpvar_25 * tmpvar_25));
  highp vec4 tmpvar_26;
  tmpvar_26 = max (lengthSq_22, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_22 = tmpvar_26;
  ndotl_21 = (tmpvar_23 * tmpvar_7.x);
  ndotl_21 = (ndotl_21 + (tmpvar_24 * tmpvar_7.y));
  ndotl_21 = (ndotl_21 + (tmpvar_25 * tmpvar_7.z));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_21 * inversesqrt(tmpvar_26)));
  ndotl_21 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_27 * (1.0/((1.0 + 
    (tmpvar_26 * lightAttenSq_19)
  ))));
  col_20 = (lightColor0_15 * tmpvar_28.x);
  col_20 = (col_20 + (lightColor1_16 * tmpvar_28.y));
  col_20 = (col_20 + (lightColor2_17 * tmpvar_28.z));
  col_20 = (col_20 + (lightColor3_18 * tmpvar_28.w));
  tmpvar_3 = (tmpvar_3 + col_20);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec4 normal_9;
  normal_9 = tmpvar_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, normal_9);
  x_11.y = dot (unity_SHAg, normal_9);
  x_11.z = dot (unity_SHAb, normal_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_9.xyzz * normal_9.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_10 = tmpvar_14;
  shlight_1 = tmpvar_14;
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_15;
  lightColor0_15 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_16;
  lightColor1_16 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_17;
  lightColor2_17 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_18;
  lightColor3_18 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_19;
  lightAttenSq_19 = unity_4LightAtten0;
  highp vec3 col_20;
  highp vec4 ndotl_21;
  highp vec4 lengthSq_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_22 = (tmpvar_23 * tmpvar_23);
  lengthSq_22 = (lengthSq_22 + (tmpvar_24 * tmpvar_24));
  lengthSq_22 = (lengthSq_22 + (tmpvar_25 * tmpvar_25));
  highp vec4 tmpvar_26;
  tmpvar_26 = max (lengthSq_22, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_22 = tmpvar_26;
  ndotl_21 = (tmpvar_23 * tmpvar_7.x);
  ndotl_21 = (ndotl_21 + (tmpvar_24 * tmpvar_7.y));
  ndotl_21 = (ndotl_21 + (tmpvar_25 * tmpvar_7.z));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_21 * inversesqrt(tmpvar_26)));
  ndotl_21 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_27 * (1.0/((1.0 + 
    (tmpvar_26 * lightAttenSq_19)
  ))));
  col_20 = (lightColor0_15 * tmpvar_28.x);
  col_20 = (col_20 + (lightColor1_16 * tmpvar_28.y));
  col_20 = (col_20 + (lightColor2_17 * tmpvar_28.z));
  col_20 = (col_20 + (lightColor3_18 * tmpvar_28.w));
  tmpvar_3 = (tmpvar_3 + col_20);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_14;
  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_14));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_14;
  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_14));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD4 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_14;
  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_14));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec4 normal_9;
  normal_9 = tmpvar_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, normal_9);
  x_11.y = dot (unity_SHAg, normal_9);
  x_11.z = dot (unity_SHAb, normal_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_9.xyzz * normal_9.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_10 = tmpvar_14;
  shlight_1 = tmpvar_14;
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_14;
  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_14));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec4 normal_9;
  normal_9 = tmpvar_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, normal_9);
  x_11.y = dot (unity_SHAg, normal_9);
  x_11.z = dot (unity_SHAb, normal_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_9.xyzz * normal_9.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_10 = tmpvar_14;
  shlight_1 = tmpvar_14;
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_14;
  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_14));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec4 normal_9;
  normal_9 = tmpvar_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, normal_9);
  x_11.y = dot (unity_SHAg, normal_9);
  x_11.z = dot (unity_SHAb, normal_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_9.xyzz * normal_9.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y))
  )));
  mediump vec3 tmpvar_14;
  tmpvar_14 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_10 = tmpvar_14;
  shlight_1 = tmpvar_14;
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_14;
  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_14));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_3;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_2 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_8;
  c_3.w = tmpvar_5.w;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 lightColor0_8;
  lightColor0_8 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_9;
  lightColor1_9 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_10;
  lightColor2_10 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_11;
  lightColor3_11 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_12;
  lightAttenSq_12 = unity_4LightAtten0;
  highp vec3 col_13;
  highp vec4 ndotl_14;
  highp vec4 lengthSq_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_15 = (tmpvar_16 * tmpvar_16);
  lengthSq_15 = (lengthSq_15 + (tmpvar_17 * tmpvar_17));
  lengthSq_15 = (lengthSq_15 + (tmpvar_18 * tmpvar_18));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (lengthSq_15, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_15 = tmpvar_19;
  ndotl_14 = (tmpvar_16 * tmpvar_7.x);
  ndotl_14 = (ndotl_14 + (tmpvar_17 * tmpvar_7.y));
  ndotl_14 = (ndotl_14 + (tmpvar_18 * tmpvar_7.z));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_14 * inversesqrt(tmpvar_19)));
  ndotl_14 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_20 * (1.0/((1.0 + 
    (tmpvar_19 * lightAttenSq_12)
  ))));
  col_13 = (lightColor0_8 * tmpvar_21.x);
  col_13 = (col_13 + (lightColor1_9 * tmpvar_21.y));
  col_13 = (col_13 + (lightColor2_10 * tmpvar_21.z));
  col_13 = (col_13 + (lightColor3_11 * tmpvar_21.w));
  tmpvar_2 = col_13;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_14;
  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_14));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 lightColor0_8;
  lightColor0_8 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_9;
  lightColor1_9 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_10;
  lightColor2_10 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_11;
  lightColor3_11 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_12;
  lightAttenSq_12 = unity_4LightAtten0;
  highp vec3 col_13;
  highp vec4 ndotl_14;
  highp vec4 lengthSq_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_15 = (tmpvar_16 * tmpvar_16);
  lengthSq_15 = (lengthSq_15 + (tmpvar_17 * tmpvar_17));
  lengthSq_15 = (lengthSq_15 + (tmpvar_18 * tmpvar_18));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (lengthSq_15, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_15 = tmpvar_19;
  ndotl_14 = (tmpvar_16 * tmpvar_7.x);
  ndotl_14 = (ndotl_14 + (tmpvar_17 * tmpvar_7.y));
  ndotl_14 = (ndotl_14 + (tmpvar_18 * tmpvar_7.z));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_14 * inversesqrt(tmpvar_19)));
  ndotl_14 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_20 * (1.0/((1.0 + 
    (tmpvar_19 * lightAttenSq_12)
  ))));
  col_13 = (lightColor0_8 * tmpvar_21.x);
  col_13 = (col_13 + (lightColor1_9 * tmpvar_21.y));
  col_13 = (col_13 + (lightColor2_10 * tmpvar_21.z));
  col_13 = (col_13 + (lightColor3_11 * tmpvar_21.w));
  tmpvar_2 = col_13;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_14;
  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_14));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
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
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec2 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 lightColor0_8;
  lightColor0_8 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_9;
  lightColor1_9 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_10;
  lightColor2_10 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_11;
  lightColor3_11 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_12;
  lightAttenSq_12 = unity_4LightAtten0;
  highp vec3 col_13;
  highp vec4 ndotl_14;
  highp vec4 lengthSq_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_15 = (tmpvar_16 * tmpvar_16);
  lengthSq_15 = (lengthSq_15 + (tmpvar_17 * tmpvar_17));
  lengthSq_15 = (lengthSq_15 + (tmpvar_18 * tmpvar_18));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (lengthSq_15, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_15 = tmpvar_19;
  ndotl_14 = (tmpvar_16 * tmpvar_7.x);
  ndotl_14 = (ndotl_14 + (tmpvar_17 * tmpvar_7.y));
  ndotl_14 = (ndotl_14 + (tmpvar_18 * tmpvar_7.z));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_14 * inversesqrt(tmpvar_19)));
  ndotl_14 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_20 * (1.0/((1.0 + 
    (tmpvar_19 * lightAttenSq_12)
  ))));
  col_13 = (lightColor0_8 * tmpvar_21.x);
  col_13 = (col_13 + (lightColor1_9 * tmpvar_21.y));
  col_13 = (col_13 + (lightColor2_10 * tmpvar_21.z));
  col_13 = (col_13 + (lightColor3_11 * tmpvar_21.w));
  tmpvar_2 = col_13;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_14;
  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_14));
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
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
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_16;
  lightColor0_16 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_17;
  lightColor1_17 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_18;
  lightColor2_18 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_19;
  lightColor3_19 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_20;
  lightAttenSq_20 = unity_4LightAtten0;
  highp vec3 col_21;
  highp vec4 ndotl_22;
  highp vec4 lengthSq_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_23 = (tmpvar_24 * tmpvar_24);
  lengthSq_23 = (lengthSq_23 + (tmpvar_25 * tmpvar_25));
  lengthSq_23 = (lengthSq_23 + (tmpvar_26 * tmpvar_26));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (lengthSq_23, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_23 = tmpvar_27;
  ndotl_22 = (tmpvar_24 * tmpvar_8.x);
  ndotl_22 = (ndotl_22 + (tmpvar_25 * tmpvar_8.y));
  ndotl_22 = (ndotl_22 + (tmpvar_26 * tmpvar_8.z));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_22 * inversesqrt(tmpvar_27)));
  ndotl_22 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_28 * (1.0/((1.0 + 
    (tmpvar_27 * lightAttenSq_20)
  ))));
  col_21 = (lightColor0_16 * tmpvar_29.x);
  col_21 = (col_21 + (lightColor1_17 * tmpvar_29.y));
  col_21 = (col_21 + (lightColor2_18 * tmpvar_29.z));
  col_21 = (col_21 + (lightColor3_19 * tmpvar_29.w));
  tmpvar_3 = (tmpvar_3 + col_21);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_14;
  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_14));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
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
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_16;
  lightColor0_16 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_17;
  lightColor1_17 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_18;
  lightColor2_18 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_19;
  lightColor3_19 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_20;
  lightAttenSq_20 = unity_4LightAtten0;
  highp vec3 col_21;
  highp vec4 ndotl_22;
  highp vec4 lengthSq_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_23 = (tmpvar_24 * tmpvar_24);
  lengthSq_23 = (lengthSq_23 + (tmpvar_25 * tmpvar_25));
  lengthSq_23 = (lengthSq_23 + (tmpvar_26 * tmpvar_26));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (lengthSq_23, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_23 = tmpvar_27;
  ndotl_22 = (tmpvar_24 * tmpvar_8.x);
  ndotl_22 = (ndotl_22 + (tmpvar_25 * tmpvar_8.y));
  ndotl_22 = (ndotl_22 + (tmpvar_26 * tmpvar_8.z));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_22 * inversesqrt(tmpvar_27)));
  ndotl_22 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_28 * (1.0/((1.0 + 
    (tmpvar_27 * lightAttenSq_20)
  ))));
  col_21 = (lightColor0_16 * tmpvar_29.x);
  col_21 = (col_21 + (lightColor1_17 * tmpvar_29.y));
  col_21 = (col_21 + (lightColor2_18 * tmpvar_29.z));
  col_21 = (col_21 + (lightColor3_19 * tmpvar_29.w));
  tmpvar_3 = (tmpvar_3 + col_21);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_14;
  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_14));
  gl_FragData[0] = c_1;
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
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
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
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_16;
  lightColor0_16 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_17;
  lightColor1_17 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_18;
  lightColor2_18 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_19;
  lightColor3_19 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_20;
  lightAttenSq_20 = unity_4LightAtten0;
  highp vec3 col_21;
  highp vec4 ndotl_22;
  highp vec4 lengthSq_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_23 = (tmpvar_24 * tmpvar_24);
  lengthSq_23 = (lengthSq_23 + (tmpvar_25 * tmpvar_25));
  lengthSq_23 = (lengthSq_23 + (tmpvar_26 * tmpvar_26));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (lengthSq_23, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_23 = tmpvar_27;
  ndotl_22 = (tmpvar_24 * tmpvar_8.x);
  ndotl_22 = (ndotl_22 + (tmpvar_25 * tmpvar_8.y));
  ndotl_22 = (ndotl_22 + (tmpvar_26 * tmpvar_8.z));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_22 * inversesqrt(tmpvar_27)));
  ndotl_22 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_28 * (1.0/((1.0 + 
    (tmpvar_27 * lightAttenSq_20)
  ))));
  col_21 = (lightColor0_16 * tmpvar_29.x);
  col_21 = (col_21 + (lightColor1_17 * tmpvar_29.y));
  col_21 = (col_21 + (lightColor2_18 * tmpvar_29.z));
  col_21 = (col_21 + (lightColor3_19 * tmpvar_29.w));
  tmpvar_3 = (tmpvar_3 + col_21);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp vec3 lightDir_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD0;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_4);
  lowp float x_7;
  x_7 = (tmpvar_6.w - _CutOff);
  if ((x_7 < 0.0)) {
    discard;
  };
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6.xyz * xlv_TEXCOORD3);
  highp vec4 tmpvar_8;
  highp vec3 lightDir_9;
  lightDir_9 = lightDir_3;
  lowp vec4 c_10;
  lowp float diff_11;
  lowp vec3 x_12;
  x_12 = -(tmpvar_2);
  highp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (x_12, lightDir_9));
  diff_11 = tmpvar_13;
  c_10.xyz = ((tmpvar_6.xyz * _LightColor0.xyz) * (diff_11 * 1.2));
  c_10.w = tmpvar_6.w;
  tmpvar_8 = c_10;
  c_1 = (c_1 + tmpvar_8);
  highp float tmpvar_14;
  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_14));
  gl_FragData[0] = c_1;
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
  Name "META"
  LOD 200
  Tags { "LIGHTMODE" = "META" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
  Cull Off
  GpuProgramID 248828
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
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
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
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec2 tmpvar_3;
  tmpvar_3 = xlv_TEXCOORD0;
  lowp vec3 tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_3);
  tmpvar_4 = tmpvar_5.xyz;
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_4;
  mediump vec4 res_7;
  res_7 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = tmpvar_2;
    res_7.w = tmpvar_8.w;
    highp vec3 tmpvar_9;
    tmpvar_9 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_7.xyz = tmpvar_9;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_10;
    if (bool(unity_UseLinearSpace)) {
      emission_10 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_10 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = emission_10;
    res_7 = tmpvar_11;
  };
  tmpvar_1 = res_7;
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
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
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
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec2 tmpvar_3;
  tmpvar_3 = xlv_TEXCOORD0;
  lowp vec3 tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_3);
  tmpvar_4 = tmpvar_5.xyz;
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_4;
  mediump vec4 res_7;
  res_7 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = tmpvar_2;
    res_7.w = tmpvar_8.w;
    highp vec3 tmpvar_9;
    tmpvar_9 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_7.xyz = tmpvar_9;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_10;
    if (bool(unity_UseLinearSpace)) {
      emission_10 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_10 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = emission_10;
    res_7 = tmpvar_11;
  };
  tmpvar_1 = res_7;
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
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
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
  tmpvar_1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
uniform lowp float _CutOff;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec2 tmpvar_3;
  tmpvar_3 = xlv_TEXCOORD0;
  lowp vec3 tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, tmpvar_3);
  tmpvar_4 = tmpvar_5.xyz;
  lowp float x_6;
  x_6 = (tmpvar_5.w - _CutOff);
  if ((x_6 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_4;
  mediump vec4 res_7;
  res_7 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = tmpvar_2;
    res_7.w = tmpvar_8.w;
    highp vec3 tmpvar_9;
    tmpvar_9 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_7.xyz = tmpvar_9;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_10;
    if (bool(unity_UseLinearSpace)) {
      emission_10 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_10 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = emission_10;
    res_7 = tmpvar_11;
  };
  tmpvar_1 = res_7;
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
Fallback "Diffuse"
}