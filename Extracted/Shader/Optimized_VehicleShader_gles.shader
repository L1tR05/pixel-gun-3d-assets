//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Optimized/VehicleShader" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Detail ("Detail (RGBA)", 2D) = "alpha" { }
_Power ("DetailPower", Range(0, 1)) = 0.1
_Damage ("Damage", Range(0, 1)) = 0
_CarColor ("ColorChange", Color) = (0,0,0,0)
_Alpha ("alpha", Range(0, 1)) = 1
_Cut ("cut", Float) = 0.1
}
SubShader {
 LOD 150
 Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  LOD 150
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  GpuProgramID 35564
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_6 * tmpvar_1) * diff_17);
  c_16.w = _Alpha;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  gl_FragData[0] = c_15;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_6 * tmpvar_1) * diff_17);
  c_16.w = _Alpha;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  gl_FragData[0] = c_15;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_6 * tmpvar_1) * diff_17);
  c_16.w = _Alpha;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  gl_FragData[0] = c_15;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_6 * tmpvar_1) * diff_17);
  c_16.w = _Alpha;
  c_15.w = c_16.w;
  c_15.xyz = (c_16.xyz + (tmpvar_6 * xlv_TEXCOORD3));
  gl_FragData[0] = c_15;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_6 * tmpvar_1) * diff_17);
  c_16.w = _Alpha;
  c_15.w = c_16.w;
  c_15.xyz = (c_16.xyz + (tmpvar_6 * xlv_TEXCOORD3));
  gl_FragData[0] = c_15;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_6 * tmpvar_1) * diff_17);
  c_16.w = _Alpha;
  c_15.w = c_16.w;
  c_15.xyz = (c_16.xyz + (tmpvar_6 * xlv_TEXCOORD3));
  gl_FragData[0] = c_15;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  mediump vec3 tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_17;
  color_17 = tmpvar_16;
  tmpvar_15 = (unity_Lightmap_HDR.x * color_17.xyz);
  lowp vec4 c_18;
  lowp vec4 c_19;
  lowp float diff_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_20 = tmpvar_21;
  c_19.xyz = ((tmpvar_6 * tmpvar_1) * diff_20);
  c_19.w = _Alpha;
  c_18.w = c_19.w;
  c_18.xyz = (c_19.xyz + (tmpvar_6 * tmpvar_15));
  gl_FragData[0] = c_18;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  mediump vec3 tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_17;
  color_17 = tmpvar_16;
  tmpvar_15 = (unity_Lightmap_HDR.x * color_17.xyz);
  lowp vec4 c_18;
  lowp vec4 c_19;
  lowp float diff_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_20 = tmpvar_21;
  c_19.xyz = ((tmpvar_6 * tmpvar_1) * diff_20);
  c_19.w = _Alpha;
  c_18.w = c_19.w;
  c_18.xyz = (c_19.xyz + (tmpvar_6 * tmpvar_15));
  gl_FragData[0] = c_18;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  mediump vec3 tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_17;
  color_17 = tmpvar_16;
  tmpvar_15 = (unity_Lightmap_HDR.x * color_17.xyz);
  lowp vec4 c_18;
  lowp vec4 c_19;
  lowp float diff_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_20 = tmpvar_21;
  c_19.xyz = ((tmpvar_6 * tmpvar_1) * diff_20);
  c_19.w = _Alpha;
  c_18.w = c_19.w;
  c_18.xyz = (c_19.xyz + (tmpvar_6 * tmpvar_15));
  gl_FragData[0] = c_18;
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  mediump vec3 normalWorld_15;
  normalWorld_15 = tmpvar_3;
  mediump vec3 tmpvar_16;
  mediump vec3 ambient_17;
  mediump vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = normalWorld_15;
  mediump vec3 x_19;
  x_19.x = dot (unity_SHAr, tmpvar_18);
  x_19.y = dot (unity_SHAg, tmpvar_18);
  x_19.z = dot (unity_SHAb, tmpvar_18);
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_15.xyzz * normalWorld_15.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambient_17 = max (vec3(0.0, 0.0, 0.0), (x_19 + (x1_20 + 
    (unity_SHC.xyz * ((normalWorld_15.x * normalWorld_15.x) - (normalWorld_15.y * normalWorld_15.y)))
  )));
  mediump vec3 tmpvar_22;
  tmpvar_22 = max (((1.055 * 
    pow (max (ambient_17, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_17 = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_24;
  color_24 = tmpvar_23;
  tmpvar_16 = (tmpvar_22 + (unity_Lightmap_HDR.x * color_24.xyz));
  lowp vec4 c_25;
  lowp vec4 c_26;
  lowp float diff_27;
  mediump float tmpvar_28;
  tmpvar_28 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_27 = tmpvar_28;
  c_26.xyz = ((tmpvar_6 * tmpvar_1) * diff_27);
  c_26.w = _Alpha;
  c_25.w = c_26.w;
  c_25.xyz = (c_26.xyz + (tmpvar_6 * tmpvar_16));
  gl_FragData[0] = c_25;
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  mediump vec3 normalWorld_15;
  normalWorld_15 = tmpvar_3;
  mediump vec3 tmpvar_16;
  mediump vec3 ambient_17;
  mediump vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = normalWorld_15;
  mediump vec3 x_19;
  x_19.x = dot (unity_SHAr, tmpvar_18);
  x_19.y = dot (unity_SHAg, tmpvar_18);
  x_19.z = dot (unity_SHAb, tmpvar_18);
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_15.xyzz * normalWorld_15.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambient_17 = max (vec3(0.0, 0.0, 0.0), (x_19 + (x1_20 + 
    (unity_SHC.xyz * ((normalWorld_15.x * normalWorld_15.x) - (normalWorld_15.y * normalWorld_15.y)))
  )));
  mediump vec3 tmpvar_22;
  tmpvar_22 = max (((1.055 * 
    pow (max (ambient_17, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_17 = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_24;
  color_24 = tmpvar_23;
  tmpvar_16 = (tmpvar_22 + (unity_Lightmap_HDR.x * color_24.xyz));
  lowp vec4 c_25;
  lowp vec4 c_26;
  lowp float diff_27;
  mediump float tmpvar_28;
  tmpvar_28 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_27 = tmpvar_28;
  c_26.xyz = ((tmpvar_6 * tmpvar_1) * diff_27);
  c_26.w = _Alpha;
  c_25.w = c_26.w;
  c_25.xyz = (c_26.xyz + (tmpvar_6 * tmpvar_16));
  gl_FragData[0] = c_25;
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  mediump vec3 normalWorld_15;
  normalWorld_15 = tmpvar_3;
  mediump vec3 tmpvar_16;
  mediump vec3 ambient_17;
  mediump vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = normalWorld_15;
  mediump vec3 x_19;
  x_19.x = dot (unity_SHAr, tmpvar_18);
  x_19.y = dot (unity_SHAg, tmpvar_18);
  x_19.z = dot (unity_SHAb, tmpvar_18);
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_15.xyzz * normalWorld_15.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambient_17 = max (vec3(0.0, 0.0, 0.0), (x_19 + (x1_20 + 
    (unity_SHC.xyz * ((normalWorld_15.x * normalWorld_15.x) - (normalWorld_15.y * normalWorld_15.y)))
  )));
  mediump vec3 tmpvar_22;
  tmpvar_22 = max (((1.055 * 
    pow (max (ambient_17, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_17 = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_24;
  color_24 = tmpvar_23;
  tmpvar_16 = (tmpvar_22 + (unity_Lightmap_HDR.x * color_24.xyz));
  lowp vec4 c_25;
  lowp vec4 c_26;
  lowp float diff_27;
  mediump float tmpvar_28;
  tmpvar_28 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_27 = tmpvar_28;
  c_26.xyz = ((tmpvar_6 * tmpvar_1) * diff_27);
  c_26.w = _Alpha;
  c_25.w = c_26.w;
  c_25.xyz = (c_26.xyz + (tmpvar_6 * tmpvar_16));
  gl_FragData[0] = c_25;
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp float p_2;
  lowp vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3.w = tmpvar_4.w;
  c_3.xyz = (tmpvar_4.xyz + ((_CarColor * tmpvar_4.w).xyz * tmpvar_4.xyz));
  highp float tmpvar_5;
  tmpvar_5 = float((_Power == 1.0));
  p_2 = tmpvar_5;
  highp vec3 tmpvar_6;
  lowp vec3 y_7;
  y_7 = (c_3.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_6 = mix (c_3.xyz, y_7, vec3(_Power));
  highp vec3 tmpvar_8;
  tmpvar_8 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_1 = ((tmpvar_6 - (p_2 * 0.4)) + tmpvar_8);
  lowp float x_9;
  x_9 = (_Alpha - _Cut);
  if ((x_9 < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_10 = (unity_Lightmap_HDR.x * color_12.xyz);
  lowp vec4 c_13;
  lowp vec4 c_14;
  c_14.xyz = vec3(0.0, 0.0, 0.0);
  c_14.w = _Alpha;
  c_13.w = c_14.w;
  c_13.xyz = (tmpvar_1 * tmpvar_10);
  gl_FragData[0] = c_13;
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp float p_2;
  lowp vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3.w = tmpvar_4.w;
  c_3.xyz = (tmpvar_4.xyz + ((_CarColor * tmpvar_4.w).xyz * tmpvar_4.xyz));
  highp float tmpvar_5;
  tmpvar_5 = float((_Power == 1.0));
  p_2 = tmpvar_5;
  highp vec3 tmpvar_6;
  lowp vec3 y_7;
  y_7 = (c_3.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_6 = mix (c_3.xyz, y_7, vec3(_Power));
  highp vec3 tmpvar_8;
  tmpvar_8 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_1 = ((tmpvar_6 - (p_2 * 0.4)) + tmpvar_8);
  lowp float x_9;
  x_9 = (_Alpha - _Cut);
  if ((x_9 < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_10 = (unity_Lightmap_HDR.x * color_12.xyz);
  lowp vec4 c_13;
  lowp vec4 c_14;
  c_14.xyz = vec3(0.0, 0.0, 0.0);
  c_14.w = _Alpha;
  c_13.w = c_14.w;
  c_13.xyz = (tmpvar_1 * tmpvar_10);
  gl_FragData[0] = c_13;
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp float p_2;
  lowp vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3.w = tmpvar_4.w;
  c_3.xyz = (tmpvar_4.xyz + ((_CarColor * tmpvar_4.w).xyz * tmpvar_4.xyz));
  highp float tmpvar_5;
  tmpvar_5 = float((_Power == 1.0));
  p_2 = tmpvar_5;
  highp vec3 tmpvar_6;
  lowp vec3 y_7;
  y_7 = (c_3.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_6 = mix (c_3.xyz, y_7, vec3(_Power));
  highp vec3 tmpvar_8;
  tmpvar_8 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_1 = ((tmpvar_6 - (p_2 * 0.4)) + tmpvar_8);
  lowp float x_9;
  x_9 = (_Alpha - _Cut);
  if ((x_9 < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_10 = (unity_Lightmap_HDR.x * color_12.xyz);
  lowp vec4 c_13;
  lowp vec4 c_14;
  c_14.xyz = vec3(0.0, 0.0, 0.0);
  c_14.w = _Alpha;
  c_13.w = c_14.w;
  c_13.xyz = (tmpvar_1 * tmpvar_10);
  gl_FragData[0] = c_13;
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec3 normalWorld_11;
  normalWorld_11 = tmpvar_1;
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
  c_22.xyz = vec3(0.0, 0.0, 0.0);
  c_22.w = _Alpha;
  c_21.w = c_22.w;
  c_21.xyz = (tmpvar_2 * tmpvar_12);
  gl_FragData[0] = c_21;
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec3 normalWorld_11;
  normalWorld_11 = tmpvar_1;
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
  c_22.xyz = vec3(0.0, 0.0, 0.0);
  c_22.w = _Alpha;
  c_21.w = c_22.w;
  c_21.xyz = (tmpvar_2 * tmpvar_12);
  gl_FragData[0] = c_21;
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec3 normalWorld_11;
  normalWorld_11 = tmpvar_1;
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
  c_22.xyz = vec3(0.0, 0.0, 0.0);
  c_22.w = _Alpha;
  c_21.w = c_22.w;
  c_21.xyz = (tmpvar_2 * tmpvar_12);
  gl_FragData[0] = c_21;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_6 * tmpvar_1) * diff_17);
  c_16.w = _Alpha;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  gl_FragData[0] = c_15;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_6 * tmpvar_1) * diff_17);
  c_16.w = _Alpha;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  gl_FragData[0] = c_15;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_6 * tmpvar_1) * diff_17);
  c_16.w = _Alpha;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  gl_FragData[0] = c_15;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_6 * tmpvar_1) * diff_17);
  c_16.w = _Alpha;
  c_15.w = c_16.w;
  c_15.xyz = (c_16.xyz + (tmpvar_6 * xlv_TEXCOORD3));
  gl_FragData[0] = c_15;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_6 * tmpvar_1) * diff_17);
  c_16.w = _Alpha;
  c_15.w = c_16.w;
  c_15.xyz = (c_16.xyz + (tmpvar_6 * xlv_TEXCOORD3));
  gl_FragData[0] = c_15;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_6 * tmpvar_1) * diff_17);
  c_16.w = _Alpha;
  c_15.w = c_16.w;
  c_15.xyz = (c_16.xyz + (tmpvar_6 * xlv_TEXCOORD3));
  gl_FragData[0] = c_15;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_16;
  lowp vec4 c_17;
  lowp float diff_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_18 = tmpvar_19;
  c_17.xyz = ((tmpvar_7 * tmpvar_1) * diff_18);
  c_17.w = _Alpha;
  c_16.w = c_17.w;
  c_16.xyz = c_17.xyz;
  c_3.w = c_16.w;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_17.xyz, vec3(tmpvar_20));
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_16;
  lowp vec4 c_17;
  lowp float diff_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_18 = tmpvar_19;
  c_17.xyz = ((tmpvar_7 * tmpvar_1) * diff_18);
  c_17.w = _Alpha;
  c_16.w = c_17.w;
  c_16.xyz = c_17.xyz;
  c_3.w = c_16.w;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_17.xyz, vec3(tmpvar_20));
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_16;
  lowp vec4 c_17;
  lowp float diff_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_18 = tmpvar_19;
  c_17.xyz = ((tmpvar_7 * tmpvar_1) * diff_18);
  c_17.w = _Alpha;
  c_16.w = c_17.w;
  c_16.xyz = c_17.xyz;
  c_3.w = c_16.w;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_17.xyz, vec3(tmpvar_20));
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_16;
  lowp vec4 c_17;
  lowp float diff_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_18 = tmpvar_19;
  c_17.xyz = ((tmpvar_7 * tmpvar_1) * diff_18);
  c_17.w = _Alpha;
  c_16.w = c_17.w;
  c_16.xyz = (c_17.xyz + (tmpvar_7 * xlv_TEXCOORD3));
  c_3.w = c_16.w;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_16.xyz, vec3(tmpvar_20));
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_16;
  lowp vec4 c_17;
  lowp float diff_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_18 = tmpvar_19;
  c_17.xyz = ((tmpvar_7 * tmpvar_1) * diff_18);
  c_17.w = _Alpha;
  c_16.w = c_17.w;
  c_16.xyz = (c_17.xyz + (tmpvar_7 * xlv_TEXCOORD3));
  c_3.w = c_16.w;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_16.xyz, vec3(tmpvar_20));
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_16;
  lowp vec4 c_17;
  lowp float diff_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_18 = tmpvar_19;
  c_17.xyz = ((tmpvar_7 * tmpvar_1) * diff_18);
  c_17.w = _Alpha;
  c_16.w = c_17.w;
  c_16.xyz = (c_17.xyz + (tmpvar_7 * xlv_TEXCOORD3));
  c_3.w = c_16.w;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_16.xyz, vec3(tmpvar_20));
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 tmpvar_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_18;
  color_18 = tmpvar_17;
  tmpvar_16 = (unity_Lightmap_HDR.x * color_18.xyz);
  lowp vec4 c_19;
  lowp vec4 c_20;
  lowp float diff_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_21 = tmpvar_22;
  c_20.xyz = ((tmpvar_7 * tmpvar_1) * diff_21);
  c_20.w = _Alpha;
  c_19.w = c_20.w;
  c_19.xyz = (c_20.xyz + (tmpvar_7 * tmpvar_16));
  c_3.w = c_19.w;
  highp float tmpvar_23;
  tmpvar_23 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_19.xyz, vec3(tmpvar_23));
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 tmpvar_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_18;
  color_18 = tmpvar_17;
  tmpvar_16 = (unity_Lightmap_HDR.x * color_18.xyz);
  lowp vec4 c_19;
  lowp vec4 c_20;
  lowp float diff_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_21 = tmpvar_22;
  c_20.xyz = ((tmpvar_7 * tmpvar_1) * diff_21);
  c_20.w = _Alpha;
  c_19.w = c_20.w;
  c_19.xyz = (c_20.xyz + (tmpvar_7 * tmpvar_16));
  c_3.w = c_19.w;
  highp float tmpvar_23;
  tmpvar_23 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_19.xyz, vec3(tmpvar_23));
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 tmpvar_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_18;
  color_18 = tmpvar_17;
  tmpvar_16 = (unity_Lightmap_HDR.x * color_18.xyz);
  lowp vec4 c_19;
  lowp vec4 c_20;
  lowp float diff_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_21 = tmpvar_22;
  c_20.xyz = ((tmpvar_7 * tmpvar_1) * diff_21);
  c_20.w = _Alpha;
  c_19.w = c_20.w;
  c_19.xyz = (c_20.xyz + (tmpvar_7 * tmpvar_16));
  c_3.w = c_19.w;
  highp float tmpvar_23;
  tmpvar_23 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_19.xyz, vec3(tmpvar_23));
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_16;
  normalWorld_16 = tmpvar_4;
  mediump vec3 tmpvar_17;
  mediump vec3 ambient_18;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_16;
  mediump vec3 x_20;
  x_20.x = dot (unity_SHAr, tmpvar_19);
  x_20.y = dot (unity_SHAg, tmpvar_19);
  x_20.z = dot (unity_SHAb, tmpvar_19);
  mediump vec3 x1_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = (normalWorld_16.xyzz * normalWorld_16.yzzx);
  x1_21.x = dot (unity_SHBr, tmpvar_22);
  x1_21.y = dot (unity_SHBg, tmpvar_22);
  x1_21.z = dot (unity_SHBb, tmpvar_22);
  ambient_18 = max (vec3(0.0, 0.0, 0.0), (x_20 + (x1_21 + 
    (unity_SHC.xyz * ((normalWorld_16.x * normalWorld_16.x) - (normalWorld_16.y * normalWorld_16.y)))
  )));
  mediump vec3 tmpvar_23;
  tmpvar_23 = max (((1.055 * 
    pow (max (ambient_18, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_18 = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_25;
  color_25 = tmpvar_24;
  tmpvar_17 = (tmpvar_23 + (unity_Lightmap_HDR.x * color_25.xyz));
  lowp vec4 c_26;
  lowp vec4 c_27;
  lowp float diff_28;
  mediump float tmpvar_29;
  tmpvar_29 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_28 = tmpvar_29;
  c_27.xyz = ((tmpvar_7 * tmpvar_1) * diff_28);
  c_27.w = _Alpha;
  c_26.w = c_27.w;
  c_26.xyz = (c_27.xyz + (tmpvar_7 * tmpvar_17));
  c_3.w = c_26.w;
  highp float tmpvar_30;
  tmpvar_30 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_26.xyz, vec3(tmpvar_30));
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_16;
  normalWorld_16 = tmpvar_4;
  mediump vec3 tmpvar_17;
  mediump vec3 ambient_18;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_16;
  mediump vec3 x_20;
  x_20.x = dot (unity_SHAr, tmpvar_19);
  x_20.y = dot (unity_SHAg, tmpvar_19);
  x_20.z = dot (unity_SHAb, tmpvar_19);
  mediump vec3 x1_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = (normalWorld_16.xyzz * normalWorld_16.yzzx);
  x1_21.x = dot (unity_SHBr, tmpvar_22);
  x1_21.y = dot (unity_SHBg, tmpvar_22);
  x1_21.z = dot (unity_SHBb, tmpvar_22);
  ambient_18 = max (vec3(0.0, 0.0, 0.0), (x_20 + (x1_21 + 
    (unity_SHC.xyz * ((normalWorld_16.x * normalWorld_16.x) - (normalWorld_16.y * normalWorld_16.y)))
  )));
  mediump vec3 tmpvar_23;
  tmpvar_23 = max (((1.055 * 
    pow (max (ambient_18, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_18 = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_25;
  color_25 = tmpvar_24;
  tmpvar_17 = (tmpvar_23 + (unity_Lightmap_HDR.x * color_25.xyz));
  lowp vec4 c_26;
  lowp vec4 c_27;
  lowp float diff_28;
  mediump float tmpvar_29;
  tmpvar_29 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_28 = tmpvar_29;
  c_27.xyz = ((tmpvar_7 * tmpvar_1) * diff_28);
  c_27.w = _Alpha;
  c_26.w = c_27.w;
  c_26.xyz = (c_27.xyz + (tmpvar_7 * tmpvar_17));
  c_3.w = c_26.w;
  highp float tmpvar_30;
  tmpvar_30 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_26.xyz, vec3(tmpvar_30));
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_16;
  normalWorld_16 = tmpvar_4;
  mediump vec3 tmpvar_17;
  mediump vec3 ambient_18;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_16;
  mediump vec3 x_20;
  x_20.x = dot (unity_SHAr, tmpvar_19);
  x_20.y = dot (unity_SHAg, tmpvar_19);
  x_20.z = dot (unity_SHAb, tmpvar_19);
  mediump vec3 x1_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = (normalWorld_16.xyzz * normalWorld_16.yzzx);
  x1_21.x = dot (unity_SHBr, tmpvar_22);
  x1_21.y = dot (unity_SHBg, tmpvar_22);
  x1_21.z = dot (unity_SHBb, tmpvar_22);
  ambient_18 = max (vec3(0.0, 0.0, 0.0), (x_20 + (x1_21 + 
    (unity_SHC.xyz * ((normalWorld_16.x * normalWorld_16.x) - (normalWorld_16.y * normalWorld_16.y)))
  )));
  mediump vec3 tmpvar_23;
  tmpvar_23 = max (((1.055 * 
    pow (max (ambient_18, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_18 = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_25;
  color_25 = tmpvar_24;
  tmpvar_17 = (tmpvar_23 + (unity_Lightmap_HDR.x * color_25.xyz));
  lowp vec4 c_26;
  lowp vec4 c_27;
  lowp float diff_28;
  mediump float tmpvar_29;
  tmpvar_29 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_28 = tmpvar_29;
  c_27.xyz = ((tmpvar_7 * tmpvar_1) * diff_28);
  c_27.w = _Alpha;
  c_26.w = c_27.w;
  c_26.xyz = (c_27.xyz + (tmpvar_7 * tmpvar_17));
  c_3.w = c_26.w;
  highp float tmpvar_30;
  tmpvar_30 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_26.xyz, vec3(tmpvar_30));
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  tmpvar_11 = (unity_Lightmap_HDR.x * color_13.xyz);
  lowp vec4 c_14;
  lowp vec4 c_15;
  c_15.xyz = vec3(0.0, 0.0, 0.0);
  c_15.w = _Alpha;
  c_14.w = c_15.w;
  c_14.xyz = (tmpvar_2 * tmpvar_11);
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  tmpvar_11 = (unity_Lightmap_HDR.x * color_13.xyz);
  lowp vec4 c_14;
  lowp vec4 c_15;
  c_15.xyz = vec3(0.0, 0.0, 0.0);
  c_15.w = _Alpha;
  c_14.w = c_15.w;
  c_14.xyz = (tmpvar_2 * tmpvar_11);
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  tmpvar_11 = (unity_Lightmap_HDR.x * color_13.xyz);
  lowp vec4 c_14;
  lowp vec4 c_15;
  c_15.xyz = vec3(0.0, 0.0, 0.0);
  c_15.w = _Alpha;
  c_14.w = c_15.w;
  c_14.xyz = (tmpvar_2 * tmpvar_11);
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec3 normalWorld_12;
  normalWorld_12 = tmpvar_2;
  mediump vec3 tmpvar_13;
  mediump vec3 ambient_14;
  mediump vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = normalWorld_12;
  mediump vec3 x_16;
  x_16.x = dot (unity_SHAr, tmpvar_15);
  x_16.y = dot (unity_SHAg, tmpvar_15);
  x_16.z = dot (unity_SHAb, tmpvar_15);
  mediump vec3 x1_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normalWorld_12.xyzz * normalWorld_12.yzzx);
  x1_17.x = dot (unity_SHBr, tmpvar_18);
  x1_17.y = dot (unity_SHBg, tmpvar_18);
  x1_17.z = dot (unity_SHBb, tmpvar_18);
  ambient_14 = max (vec3(0.0, 0.0, 0.0), (x_16 + (x1_17 + 
    (unity_SHC.xyz * ((normalWorld_12.x * normalWorld_12.x) - (normalWorld_12.y * normalWorld_12.y)))
  )));
  mediump vec3 tmpvar_19;
  tmpvar_19 = max (((1.055 * 
    pow (max (ambient_14, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_14 = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_21;
  color_21 = tmpvar_20;
  tmpvar_13 = (tmpvar_19 + (unity_Lightmap_HDR.x * color_21.xyz));
  lowp vec4 c_22;
  lowp vec4 c_23;
  c_23.xyz = vec3(0.0, 0.0, 0.0);
  c_23.w = _Alpha;
  c_22.w = c_23.w;
  c_22.xyz = (tmpvar_3 * tmpvar_13);
  c_1.w = c_22.w;
  highp float tmpvar_24;
  tmpvar_24 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_22.xyz, vec3(tmpvar_24));
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec3 normalWorld_12;
  normalWorld_12 = tmpvar_2;
  mediump vec3 tmpvar_13;
  mediump vec3 ambient_14;
  mediump vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = normalWorld_12;
  mediump vec3 x_16;
  x_16.x = dot (unity_SHAr, tmpvar_15);
  x_16.y = dot (unity_SHAg, tmpvar_15);
  x_16.z = dot (unity_SHAb, tmpvar_15);
  mediump vec3 x1_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normalWorld_12.xyzz * normalWorld_12.yzzx);
  x1_17.x = dot (unity_SHBr, tmpvar_18);
  x1_17.y = dot (unity_SHBg, tmpvar_18);
  x1_17.z = dot (unity_SHBb, tmpvar_18);
  ambient_14 = max (vec3(0.0, 0.0, 0.0), (x_16 + (x1_17 + 
    (unity_SHC.xyz * ((normalWorld_12.x * normalWorld_12.x) - (normalWorld_12.y * normalWorld_12.y)))
  )));
  mediump vec3 tmpvar_19;
  tmpvar_19 = max (((1.055 * 
    pow (max (ambient_14, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_14 = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_21;
  color_21 = tmpvar_20;
  tmpvar_13 = (tmpvar_19 + (unity_Lightmap_HDR.x * color_21.xyz));
  lowp vec4 c_22;
  lowp vec4 c_23;
  c_23.xyz = vec3(0.0, 0.0, 0.0);
  c_23.w = _Alpha;
  c_22.w = c_23.w;
  c_22.xyz = (tmpvar_3 * tmpvar_13);
  c_1.w = c_22.w;
  highp float tmpvar_24;
  tmpvar_24 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_22.xyz, vec3(tmpvar_24));
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec3 normalWorld_12;
  normalWorld_12 = tmpvar_2;
  mediump vec3 tmpvar_13;
  mediump vec3 ambient_14;
  mediump vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = normalWorld_12;
  mediump vec3 x_16;
  x_16.x = dot (unity_SHAr, tmpvar_15);
  x_16.y = dot (unity_SHAg, tmpvar_15);
  x_16.z = dot (unity_SHAb, tmpvar_15);
  mediump vec3 x1_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normalWorld_12.xyzz * normalWorld_12.yzzx);
  x1_17.x = dot (unity_SHBr, tmpvar_18);
  x1_17.y = dot (unity_SHBg, tmpvar_18);
  x1_17.z = dot (unity_SHBb, tmpvar_18);
  ambient_14 = max (vec3(0.0, 0.0, 0.0), (x_16 + (x1_17 + 
    (unity_SHC.xyz * ((normalWorld_12.x * normalWorld_12.x) - (normalWorld_12.y * normalWorld_12.y)))
  )));
  mediump vec3 tmpvar_19;
  tmpvar_19 = max (((1.055 * 
    pow (max (ambient_14, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_14 = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_21;
  color_21 = tmpvar_20;
  tmpvar_13 = (tmpvar_19 + (unity_Lightmap_HDR.x * color_21.xyz));
  lowp vec4 c_22;
  lowp vec4 c_23;
  c_23.xyz = vec3(0.0, 0.0, 0.0);
  c_23.w = _Alpha;
  c_22.w = c_23.w;
  c_22.xyz = (tmpvar_3 * tmpvar_13);
  c_1.w = c_22.w;
  highp float tmpvar_24;
  tmpvar_24 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_22.xyz, vec3(tmpvar_24));
  gl_FragData[0] = c_1;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_16;
  lowp vec4 c_17;
  lowp float diff_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_18 = tmpvar_19;
  c_17.xyz = ((tmpvar_7 * tmpvar_1) * diff_18);
  c_17.w = _Alpha;
  c_16.w = c_17.w;
  c_16.xyz = c_17.xyz;
  c_3.w = c_16.w;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_17.xyz, vec3(tmpvar_20));
  gl_FragData[0] = c_3;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_16;
  lowp vec4 c_17;
  lowp float diff_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_18 = tmpvar_19;
  c_17.xyz = ((tmpvar_7 * tmpvar_1) * diff_18);
  c_17.w = _Alpha;
  c_16.w = c_17.w;
  c_16.xyz = c_17.xyz;
  c_3.w = c_16.w;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_17.xyz, vec3(tmpvar_20));
  gl_FragData[0] = c_3;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_16;
  lowp vec4 c_17;
  lowp float diff_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_18 = tmpvar_19;
  c_17.xyz = ((tmpvar_7 * tmpvar_1) * diff_18);
  c_17.w = _Alpha;
  c_16.w = c_17.w;
  c_16.xyz = c_17.xyz;
  c_3.w = c_16.w;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_17.xyz, vec3(tmpvar_20));
  gl_FragData[0] = c_3;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_16;
  lowp vec4 c_17;
  lowp float diff_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_18 = tmpvar_19;
  c_17.xyz = ((tmpvar_7 * tmpvar_1) * diff_18);
  c_17.w = _Alpha;
  c_16.w = c_17.w;
  c_16.xyz = (c_17.xyz + (tmpvar_7 * xlv_TEXCOORD3));
  c_3.w = c_16.w;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_16.xyz, vec3(tmpvar_20));
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_16;
  lowp vec4 c_17;
  lowp float diff_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_18 = tmpvar_19;
  c_17.xyz = ((tmpvar_7 * tmpvar_1) * diff_18);
  c_17.w = _Alpha;
  c_16.w = c_17.w;
  c_16.xyz = (c_17.xyz + (tmpvar_7 * xlv_TEXCOORD3));
  c_3.w = c_16.w;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_16.xyz, vec3(tmpvar_20));
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec4 c_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_7;
  lowp float p_8;
  lowp vec4 c_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_9.w = tmpvar_10.w;
  c_9.xyz = (tmpvar_10.xyz + ((_CarColor * tmpvar_10.w).xyz * tmpvar_10.xyz));
  highp float tmpvar_11;
  tmpvar_11 = float((_Power == 1.0));
  p_8 = tmpvar_11;
  highp vec3 tmpvar_12;
  lowp vec3 y_13;
  y_13 = (c_9.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_12 = mix (c_9.xyz, y_13, vec3(_Power));
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_7 = ((tmpvar_12 - (p_8 * 0.4)) + tmpvar_14);
  lowp float x_15;
  x_15 = (_Alpha - _Cut);
  if ((x_15 < 0.0)) {
    discard;
  };
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_16;
  lowp vec4 c_17;
  lowp float diff_18;
  mediump float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_18 = tmpvar_19;
  c_17.xyz = ((tmpvar_7 * tmpvar_1) * diff_18);
  c_17.w = _Alpha;
  c_16.w = c_17.w;
  c_16.xyz = (c_17.xyz + (tmpvar_7 * xlv_TEXCOORD3));
  c_3.w = c_16.w;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_16.xyz, vec3(tmpvar_20));
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
  Name "PREPASS"
  LOD 150
  Tags { "LIGHTMODE" = "PREPASSBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  GpuProgramID 68397
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 res_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD0;
  lowp float x_3;
  x_3 = (_Alpha - _Cut);
  if ((x_3 < 0.0)) {
    discard;
  };
  res_1.xyz = ((tmpvar_2 * 0.5) + 0.5);
  res_1.w = 0.0;
  gl_FragData[0] = res_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 res_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD0;
  lowp float x_3;
  x_3 = (_Alpha - _Cut);
  if ((x_3 < 0.0)) {
    discard;
  };
  res_1.xyz = ((tmpvar_2 * 0.5) + 0.5);
  res_1.w = 0.0;
  gl_FragData[0] = res_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_2));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 res_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD0;
  lowp float x_3;
  x_3 = (_Alpha - _Cut);
  if ((x_3 < 0.0)) {
    discard;
  };
  res_1.xyz = ((tmpvar_2 * 0.5) + 0.5);
  res_1.w = 0.0;
  gl_FragData[0] = res_1;
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
  Name "PREPASS"
  LOD 150
  Tags { "LIGHTMODE" = "PREPASSFINAL" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZWrite Off
  GpuProgramID 166841
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  light_3 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.xyz = (light_3.xyz + xlv_TEXCOORD4);
  lowp vec4 c_14;
  c_14.xyz = (tmpvar_4 * light_3.xyz);
  c_14.w = _Alpha;
  c_2 = c_14;
  tmpvar_1 = c_2;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  light_3 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.xyz = (light_3.xyz + xlv_TEXCOORD4);
  lowp vec4 c_14;
  c_14.xyz = (tmpvar_4 * light_3.xyz);
  c_14.w = _Alpha;
  c_2 = c_14;
  tmpvar_1 = c_2;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  light_3 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.xyz = (light_3.xyz + xlv_TEXCOORD4);
  lowp vec4 c_14;
  c_14.xyz = (tmpvar_4 * light_3.xyz);
  c_14.w = _Alpha;
  c_2 = c_14;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  light_3 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.xyz = (light_3.xyz + xlv_TEXCOORD4);
  lowp vec4 c_14;
  c_14.xyz = (tmpvar_4 * light_3.xyz);
  c_14.w = _Alpha;
  c_2 = c_14;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  light_3 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.xyz = (light_3.xyz + xlv_TEXCOORD4);
  lowp vec4 c_14;
  c_14.xyz = (tmpvar_4 * light_3.xyz);
  c_14.w = _Alpha;
  c_2 = c_14;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  light_3 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.xyz = (light_3.xyz + xlv_TEXCOORD4);
  lowp vec4 c_14;
  c_14.xyz = (tmpvar_4 * light_3.xyz);
  c_14.w = _Alpha;
  c_2 = c_14;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  light_5 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_17;
  light_5.xyz = (light_5.xyz + lm_3);
  lowp vec4 c_18;
  c_18.xyz = (tmpvar_6 * light_5.xyz);
  c_18.w = _Alpha;
  c_2 = c_18;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  light_5 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_17;
  light_5.xyz = (light_5.xyz + lm_3);
  lowp vec4 c_18;
  c_18.xyz = (tmpvar_6 * light_5.xyz);
  c_18.w = _Alpha;
  c_2 = c_18;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  light_5 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_17;
  light_5.xyz = (light_5.xyz + lm_3);
  lowp vec4 c_18;
  c_18.xyz = (tmpvar_6 * light_5.xyz);
  c_18.w = _Alpha;
  c_2 = c_18;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  light_5 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_17;
  light_5.xyz = (light_5.xyz + lm_3);
  lowp vec4 c_18;
  c_18.xyz = (tmpvar_6 * light_5.xyz);
  c_18.w = _Alpha;
  c_2 = c_18;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  light_5 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_17;
  light_5.xyz = (light_5.xyz + lm_3);
  lowp vec4 c_18;
  c_18.xyz = (tmpvar_6 * light_5.xyz);
  c_18.w = _Alpha;
  c_2 = c_18;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  light_5 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_17;
  light_5.xyz = (light_5.xyz + lm_3);
  lowp vec4 c_18;
  c_18.xyz = (tmpvar_6 * light_5.xyz);
  c_18.w = _Alpha;
  c_2 = c_18;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_14.w;
  light_3.xyz = (tmpvar_14.xyz + xlv_TEXCOORD4);
  lowp vec4 c_15;
  c_15.xyz = (tmpvar_4 * light_3.xyz);
  c_15.w = _Alpha;
  c_2 = c_15;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_14.w;
  light_3.xyz = (tmpvar_14.xyz + xlv_TEXCOORD4);
  lowp vec4 c_15;
  c_15.xyz = (tmpvar_4 * light_3.xyz);
  c_15.w = _Alpha;
  c_2 = c_15;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_14.w;
  light_3.xyz = (tmpvar_14.xyz + xlv_TEXCOORD4);
  lowp vec4 c_15;
  c_15.xyz = (tmpvar_4 * light_3.xyz);
  c_15.w = _Alpha;
  c_2 = c_15;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_16.w;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_18;
  light_5.xyz = (tmpvar_16.xyz + lm_3);
  lowp vec4 c_19;
  c_19.xyz = (tmpvar_6 * light_5.xyz);
  c_19.w = _Alpha;
  c_2 = c_19;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_16.w;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_18;
  light_5.xyz = (tmpvar_16.xyz + lm_3);
  lowp vec4 c_19;
  c_19.xyz = (tmpvar_6 * light_5.xyz);
  c_19.w = _Alpha;
  c_2 = c_19;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_16.w;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_18;
  light_5.xyz = (tmpvar_16.xyz + lm_3);
  lowp vec4 c_19;
  c_19.xyz = (tmpvar_6 * light_5.xyz);
  c_19.w = _Alpha;
  c_2 = c_19;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_16.w;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_18;
  light_5.xyz = (tmpvar_16.xyz + lm_3);
  lowp vec4 c_19;
  c_19.xyz = (tmpvar_6 * light_5.xyz);
  c_19.w = _Alpha;
  c_2 = c_19;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_16.w;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_18;
  light_5.xyz = (tmpvar_16.xyz + lm_3);
  lowp vec4 c_19;
  c_19.xyz = (tmpvar_6 * light_5.xyz);
  c_19.w = _Alpha;
  c_2 = c_19;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_16.w;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_18;
  light_5.xyz = (tmpvar_16.xyz + lm_3);
  lowp vec4 c_19;
  c_19.xyz = (tmpvar_6 * light_5.xyz);
  c_19.w = _Alpha;
  c_2 = c_19;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
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
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  light_3 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.xyz = (light_3.xyz + xlv_TEXCOORD4);
  lowp vec4 c_14;
  c_14.xyz = (tmpvar_4 * light_3.xyz);
  c_14.w = _Alpha;
  c_2 = c_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_15));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
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
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  light_3 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.xyz = (light_3.xyz + xlv_TEXCOORD4);
  lowp vec4 c_14;
  c_14.xyz = (tmpvar_4 * light_3.xyz);
  c_14.w = _Alpha;
  c_2 = c_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_15));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
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
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  light_3 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.xyz = (light_3.xyz + xlv_TEXCOORD4);
  lowp vec4 c_14;
  c_14.xyz = (tmpvar_4 * light_3.xyz);
  c_14.w = _Alpha;
  c_2 = c_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_15));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  light_3 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.xyz = (light_3.xyz + xlv_TEXCOORD4);
  lowp vec4 c_14;
  c_14.xyz = (tmpvar_4 * light_3.xyz);
  c_14.w = _Alpha;
  c_2 = c_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_15));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  light_3 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.xyz = (light_3.xyz + xlv_TEXCOORD4);
  lowp vec4 c_14;
  c_14.xyz = (tmpvar_4 * light_3.xyz);
  c_14.w = _Alpha;
  c_2 = c_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_15));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  light_3 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.xyz = (light_3.xyz + xlv_TEXCOORD4);
  lowp vec4 c_14;
  c_14.xyz = (tmpvar_4 * light_3.xyz);
  c_14.w = _Alpha;
  c_2 = c_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_15));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  light_5 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_17;
  light_5.xyz = (light_5.xyz + lm_3);
  lowp vec4 c_18;
  c_18.xyz = (tmpvar_6 * light_5.xyz);
  c_18.w = _Alpha;
  c_2 = c_18;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_19));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  light_5 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_17;
  light_5.xyz = (light_5.xyz + lm_3);
  lowp vec4 c_18;
  c_18.xyz = (tmpvar_6 * light_5.xyz);
  c_18.w = _Alpha;
  c_2 = c_18;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_19));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  light_5 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_17;
  light_5.xyz = (light_5.xyz + lm_3);
  lowp vec4 c_18;
  c_18.xyz = (tmpvar_6 * light_5.xyz);
  c_18.w = _Alpha;
  c_2 = c_18;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_19));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  light_5 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_17;
  light_5.xyz = (light_5.xyz + lm_3);
  lowp vec4 c_18;
  c_18.xyz = (tmpvar_6 * light_5.xyz);
  c_18.w = _Alpha;
  c_2 = c_18;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_19));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  light_5 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_17;
  light_5.xyz = (light_5.xyz + lm_3);
  lowp vec4 c_18;
  c_18.xyz = (tmpvar_6 * light_5.xyz);
  c_18.w = _Alpha;
  c_2 = c_18;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_19));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  light_5 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  mediump vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_17;
  light_5.xyz = (light_5.xyz + lm_3);
  lowp vec4 c_18;
  c_18.xyz = (tmpvar_6 * light_5.xyz);
  c_18.w = _Alpha;
  c_2 = c_18;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_19));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_14.w;
  light_3.xyz = (tmpvar_14.xyz + xlv_TEXCOORD4);
  lowp vec4 c_15;
  c_15.xyz = (tmpvar_4 * light_3.xyz);
  c_15.w = _Alpha;
  c_2 = c_15;
  highp float tmpvar_16;
  tmpvar_16 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_16));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_14.w;
  light_3.xyz = (tmpvar_14.xyz + xlv_TEXCOORD4);
  lowp vec4 c_15;
  c_15.xyz = (tmpvar_4 * light_3.xyz);
  c_15.w = _Alpha;
  c_2 = c_15;
  highp float tmpvar_16;
  tmpvar_16 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_16));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
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
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normalize((_glesNormal * tmpvar_8));
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
  tmpvar_2 = tmpvar_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  lowp float p_5;
  lowp vec4 c_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_6.w = tmpvar_7.w;
  c_6.xyz = (tmpvar_7.xyz + ((_CarColor * tmpvar_7.w).xyz * tmpvar_7.xyz));
  highp float tmpvar_8;
  tmpvar_8 = float((_Power == 1.0));
  p_5 = tmpvar_8;
  highp vec3 tmpvar_9;
  lowp vec3 y_10;
  y_10 = (c_6.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_9 = mix (c_6.xyz, y_10, vec3(_Power));
  highp vec3 tmpvar_11;
  tmpvar_11 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_4 = ((tmpvar_9 - (p_5 * 0.4)) + tmpvar_11);
  lowp float x_12;
  x_12 = (_Alpha - _Cut);
  if ((x_12 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_14.w;
  light_3.xyz = (tmpvar_14.xyz + xlv_TEXCOORD4);
  lowp vec4 c_15;
  c_15.xyz = (tmpvar_4 * light_3.xyz);
  c_15.w = _Alpha;
  c_2 = c_15;
  highp float tmpvar_16;
  tmpvar_16 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_16));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_16.w;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_18;
  light_5.xyz = (tmpvar_16.xyz + lm_3);
  lowp vec4 c_19;
  c_19.xyz = (tmpvar_6 * light_5.xyz);
  c_19.w = _Alpha;
  c_2 = c_19;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_20));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_16.w;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_18;
  light_5.xyz = (tmpvar_16.xyz + lm_3);
  lowp vec4 c_19;
  c_19.xyz = (tmpvar_6 * light_5.xyz);
  c_19.w = _Alpha;
  c_2 = c_19;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_20));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_16.w;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_18;
  light_5.xyz = (tmpvar_16.xyz + lm_3);
  lowp vec4 c_19;
  c_19.xyz = (tmpvar_6 * light_5.xyz);
  c_19.w = _Alpha;
  c_2 = c_19;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_20));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_16.w;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_18;
  light_5.xyz = (tmpvar_16.xyz + lm_3);
  lowp vec4 c_19;
  c_19.xyz = (tmpvar_6 * light_5.xyz);
  c_19.w = _Alpha;
  c_2 = c_19;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_20));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_16.w;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_18;
  light_5.xyz = (tmpvar_16.xyz + lm_3);
  lowp vec4 c_19;
  c_19.xyz = (tmpvar_6 * light_5.xyz);
  c_19.w = _Alpha;
  c_2 = c_19;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_20));
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = tmpvar_1.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_9.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_10)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform sampler2D _LightBuffer;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 lm_3;
  lowp vec4 lmtex_4;
  mediump vec4 light_5;
  lowp vec3 tmpvar_6;
  lowp float p_7;
  lowp vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_8.w = tmpvar_9.w;
  c_8.xyz = (tmpvar_9.xyz + ((_CarColor * tmpvar_9.w).xyz * tmpvar_9.xyz));
  highp float tmpvar_10;
  tmpvar_10 = float((_Power == 1.0));
  p_7 = tmpvar_10;
  highp vec3 tmpvar_11;
  lowp vec3 y_12;
  y_12 = (c_8.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_11 = mix (c_8.xyz, y_12, vec3(_Power));
  highp vec3 tmpvar_13;
  tmpvar_13 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_6 = ((tmpvar_11 - (p_7 * 0.4)) + tmpvar_13);
  lowp float x_14;
  x_14 = (_Alpha - _Cut);
  if ((x_14 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_5 = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_16.w;
  mediump vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lmtex_4 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (unity_Lightmap_HDR.x * lmtex_4.xyz);
  lm_3 = tmpvar_18;
  light_5.xyz = (tmpvar_16.xyz + lm_3);
  lowp vec4 c_19;
  c_19.xyz = (tmpvar_6 * light_5.xyz);
  c_19.w = _Alpha;
  c_2 = c_19;
  highp float tmpvar_20;
  tmpvar_20 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_20));
  tmpvar_1 = c_2;
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
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
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
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" "UNITY_HDR_ON" }
""
}
}
}
 Pass {
  Name "DEFERRED"
  LOD 150
  Tags { "LIGHTMODE" = "DEFERRED" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  GpuProgramID 227214
Program "vp" {
SubProgram "gles hw_tier00 " {
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
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 outEmission_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec4 emission_12;
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_13 = tmpvar_3;
  tmpvar_14 = tmpvar_2;
  mediump vec4 outGBuffer2_15;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = tmpvar_13;
  tmpvar_16.w = 1.0;
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_17.w = 0.0;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = ((tmpvar_14 * 0.5) + 0.5);
  outGBuffer2_15 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = vec3(0.0, 0.0, 0.0);
  emission_12 = tmpvar_19;
  emission_12.xyz = emission_12.xyz;
  outEmission_1.w = emission_12.w;
  outEmission_1.xyz = exp2(-(emission_12.xyz));
  gl_FragData[0] = tmpvar_16;
  gl_FragData[1] = tmpvar_17;
  gl_FragData[2] = outGBuffer2_15;
  gl_FragData[3] = outEmission_1;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
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
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 outEmission_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec4 emission_12;
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_13 = tmpvar_3;
  tmpvar_14 = tmpvar_2;
  mediump vec4 outGBuffer2_15;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = tmpvar_13;
  tmpvar_16.w = 1.0;
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_17.w = 0.0;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = ((tmpvar_14 * 0.5) + 0.5);
  outGBuffer2_15 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = vec3(0.0, 0.0, 0.0);
  emission_12 = tmpvar_19;
  emission_12.xyz = emission_12.xyz;
  outEmission_1.w = emission_12.w;
  outEmission_1.xyz = exp2(-(emission_12.xyz));
  gl_FragData[0] = tmpvar_16;
  gl_FragData[1] = tmpvar_17;
  gl_FragData[2] = outGBuffer2_15;
  gl_FragData[3] = outEmission_1;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
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
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 outEmission_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec4 emission_12;
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_13 = tmpvar_3;
  tmpvar_14 = tmpvar_2;
  mediump vec4 outGBuffer2_15;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = tmpvar_13;
  tmpvar_16.w = 1.0;
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_17.w = 0.0;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = ((tmpvar_14 * 0.5) + 0.5);
  outGBuffer2_15 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = vec3(0.0, 0.0, 0.0);
  emission_12 = tmpvar_19;
  emission_12.xyz = emission_12.xyz;
  outEmission_1.w = emission_12.w;
  outEmission_1.xyz = exp2(-(emission_12.xyz));
  gl_FragData[0] = tmpvar_16;
  gl_FragData[1] = tmpvar_17;
  gl_FragData[2] = outGBuffer2_15;
  gl_FragData[3] = outEmission_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" }
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
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
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize((_glesNormal * tmpvar_3));
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
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
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec4 outEmission_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec4 emission_12;
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_13 = tmpvar_3;
  tmpvar_14 = tmpvar_2;
  mediump vec4 outGBuffer2_15;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = tmpvar_13;
  tmpvar_16.w = 1.0;
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_17.w = 0.0;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = ((tmpvar_14 * 0.5) + 0.5);
  outGBuffer2_15 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = vec3(0.0, 0.0, 0.0);
  emission_12 = tmpvar_19;
  emission_12.xyz = (emission_12.xyz + (tmpvar_3 * xlv_TEXCOORD4));
  outEmission_1.w = emission_12.w;
  outEmission_1.xyz = exp2(-(emission_12.xyz));
  gl_FragData[0] = tmpvar_16;
  gl_FragData[1] = tmpvar_17;
  gl_FragData[2] = outGBuffer2_15;
  gl_FragData[3] = outEmission_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" }
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
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
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize((_glesNormal * tmpvar_3));
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
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
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec4 outEmission_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec4 emission_12;
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_13 = tmpvar_3;
  tmpvar_14 = tmpvar_2;
  mediump vec4 outGBuffer2_15;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = tmpvar_13;
  tmpvar_16.w = 1.0;
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_17.w = 0.0;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = ((tmpvar_14 * 0.5) + 0.5);
  outGBuffer2_15 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = vec3(0.0, 0.0, 0.0);
  emission_12 = tmpvar_19;
  emission_12.xyz = (emission_12.xyz + (tmpvar_3 * xlv_TEXCOORD4));
  outEmission_1.w = emission_12.w;
  outEmission_1.xyz = exp2(-(emission_12.xyz));
  gl_FragData[0] = tmpvar_16;
  gl_FragData[1] = tmpvar_17;
  gl_FragData[2] = outGBuffer2_15;
  gl_FragData[3] = outEmission_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" }
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
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
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize((_glesNormal * tmpvar_3));
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
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
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec4 outEmission_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec4 emission_12;
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_13 = tmpvar_3;
  tmpvar_14 = tmpvar_2;
  mediump vec4 outGBuffer2_15;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = tmpvar_13;
  tmpvar_16.w = 1.0;
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_17.w = 0.0;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = ((tmpvar_14 * 0.5) + 0.5);
  outGBuffer2_15 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = vec3(0.0, 0.0, 0.0);
  emission_12 = tmpvar_19;
  emission_12.xyz = (emission_12.xyz + (tmpvar_3 * xlv_TEXCOORD4));
  outEmission_1.w = emission_12.w;
  outEmission_1.xyz = exp2(-(emission_12.xyz));
  gl_FragData[0] = tmpvar_16;
  gl_FragData[1] = tmpvar_17;
  gl_FragData[2] = outGBuffer2_15;
  gl_FragData[3] = outEmission_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_7)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = tmpvar_6.xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec4 outEmission_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  mediump vec4 emission_14;
  mediump vec3 tmpvar_15;
  highp vec3 tmpvar_16;
  tmpvar_15 = tmpvar_3;
  tmpvar_16 = tmpvar_2;
  mediump vec4 outGBuffer2_17;
  mediump vec4 tmpvar_18;
  tmpvar_18.xyz = tmpvar_15;
  tmpvar_18.w = 1.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_19.w = 0.0;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = ((tmpvar_16 * 0.5) + 0.5);
  outGBuffer2_17 = tmpvar_20;
  lowp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = vec3(0.0, 0.0, 0.0);
  emission_14 = tmpvar_21;
  emission_14.xyz = (emission_14.xyz + (tmpvar_3 * (unity_Lightmap_HDR.x * color_13.xyz)));
  outEmission_1.w = emission_14.w;
  outEmission_1.xyz = exp2(-(emission_14.xyz));
  gl_FragData[0] = tmpvar_18;
  gl_FragData[1] = tmpvar_19;
  gl_FragData[2] = outGBuffer2_17;
  gl_FragData[3] = outEmission_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_7)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = tmpvar_6.xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec4 outEmission_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  mediump vec4 emission_14;
  mediump vec3 tmpvar_15;
  highp vec3 tmpvar_16;
  tmpvar_15 = tmpvar_3;
  tmpvar_16 = tmpvar_2;
  mediump vec4 outGBuffer2_17;
  mediump vec4 tmpvar_18;
  tmpvar_18.xyz = tmpvar_15;
  tmpvar_18.w = 1.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_19.w = 0.0;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = ((tmpvar_16 * 0.5) + 0.5);
  outGBuffer2_17 = tmpvar_20;
  lowp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = vec3(0.0, 0.0, 0.0);
  emission_14 = tmpvar_21;
  emission_14.xyz = (emission_14.xyz + (tmpvar_3 * (unity_Lightmap_HDR.x * color_13.xyz)));
  outEmission_1.w = emission_14.w;
  outEmission_1.xyz = exp2(-(emission_14.xyz));
  gl_FragData[0] = tmpvar_18;
  gl_FragData[1] = tmpvar_19;
  gl_FragData[2] = outGBuffer2_17;
  gl_FragData[3] = outEmission_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_7)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = tmpvar_6.xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec4 outEmission_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  mediump vec4 emission_14;
  mediump vec3 tmpvar_15;
  highp vec3 tmpvar_16;
  tmpvar_15 = tmpvar_3;
  tmpvar_16 = tmpvar_2;
  mediump vec4 outGBuffer2_17;
  mediump vec4 tmpvar_18;
  tmpvar_18.xyz = tmpvar_15;
  tmpvar_18.w = 1.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_19.w = 0.0;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = ((tmpvar_16 * 0.5) + 0.5);
  outGBuffer2_17 = tmpvar_20;
  lowp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = vec3(0.0, 0.0, 0.0);
  emission_14 = tmpvar_21;
  emission_14.xyz = (emission_14.xyz + (tmpvar_3 * (unity_Lightmap_HDR.x * color_13.xyz)));
  outEmission_1.w = emission_14.w;
  outEmission_1.xyz = exp2(-(emission_14.xyz));
  gl_FragData[0] = tmpvar_18;
  gl_FragData[1] = tmpvar_19;
  gl_FragData[2] = outGBuffer2_17;
  gl_FragData[3] = outEmission_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_7)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = tmpvar_6.xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec4 outEmission_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec3 normalWorld_12;
  normalWorld_12 = tmpvar_2;
  mediump vec3 ambient_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = normalWorld_12;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 x1_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normalWorld_12.xyzz * normalWorld_12.yzzx);
  x1_16.x = dot (unity_SHBr, tmpvar_17);
  x1_16.y = dot (unity_SHBg, tmpvar_17);
  x1_16.z = dot (unity_SHBb, tmpvar_17);
  ambient_13 = max (vec3(0.0, 0.0, 0.0), (x_15 + (x1_16 + 
    (unity_SHC.xyz * ((normalWorld_12.x * normalWorld_12.x) - (normalWorld_12.y * normalWorld_12.y)))
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
  mediump vec4 emission_21;
  mediump vec3 tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_22 = tmpvar_3;
  tmpvar_23 = tmpvar_2;
  mediump vec4 outGBuffer2_24;
  mediump vec4 tmpvar_25;
  tmpvar_25.xyz = tmpvar_22;
  tmpvar_25.w = 1.0;
  mediump vec4 tmpvar_26;
  tmpvar_26.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_26.w = 0.0;
  highp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = ((tmpvar_23 * 0.5) + 0.5);
  outGBuffer2_24 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  emission_21 = tmpvar_28;
  emission_21.xyz = (emission_21.xyz + (tmpvar_3 * (tmpvar_18 + 
    (unity_Lightmap_HDR.x * color_20.xyz)
  )));
  outEmission_1.w = emission_21.w;
  outEmission_1.xyz = exp2(-(emission_21.xyz));
  gl_FragData[0] = tmpvar_25;
  gl_FragData[1] = tmpvar_26;
  gl_FragData[2] = outGBuffer2_24;
  gl_FragData[3] = outEmission_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_7)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = tmpvar_6.xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec4 outEmission_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec3 normalWorld_12;
  normalWorld_12 = tmpvar_2;
  mediump vec3 ambient_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = normalWorld_12;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 x1_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normalWorld_12.xyzz * normalWorld_12.yzzx);
  x1_16.x = dot (unity_SHBr, tmpvar_17);
  x1_16.y = dot (unity_SHBg, tmpvar_17);
  x1_16.z = dot (unity_SHBb, tmpvar_17);
  ambient_13 = max (vec3(0.0, 0.0, 0.0), (x_15 + (x1_16 + 
    (unity_SHC.xyz * ((normalWorld_12.x * normalWorld_12.x) - (normalWorld_12.y * normalWorld_12.y)))
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
  mediump vec4 emission_21;
  mediump vec3 tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_22 = tmpvar_3;
  tmpvar_23 = tmpvar_2;
  mediump vec4 outGBuffer2_24;
  mediump vec4 tmpvar_25;
  tmpvar_25.xyz = tmpvar_22;
  tmpvar_25.w = 1.0;
  mediump vec4 tmpvar_26;
  tmpvar_26.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_26.w = 0.0;
  highp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = ((tmpvar_23 * 0.5) + 0.5);
  outGBuffer2_24 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  emission_21 = tmpvar_28;
  emission_21.xyz = (emission_21.xyz + (tmpvar_3 * (tmpvar_18 + 
    (unity_Lightmap_HDR.x * color_20.xyz)
  )));
  outEmission_1.w = emission_21.w;
  outEmission_1.xyz = exp2(-(emission_21.xyz));
  gl_FragData[0] = tmpvar_25;
  gl_FragData[1] = tmpvar_26;
  gl_FragData[2] = outGBuffer2_24;
  gl_FragData[3] = outEmission_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_7)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = tmpvar_6.xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec4 outEmission_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  mediump vec3 normalWorld_12;
  normalWorld_12 = tmpvar_2;
  mediump vec3 ambient_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = normalWorld_12;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 x1_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normalWorld_12.xyzz * normalWorld_12.yzzx);
  x1_16.x = dot (unity_SHBr, tmpvar_17);
  x1_16.y = dot (unity_SHBg, tmpvar_17);
  x1_16.z = dot (unity_SHBb, tmpvar_17);
  ambient_13 = max (vec3(0.0, 0.0, 0.0), (x_15 + (x1_16 + 
    (unity_SHC.xyz * ((normalWorld_12.x * normalWorld_12.x) - (normalWorld_12.y * normalWorld_12.y)))
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
  mediump vec4 emission_21;
  mediump vec3 tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_22 = tmpvar_3;
  tmpvar_23 = tmpvar_2;
  mediump vec4 outGBuffer2_24;
  mediump vec4 tmpvar_25;
  tmpvar_25.xyz = tmpvar_22;
  tmpvar_25.w = 1.0;
  mediump vec4 tmpvar_26;
  tmpvar_26.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_26.w = 0.0;
  highp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = ((tmpvar_23 * 0.5) + 0.5);
  outGBuffer2_24 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  emission_21 = tmpvar_28;
  emission_21.xyz = (emission_21.xyz + (tmpvar_3 * (tmpvar_18 + 
    (unity_Lightmap_HDR.x * color_20.xyz)
  )));
  outEmission_1.w = emission_21.w;
  outEmission_1.xyz = exp2(-(emission_21.xyz));
  gl_FragData[0] = tmpvar_25;
  gl_FragData[1] = tmpvar_26;
  gl_FragData[2] = outGBuffer2_24;
  gl_FragData[3] = outEmission_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
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
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize((_glesNormal * tmpvar_3));
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
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
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec4 emission_11;
  mediump vec3 tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = tmpvar_2;
  tmpvar_13 = tmpvar_1;
  mediump vec4 outGBuffer2_14;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_12;
  tmpvar_15.w = 1.0;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_16.w = 0.0;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = ((tmpvar_13 * 0.5) + 0.5);
  outGBuffer2_14 = tmpvar_17;
  lowp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = vec3(0.0, 0.0, 0.0);
  emission_11 = tmpvar_18;
  emission_11.xyz = (emission_11.xyz + (tmpvar_2 * xlv_TEXCOORD4));
  gl_FragData[0] = tmpvar_15;
  gl_FragData[1] = tmpvar_16;
  gl_FragData[2] = outGBuffer2_14;
  gl_FragData[3] = emission_11;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
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
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize((_glesNormal * tmpvar_3));
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
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
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec4 emission_11;
  mediump vec3 tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = tmpvar_2;
  tmpvar_13 = tmpvar_1;
  mediump vec4 outGBuffer2_14;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_12;
  tmpvar_15.w = 1.0;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_16.w = 0.0;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = ((tmpvar_13 * 0.5) + 0.5);
  outGBuffer2_14 = tmpvar_17;
  lowp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = vec3(0.0, 0.0, 0.0);
  emission_11 = tmpvar_18;
  emission_11.xyz = (emission_11.xyz + (tmpvar_2 * xlv_TEXCOORD4));
  gl_FragData[0] = tmpvar_15;
  gl_FragData[1] = tmpvar_16;
  gl_FragData[2] = outGBuffer2_14;
  gl_FragData[3] = emission_11;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
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
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize((_glesNormal * tmpvar_3));
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
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
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec4 emission_11;
  mediump vec3 tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = tmpvar_2;
  tmpvar_13 = tmpvar_1;
  mediump vec4 outGBuffer2_14;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_12;
  tmpvar_15.w = 1.0;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_16.w = 0.0;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = ((tmpvar_13 * 0.5) + 0.5);
  outGBuffer2_14 = tmpvar_17;
  lowp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = vec3(0.0, 0.0, 0.0);
  emission_11 = tmpvar_18;
  emission_11.xyz = (emission_11.xyz + (tmpvar_2 * xlv_TEXCOORD4));
  gl_FragData[0] = tmpvar_15;
  gl_FragData[1] = tmpvar_16;
  gl_FragData[2] = outGBuffer2_14;
  gl_FragData[3] = emission_11;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_7)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = tmpvar_6.xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec4 emission_13;
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_14 = tmpvar_2;
  tmpvar_15 = tmpvar_1;
  mediump vec4 outGBuffer2_16;
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = tmpvar_14;
  tmpvar_17.w = 1.0;
  mediump vec4 tmpvar_18;
  tmpvar_18.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_18.w = 0.0;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = ((tmpvar_15 * 0.5) + 0.5);
  outGBuffer2_16 = tmpvar_19;
  lowp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = vec3(0.0, 0.0, 0.0);
  emission_13 = tmpvar_20;
  emission_13.xyz = (emission_13.xyz + (tmpvar_2 * (unity_Lightmap_HDR.x * color_12.xyz)));
  gl_FragData[0] = tmpvar_17;
  gl_FragData[1] = tmpvar_18;
  gl_FragData[2] = outGBuffer2_16;
  gl_FragData[3] = emission_13;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_7)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = tmpvar_6.xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec4 emission_13;
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_14 = tmpvar_2;
  tmpvar_15 = tmpvar_1;
  mediump vec4 outGBuffer2_16;
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = tmpvar_14;
  tmpvar_17.w = 1.0;
  mediump vec4 tmpvar_18;
  tmpvar_18.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_18.w = 0.0;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = ((tmpvar_15 * 0.5) + 0.5);
  outGBuffer2_16 = tmpvar_19;
  lowp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = vec3(0.0, 0.0, 0.0);
  emission_13 = tmpvar_20;
  emission_13.xyz = (emission_13.xyz + (tmpvar_2 * (unity_Lightmap_HDR.x * color_12.xyz)));
  gl_FragData[0] = tmpvar_17;
  gl_FragData[1] = tmpvar_18;
  gl_FragData[2] = outGBuffer2_16;
  gl_FragData[3] = emission_13;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_7)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = tmpvar_6.xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD3.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec4 emission_13;
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_14 = tmpvar_2;
  tmpvar_15 = tmpvar_1;
  mediump vec4 outGBuffer2_16;
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = tmpvar_14;
  tmpvar_17.w = 1.0;
  mediump vec4 tmpvar_18;
  tmpvar_18.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_18.w = 0.0;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = ((tmpvar_15 * 0.5) + 0.5);
  outGBuffer2_16 = tmpvar_19;
  lowp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = vec3(0.0, 0.0, 0.0);
  emission_13 = tmpvar_20;
  emission_13.xyz = (emission_13.xyz + (tmpvar_2 * (unity_Lightmap_HDR.x * color_12.xyz)));
  gl_FragData[0] = tmpvar_17;
  gl_FragData[1] = tmpvar_18;
  gl_FragData[2] = outGBuffer2_16;
  gl_FragData[3] = emission_13;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_7)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = tmpvar_6.xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec3 normalWorld_11;
  normalWorld_11 = tmpvar_1;
  mediump vec3 ambient_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = normalWorld_11;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, tmpvar_13);
  x_14.y = dot (unity_SHAg, tmpvar_13);
  x_14.z = dot (unity_SHAb, tmpvar_13);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normalWorld_11.xyzz * normalWorld_11.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  ambient_12 = max (vec3(0.0, 0.0, 0.0), (x_14 + (x1_15 + 
    (unity_SHC.xyz * ((normalWorld_11.x * normalWorld_11.x) - (normalWorld_11.y * normalWorld_11.y)))
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
  mediump vec4 emission_20;
  mediump vec3 tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_21 = tmpvar_2;
  tmpvar_22 = tmpvar_1;
  mediump vec4 outGBuffer2_23;
  mediump vec4 tmpvar_24;
  tmpvar_24.xyz = tmpvar_21;
  tmpvar_24.w = 1.0;
  mediump vec4 tmpvar_25;
  tmpvar_25.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_25.w = 0.0;
  highp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = ((tmpvar_22 * 0.5) + 0.5);
  outGBuffer2_23 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = vec3(0.0, 0.0, 0.0);
  emission_20 = tmpvar_27;
  emission_20.xyz = (emission_20.xyz + (tmpvar_2 * (tmpvar_17 + 
    (unity_Lightmap_HDR.x * color_19.xyz)
  )));
  gl_FragData[0] = tmpvar_24;
  gl_FragData[1] = tmpvar_25;
  gl_FragData[2] = outGBuffer2_23;
  gl_FragData[3] = emission_20;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_7)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = tmpvar_6.xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec3 normalWorld_11;
  normalWorld_11 = tmpvar_1;
  mediump vec3 ambient_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = normalWorld_11;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, tmpvar_13);
  x_14.y = dot (unity_SHAg, tmpvar_13);
  x_14.z = dot (unity_SHAb, tmpvar_13);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normalWorld_11.xyzz * normalWorld_11.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  ambient_12 = max (vec3(0.0, 0.0, 0.0), (x_14 + (x1_15 + 
    (unity_SHC.xyz * ((normalWorld_11.x * normalWorld_11.x) - (normalWorld_11.y * normalWorld_11.y)))
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
  mediump vec4 emission_20;
  mediump vec3 tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_21 = tmpvar_2;
  tmpvar_22 = tmpvar_1;
  mediump vec4 outGBuffer2_23;
  mediump vec4 tmpvar_24;
  tmpvar_24.xyz = tmpvar_21;
  tmpvar_24.w = 1.0;
  mediump vec4 tmpvar_25;
  tmpvar_25.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_25.w = 0.0;
  highp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = ((tmpvar_22 * 0.5) + 0.5);
  outGBuffer2_23 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = vec3(0.0, 0.0, 0.0);
  emission_20 = tmpvar_27;
  emission_20.xyz = (emission_20.xyz + (tmpvar_2 * (tmpvar_17 + 
    (unity_Lightmap_HDR.x * color_19.xyz)
  )));
  gl_FragData[0] = tmpvar_24;
  gl_FragData[1] = tmpvar_25;
  gl_FragData[2] = outGBuffer2_23;
  gl_FragData[3] = emission_20;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  highp vec4 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3.xyz = ((tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  tmpvar_3.w = (-((unity_MatrixV * 
    (unity_ObjectToWorld * tmpvar_7)
  ).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((_glesNormal * tmpvar_5));
  xlv_TEXCOORD2 = tmpvar_6.xyz;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_draw_buffers : enable
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  tmpvar_1 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_2;
  lowp float p_3;
  lowp vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_4.w = tmpvar_5.w;
  c_4.xyz = (tmpvar_5.xyz + ((_CarColor * tmpvar_5.w).xyz * tmpvar_5.xyz));
  highp float tmpvar_6;
  tmpvar_6 = float((_Power == 1.0));
  p_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  lowp vec3 y_8;
  y_8 = (c_4.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_7 = mix (c_4.xyz, y_8, vec3(_Power));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_2 = ((tmpvar_7 - (p_3 * 0.4)) + tmpvar_9);
  lowp float x_10;
  x_10 = (_Alpha - _Cut);
  if ((x_10 < 0.0)) {
    discard;
  };
  mediump vec3 normalWorld_11;
  normalWorld_11 = tmpvar_1;
  mediump vec3 ambient_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = normalWorld_11;
  mediump vec3 x_14;
  x_14.x = dot (unity_SHAr, tmpvar_13);
  x_14.y = dot (unity_SHAg, tmpvar_13);
  x_14.z = dot (unity_SHAb, tmpvar_13);
  mediump vec3 x1_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normalWorld_11.xyzz * normalWorld_11.yzzx);
  x1_15.x = dot (unity_SHBr, tmpvar_16);
  x1_15.y = dot (unity_SHBg, tmpvar_16);
  x1_15.z = dot (unity_SHBb, tmpvar_16);
  ambient_12 = max (vec3(0.0, 0.0, 0.0), (x_14 + (x1_15 + 
    (unity_SHC.xyz * ((normalWorld_11.x * normalWorld_11.x) - (normalWorld_11.y * normalWorld_11.y)))
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
  mediump vec4 emission_20;
  mediump vec3 tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_21 = tmpvar_2;
  tmpvar_22 = tmpvar_1;
  mediump vec4 outGBuffer2_23;
  mediump vec4 tmpvar_24;
  tmpvar_24.xyz = tmpvar_21;
  tmpvar_24.w = 1.0;
  mediump vec4 tmpvar_25;
  tmpvar_25.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_25.w = 0.0;
  highp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = ((tmpvar_22 * 0.5) + 0.5);
  outGBuffer2_23 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = vec3(0.0, 0.0, 0.0);
  emission_20 = tmpvar_27;
  emission_20.xyz = (emission_20.xyz + (tmpvar_2 * (tmpvar_17 + 
    (unity_Lightmap_HDR.x * color_19.xyz)
  )));
  gl_FragData[0] = tmpvar_24;
  gl_FragData[1] = tmpvar_25;
  gl_FragData[2] = outGBuffer2_23;
  gl_FragData[3] = emission_20;
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
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
}
}
 Pass {
  Name "META"
  LOD 150
  Tags { "LIGHTMODE" = "META" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 278414
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_12;
  res_12 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_13;
    tmpvar_13.w = 1.0;
    tmpvar_13.xyz = tmpvar_2;
    res_12.w = tmpvar_13.w;
    highp vec3 tmpvar_14;
    tmpvar_14 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_12.xyz = tmpvar_14;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_15;
    if (bool(unity_UseLinearSpace)) {
      emission_15 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_15 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_16;
    tmpvar_16.w = 1.0;
    tmpvar_16.xyz = emission_15;
    res_12 = tmpvar_16;
  };
  tmpvar_1 = res_12;
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_12;
  res_12 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_13;
    tmpvar_13.w = 1.0;
    tmpvar_13.xyz = tmpvar_2;
    res_12.w = tmpvar_13.w;
    highp vec3 tmpvar_14;
    tmpvar_14 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_12.xyz = tmpvar_14;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_15;
    if (bool(unity_UseLinearSpace)) {
      emission_15 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_15 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_16;
    tmpvar_16.w = 1.0;
    tmpvar_16.xyz = emission_15;
    res_12 = tmpvar_16;
  };
  tmpvar_1 = res_12;
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
uniform sampler2D _Detail;
uniform highp float _Power;
uniform highp float _Damage;
uniform lowp vec4 _CarColor;
uniform lowp float _Alpha;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
uniform lowp float _Cut;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp float p_4;
  lowp vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5.w = tmpvar_6.w;
  c_5.xyz = (tmpvar_6.xyz + ((_CarColor * tmpvar_6.w).xyz * tmpvar_6.xyz));
  highp float tmpvar_7;
  tmpvar_7 = float((_Power == 1.0));
  p_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  lowp vec3 y_9;
  y_9 = (c_5.xyz * texture2D (_Detail, xlv_TEXCOORD0).xyz);
  tmpvar_8 = mix (c_5.xyz, y_9, vec3(_Power));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_Damage * vec4(0.5, 0.0, 0.0, 0.0)).xyz;
  tmpvar_3 = ((tmpvar_8 - (p_4 * 0.4)) + tmpvar_10);
  lowp float x_11;
  x_11 = (_Alpha - _Cut);
  if ((x_11 < 0.0)) {
    discard;
  };
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_12;
  res_12 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    mediump vec4 tmpvar_13;
    tmpvar_13.w = 1.0;
    tmpvar_13.xyz = tmpvar_2;
    res_12.w = tmpvar_13.w;
    highp vec3 tmpvar_14;
    tmpvar_14 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_12.xyz = tmpvar_14;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_15;
    if (bool(unity_UseLinearSpace)) {
      emission_15 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_15 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_16;
    tmpvar_16.w = 1.0;
    tmpvar_16.xyz = emission_15;
    res_12 = tmpvar_16;
  };
  tmpvar_1 = res_12;
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
Fallback "Mobile/VertexLit"
}