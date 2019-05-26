//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Decal/Transparent Bumped Diffuse" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_BumpMap ("Normalmap", 2D) = "bump" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Offset -1, -1
  GpuProgramID 7179
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_7.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_7.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_7.w;
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
attribute vec4 _glesTANGENT;
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
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  mediump vec3 normal_16;
  normal_16 = tmpvar_8;
  mediump vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = normal_16;
  mediump vec3 res_18;
  mediump vec3 x_19;
  x_19.x = dot (unity_SHAr, tmpvar_17);
  x_19.y = dot (unity_SHAg, tmpvar_17);
  x_19.z = dot (unity_SHAb, tmpvar_17);
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normal_16.xyzz * normal_16.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  res_18 = (x_19 + (x1_20 + (unity_SHC.xyz * 
    ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y))
  )));
  mediump vec3 tmpvar_22;
  tmpvar_22 = max (((1.055 * 
    pow (max (res_18, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_18 = tmpvar_22;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_22);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_7.w;
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_7.xyz * xlv_TEXCOORD4));
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  mediump vec3 normal_16;
  normal_16 = tmpvar_8;
  mediump vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = normal_16;
  mediump vec3 res_18;
  mediump vec3 x_19;
  x_19.x = dot (unity_SHAr, tmpvar_17);
  x_19.y = dot (unity_SHAg, tmpvar_17);
  x_19.z = dot (unity_SHAb, tmpvar_17);
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normal_16.xyzz * normal_16.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  res_18 = (x_19 + (x1_20 + (unity_SHC.xyz * 
    ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y))
  )));
  mediump vec3 tmpvar_22;
  tmpvar_22 = max (((1.055 * 
    pow (max (res_18, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_18 = tmpvar_22;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_22);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_7.w;
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_7.xyz * xlv_TEXCOORD4));
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  mediump vec3 normal_16;
  normal_16 = tmpvar_8;
  mediump vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = normal_16;
  mediump vec3 res_18;
  mediump vec3 x_19;
  x_19.x = dot (unity_SHAr, tmpvar_17);
  x_19.y = dot (unity_SHAg, tmpvar_17);
  x_19.z = dot (unity_SHAb, tmpvar_17);
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normal_16.xyzz * normal_16.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  res_18 = (x_19 + (x1_20 + (unity_SHC.xyz * 
    ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y))
  )));
  mediump vec3 tmpvar_22;
  tmpvar_22 = max (((1.055 * 
    pow (max (res_18, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_18 = tmpvar_22;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_22);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_7.w;
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_7.xyz * xlv_TEXCOORD4));
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_10 = (unity_Lightmap_HDR.x * color_12.xyz);
  lowp vec4 c_13;
  lowp vec4 c_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_15 = tmpvar_16;
  c_14.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_15);
  c_14.w = tmpvar_7.w;
  c_13.w = c_14.w;
  c_13.xyz = (c_14.xyz + (tmpvar_7.xyz * tmpvar_10));
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_10 = (unity_Lightmap_HDR.x * color_12.xyz);
  lowp vec4 c_13;
  lowp vec4 c_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_15 = tmpvar_16;
  c_14.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_15);
  c_14.w = tmpvar_7.w;
  c_13.w = c_14.w;
  c_13.xyz = (c_14.xyz + (tmpvar_7.xyz * tmpvar_10));
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  tmpvar_10 = (unity_Lightmap_HDR.x * color_12.xyz);
  lowp vec4 c_13;
  lowp vec4 c_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_15 = tmpvar_16;
  c_14.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_15);
  c_14.w = tmpvar_7.w;
  c_13.w = c_14.w;
  c_13.xyz = (c_14.xyz + (tmpvar_7.xyz * tmpvar_10));
  gl_FragData[0] = c_13;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_5;
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
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_10;
  normalWorld_10 = tmpvar_4;
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
  tmpvar_18 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_19;
  color_19 = tmpvar_18;
  tmpvar_11 = (tmpvar_17 + (unity_Lightmap_HDR.x * color_19.xyz));
  lowp vec4 c_20;
  lowp vec4 c_21;
  lowp float diff_22;
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_22 = tmpvar_23;
  c_21.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_22);
  c_21.w = tmpvar_7.w;
  c_20.w = c_21.w;
  c_20.xyz = (c_21.xyz + (tmpvar_7.xyz * tmpvar_11));
  gl_FragData[0] = c_20;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_5;
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
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_10;
  normalWorld_10 = tmpvar_4;
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
  tmpvar_18 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_19;
  color_19 = tmpvar_18;
  tmpvar_11 = (tmpvar_17 + (unity_Lightmap_HDR.x * color_19.xyz));
  lowp vec4 c_20;
  lowp vec4 c_21;
  lowp float diff_22;
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_22 = tmpvar_23;
  c_21.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_22);
  c_21.w = tmpvar_7.w;
  c_20.w = c_21.w;
  c_20.xyz = (c_21.xyz + (tmpvar_7.xyz * tmpvar_11));
  gl_FragData[0] = c_20;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_5;
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
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_10;
  normalWorld_10 = tmpvar_4;
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
  tmpvar_18 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_19;
  color_19 = tmpvar_18;
  tmpvar_11 = (tmpvar_17 + (unity_Lightmap_HDR.x * color_19.xyz));
  lowp vec4 c_20;
  lowp vec4 c_21;
  lowp float diff_22;
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_22 = tmpvar_23;
  c_21.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_22);
  c_21.w = tmpvar_7.w;
  c_20.w = c_21.w;
  c_20.xyz = (c_21.xyz + (tmpvar_7.xyz * tmpvar_11));
  gl_FragData[0] = c_20;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  mediump vec3 tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_4;
  color_4 = tmpvar_3;
  tmpvar_2 = (unity_Lightmap_HDR.x * color_4.xyz);
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = tmpvar_1.w;
  c_5.w = c_6.w;
  c_5.xyz = (tmpvar_1.xyz * tmpvar_2);
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  mediump vec3 tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_4;
  color_4 = tmpvar_3;
  tmpvar_2 = (unity_Lightmap_HDR.x * color_4.xyz);
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = tmpvar_1.w;
  c_5.w = c_6.w;
  c_5.xyz = (tmpvar_1.xyz * tmpvar_2);
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  mediump vec3 tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_4;
  color_4 = tmpvar_3;
  tmpvar_2 = (unity_Lightmap_HDR.x * color_4.xyz);
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = tmpvar_1.w;
  c_5.w = c_6.w;
  c_5.xyz = (tmpvar_1.xyz * tmpvar_2);
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_5;
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
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec3 worldN_1;
  lowp vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_4;
  tmpvar_4 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_1.x = dot (xlv_TEXCOORD1.xyz, tmpvar_4);
  worldN_1.y = dot (xlv_TEXCOORD2.xyz, tmpvar_4);
  worldN_1.z = dot (xlv_TEXCOORD3.xyz, tmpvar_4);
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(worldN_1);
  worldN_1 = tmpvar_5;
  tmpvar_2 = tmpvar_5;
  mediump vec3 normalWorld_6;
  normalWorld_6 = tmpvar_2;
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
  tmpvar_14 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_15;
  color_15 = tmpvar_14;
  tmpvar_7 = (tmpvar_13 + (unity_Lightmap_HDR.x * color_15.xyz));
  lowp vec4 c_16;
  lowp vec4 c_17;
  c_17.xyz = vec3(0.0, 0.0, 0.0);
  c_17.w = tmpvar_3.w;
  c_16.w = c_17.w;
  c_16.xyz = (tmpvar_3.xyz * tmpvar_7);
  gl_FragData[0] = c_16;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_5;
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
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec3 worldN_1;
  lowp vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_4;
  tmpvar_4 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_1.x = dot (xlv_TEXCOORD1.xyz, tmpvar_4);
  worldN_1.y = dot (xlv_TEXCOORD2.xyz, tmpvar_4);
  worldN_1.z = dot (xlv_TEXCOORD3.xyz, tmpvar_4);
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(worldN_1);
  worldN_1 = tmpvar_5;
  tmpvar_2 = tmpvar_5;
  mediump vec3 normalWorld_6;
  normalWorld_6 = tmpvar_2;
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
  tmpvar_14 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_15;
  color_15 = tmpvar_14;
  tmpvar_7 = (tmpvar_13 + (unity_Lightmap_HDR.x * color_15.xyz));
  lowp vec4 c_16;
  lowp vec4 c_17;
  c_17.xyz = vec3(0.0, 0.0, 0.0);
  c_17.w = tmpvar_3.w;
  c_16.w = c_17.w;
  c_16.xyz = (tmpvar_3.xyz * tmpvar_7);
  gl_FragData[0] = c_16;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_5;
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
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec3 worldN_1;
  lowp vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_4;
  tmpvar_4 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_1.x = dot (xlv_TEXCOORD1.xyz, tmpvar_4);
  worldN_1.y = dot (xlv_TEXCOORD2.xyz, tmpvar_4);
  worldN_1.z = dot (xlv_TEXCOORD3.xyz, tmpvar_4);
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(worldN_1);
  worldN_1 = tmpvar_5;
  tmpvar_2 = tmpvar_5;
  mediump vec3 normalWorld_6;
  normalWorld_6 = tmpvar_2;
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
  tmpvar_14 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_15;
  color_15 = tmpvar_14;
  tmpvar_7 = (tmpvar_13 + (unity_Lightmap_HDR.x * color_15.xyz));
  lowp vec4 c_16;
  lowp vec4 c_17;
  c_17.xyz = vec3(0.0, 0.0, 0.0);
  c_17.w = tmpvar_3.w;
  c_16.w = c_17.w;
  c_16.xyz = (tmpvar_3.xyz * tmpvar_7);
  gl_FragData[0] = c_16;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
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
  tmpvar_5 = col_22;
  mediump vec3 normal_31;
  normal_31 = tmpvar_9;
  mediump vec3 ambient_32;
  mediump vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = normal_31;
  mediump vec3 res_34;
  mediump vec3 x_35;
  x_35.x = dot (unity_SHAr, tmpvar_33);
  x_35.y = dot (unity_SHAg, tmpvar_33);
  x_35.z = dot (unity_SHAb, tmpvar_33);
  mediump vec3 x1_36;
  mediump vec4 tmpvar_37;
  tmpvar_37 = (normal_31.xyzz * normal_31.yzzx);
  x1_36.x = dot (unity_SHBr, tmpvar_37);
  x1_36.y = dot (unity_SHBg, tmpvar_37);
  x1_36.z = dot (unity_SHBb, tmpvar_37);
  res_34 = (x_35 + (x1_36 + (unity_SHC.xyz * 
    ((normal_31.x * normal_31.x) - (normal_31.y * normal_31.y))
  )));
  mediump vec3 tmpvar_38;
  tmpvar_38 = max (((1.055 * 
    pow (max (res_34, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_34 = tmpvar_38;
  ambient_32 = (tmpvar_5 + max (vec3(0.0, 0.0, 0.0), tmpvar_38));
  tmpvar_5 = ambient_32;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = ambient_32;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_7.w;
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_7.xyz * xlv_TEXCOORD4));
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
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
  tmpvar_5 = col_22;
  mediump vec3 normal_31;
  normal_31 = tmpvar_9;
  mediump vec3 ambient_32;
  mediump vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = normal_31;
  mediump vec3 res_34;
  mediump vec3 x_35;
  x_35.x = dot (unity_SHAr, tmpvar_33);
  x_35.y = dot (unity_SHAg, tmpvar_33);
  x_35.z = dot (unity_SHAb, tmpvar_33);
  mediump vec3 x1_36;
  mediump vec4 tmpvar_37;
  tmpvar_37 = (normal_31.xyzz * normal_31.yzzx);
  x1_36.x = dot (unity_SHBr, tmpvar_37);
  x1_36.y = dot (unity_SHBg, tmpvar_37);
  x1_36.z = dot (unity_SHBb, tmpvar_37);
  res_34 = (x_35 + (x1_36 + (unity_SHC.xyz * 
    ((normal_31.x * normal_31.x) - (normal_31.y * normal_31.y))
  )));
  mediump vec3 tmpvar_38;
  tmpvar_38 = max (((1.055 * 
    pow (max (res_34, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_34 = tmpvar_38;
  ambient_32 = (tmpvar_5 + max (vec3(0.0, 0.0, 0.0), tmpvar_38));
  tmpvar_5 = ambient_32;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = ambient_32;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_7.w;
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_7.xyz * xlv_TEXCOORD4));
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
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
  tmpvar_5 = col_22;
  mediump vec3 normal_31;
  normal_31 = tmpvar_9;
  mediump vec3 ambient_32;
  mediump vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = normal_31;
  mediump vec3 res_34;
  mediump vec3 x_35;
  x_35.x = dot (unity_SHAr, tmpvar_33);
  x_35.y = dot (unity_SHAg, tmpvar_33);
  x_35.z = dot (unity_SHAb, tmpvar_33);
  mediump vec3 x1_36;
  mediump vec4 tmpvar_37;
  tmpvar_37 = (normal_31.xyzz * normal_31.yzzx);
  x1_36.x = dot (unity_SHBr, tmpvar_37);
  x1_36.y = dot (unity_SHBg, tmpvar_37);
  x1_36.z = dot (unity_SHBb, tmpvar_37);
  res_34 = (x_35 + (x1_36 + (unity_SHC.xyz * 
    ((normal_31.x * normal_31.x) - (normal_31.y * normal_31.y))
  )));
  mediump vec3 tmpvar_38;
  tmpvar_38 = max (((1.055 * 
    pow (max (res_34, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_34 = tmpvar_38;
  ambient_32 = (tmpvar_5 + max (vec3(0.0, 0.0, 0.0), tmpvar_38));
  tmpvar_5 = ambient_32;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = ambient_32;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_7.w;
  c_10.w = c_11.w;
  c_10.xyz = (c_11.xyz + (tmpvar_7.xyz * xlv_TEXCOORD4));
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_8.w;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  c_4.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_12.xyz, vec3(tmpvar_15));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_8.w;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  c_4.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_12.xyz, vec3(tmpvar_15));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_8.w;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  c_4.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_12.xyz, vec3(tmpvar_15));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  mediump vec3 normal_17;
  normal_17 = tmpvar_9;
  mediump vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = normal_17;
  mediump vec3 res_19;
  mediump vec3 x_20;
  x_20.x = dot (unity_SHAr, tmpvar_18);
  x_20.y = dot (unity_SHAg, tmpvar_18);
  x_20.z = dot (unity_SHAb, tmpvar_18);
  mediump vec3 x1_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = (normal_17.xyzz * normal_17.yzzx);
  x1_21.x = dot (unity_SHBr, tmpvar_22);
  x1_21.y = dot (unity_SHBg, tmpvar_22);
  x1_21.z = dot (unity_SHBb, tmpvar_22);
  res_19 = (x_20 + (x1_21 + (unity_SHC.xyz * 
    ((normal_17.x * normal_17.x) - (normal_17.y * normal_17.y))
  )));
  mediump vec3 tmpvar_23;
  tmpvar_23 = max (((1.055 * 
    pow (max (res_19, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_19 = tmpvar_23;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_23);
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_8.w;
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_8.xyz * xlv_TEXCOORD4));
  c_4.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_15));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  mediump vec3 normal_17;
  normal_17 = tmpvar_9;
  mediump vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = normal_17;
  mediump vec3 res_19;
  mediump vec3 x_20;
  x_20.x = dot (unity_SHAr, tmpvar_18);
  x_20.y = dot (unity_SHAg, tmpvar_18);
  x_20.z = dot (unity_SHAb, tmpvar_18);
  mediump vec3 x1_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = (normal_17.xyzz * normal_17.yzzx);
  x1_21.x = dot (unity_SHBr, tmpvar_22);
  x1_21.y = dot (unity_SHBg, tmpvar_22);
  x1_21.z = dot (unity_SHBb, tmpvar_22);
  res_19 = (x_20 + (x1_21 + (unity_SHC.xyz * 
    ((normal_17.x * normal_17.x) - (normal_17.y * normal_17.y))
  )));
  mediump vec3 tmpvar_23;
  tmpvar_23 = max (((1.055 * 
    pow (max (res_19, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_19 = tmpvar_23;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_23);
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_8.w;
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_8.xyz * xlv_TEXCOORD4));
  c_4.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_15));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  mediump vec3 normal_17;
  normal_17 = tmpvar_9;
  mediump vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = normal_17;
  mediump vec3 res_19;
  mediump vec3 x_20;
  x_20.x = dot (unity_SHAr, tmpvar_18);
  x_20.y = dot (unity_SHAg, tmpvar_18);
  x_20.z = dot (unity_SHAb, tmpvar_18);
  mediump vec3 x1_21;
  mediump vec4 tmpvar_22;
  tmpvar_22 = (normal_17.xyzz * normal_17.yzzx);
  x1_21.x = dot (unity_SHBr, tmpvar_22);
  x1_21.y = dot (unity_SHBg, tmpvar_22);
  x1_21.z = dot (unity_SHBb, tmpvar_22);
  res_19 = (x_20 + (x1_21 + (unity_SHC.xyz * 
    ((normal_17.x * normal_17.x) - (normal_17.y * normal_17.y))
  )));
  mediump vec3 tmpvar_23;
  tmpvar_23 = max (((1.055 * 
    pow (max (res_19, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_19 = tmpvar_23;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_23);
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_8.w;
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_8.xyz * xlv_TEXCOORD4));
  c_4.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_15));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 tmpvar_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  tmpvar_11 = (unity_Lightmap_HDR.x * color_13.xyz);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_16);
  c_15.w = tmpvar_8.w;
  c_14.w = c_15.w;
  c_14.xyz = (c_15.xyz + (tmpvar_8.xyz * tmpvar_11));
  c_4.w = c_14.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_14.xyz, vec3(tmpvar_18));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 tmpvar_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  tmpvar_11 = (unity_Lightmap_HDR.x * color_13.xyz);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_16);
  c_15.w = tmpvar_8.w;
  c_14.w = c_15.w;
  c_14.xyz = (c_15.xyz + (tmpvar_8.xyz * tmpvar_11));
  c_4.w = c_14.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_14.xyz, vec3(tmpvar_18));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 tmpvar_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_13;
  color_13 = tmpvar_12;
  tmpvar_11 = (unity_Lightmap_HDR.x * color_13.xyz);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_16);
  c_15.w = tmpvar_8.w;
  c_14.w = c_15.w;
  c_14.xyz = (c_15.xyz + (tmpvar_8.xyz * tmpvar_11));
  c_4.w = c_14.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_14.xyz, vec3(tmpvar_18));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
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
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 normalWorld_11;
  normalWorld_11 = tmpvar_5;
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
  tmpvar_19 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_20;
  color_20 = tmpvar_19;
  tmpvar_12 = (tmpvar_18 + (unity_Lightmap_HDR.x * color_20.xyz));
  lowp vec4 c_21;
  lowp vec4 c_22;
  lowp float diff_23;
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_23 = tmpvar_24;
  c_22.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_23);
  c_22.w = tmpvar_8.w;
  c_21.w = c_22.w;
  c_21.xyz = (c_22.xyz + (tmpvar_8.xyz * tmpvar_12));
  c_4.w = c_21.w;
  highp float tmpvar_25;
  tmpvar_25 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_21.xyz, vec3(tmpvar_25));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
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
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 normalWorld_11;
  normalWorld_11 = tmpvar_5;
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
  tmpvar_19 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_20;
  color_20 = tmpvar_19;
  tmpvar_12 = (tmpvar_18 + (unity_Lightmap_HDR.x * color_20.xyz));
  lowp vec4 c_21;
  lowp vec4 c_22;
  lowp float diff_23;
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_23 = tmpvar_24;
  c_22.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_23);
  c_22.w = tmpvar_8.w;
  c_21.w = c_22.w;
  c_21.xyz = (c_22.xyz + (tmpvar_8.xyz * tmpvar_12));
  c_4.w = c_21.w;
  highp float tmpvar_25;
  tmpvar_25 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_21.xyz, vec3(tmpvar_25));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
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
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  mediump vec3 normalWorld_11;
  normalWorld_11 = tmpvar_5;
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
  tmpvar_19 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_20;
  color_20 = tmpvar_19;
  tmpvar_12 = (tmpvar_18 + (unity_Lightmap_HDR.x * color_20.xyz));
  lowp vec4 c_21;
  lowp vec4 c_22;
  lowp float diff_23;
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_23 = tmpvar_24;
  c_22.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_23);
  c_22.w = tmpvar_8.w;
  c_21.w = c_22.w;
  c_21.xyz = (c_22.xyz + (tmpvar_8.xyz * tmpvar_12));
  c_4.w = c_21.w;
  highp float tmpvar_25;
  tmpvar_25 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_21.xyz, vec3(tmpvar_25));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  mediump vec3 tmpvar_3;
  mediump vec4 tmpvar_4;
  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_5;
  color_5 = tmpvar_4;
  tmpvar_3 = (unity_Lightmap_HDR.x * color_5.xyz);
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = tmpvar_2.w;
  c_6.w = c_7.w;
  c_6.xyz = (tmpvar_2.xyz * tmpvar_3);
  c_1.w = c_6.w;
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  mediump vec3 tmpvar_3;
  mediump vec4 tmpvar_4;
  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_5;
  color_5 = tmpvar_4;
  tmpvar_3 = (unity_Lightmap_HDR.x * color_5.xyz);
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = tmpvar_2.w;
  c_6.w = c_7.w;
  c_6.xyz = (tmpvar_2.xyz * tmpvar_3);
  c_1.w = c_6.w;
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  mediump vec3 tmpvar_3;
  mediump vec4 tmpvar_4;
  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_5;
  color_5 = tmpvar_4;
  tmpvar_3 = (unity_Lightmap_HDR.x * color_5.xyz);
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = tmpvar_2.w;
  c_6.w = c_7.w;
  c_6.xyz = (tmpvar_2.xyz * tmpvar_3);
  c_1.w = c_6.w;
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
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
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec3 worldN_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_5;
  tmpvar_5 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_1.x = dot (xlv_TEXCOORD1.xyz, tmpvar_5);
  worldN_1.y = dot (xlv_TEXCOORD2.xyz, tmpvar_5);
  worldN_1.z = dot (xlv_TEXCOORD3.xyz, tmpvar_5);
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(worldN_1);
  worldN_1 = tmpvar_6;
  tmpvar_3 = tmpvar_6;
  mediump vec3 normalWorld_7;
  normalWorld_7 = tmpvar_3;
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
  tmpvar_15 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_16;
  color_16 = tmpvar_15;
  tmpvar_8 = (tmpvar_14 + (unity_Lightmap_HDR.x * color_16.xyz));
  lowp vec4 c_17;
  lowp vec4 c_18;
  c_18.xyz = vec3(0.0, 0.0, 0.0);
  c_18.w = tmpvar_4.w;
  c_17.w = c_18.w;
  c_17.xyz = (tmpvar_4.xyz * tmpvar_8);
  c_2.w = c_17.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_17.xyz, vec3(tmpvar_19));
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
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
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec3 worldN_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_5;
  tmpvar_5 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_1.x = dot (xlv_TEXCOORD1.xyz, tmpvar_5);
  worldN_1.y = dot (xlv_TEXCOORD2.xyz, tmpvar_5);
  worldN_1.z = dot (xlv_TEXCOORD3.xyz, tmpvar_5);
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(worldN_1);
  worldN_1 = tmpvar_6;
  tmpvar_3 = tmpvar_6;
  mediump vec3 normalWorld_7;
  normalWorld_7 = tmpvar_3;
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
  tmpvar_15 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_16;
  color_16 = tmpvar_15;
  tmpvar_8 = (tmpvar_14 + (unity_Lightmap_HDR.x * color_16.xyz));
  lowp vec4 c_17;
  lowp vec4 c_18;
  c_18.xyz = vec3(0.0, 0.0, 0.0);
  c_18.w = tmpvar_4.w;
  c_17.w = c_18.w;
  c_17.xyz = (tmpvar_4.xyz * tmpvar_8);
  c_2.w = c_17.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_17.xyz, vec3(tmpvar_19));
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
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
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  highp vec3 worldN_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_5;
  tmpvar_5 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_1.x = dot (xlv_TEXCOORD1.xyz, tmpvar_5);
  worldN_1.y = dot (xlv_TEXCOORD2.xyz, tmpvar_5);
  worldN_1.z = dot (xlv_TEXCOORD3.xyz, tmpvar_5);
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(worldN_1);
  worldN_1 = tmpvar_6;
  tmpvar_3 = tmpvar_6;
  mediump vec3 normalWorld_7;
  normalWorld_7 = tmpvar_3;
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
  tmpvar_15 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lowp vec4 color_16;
  color_16 = tmpvar_15;
  tmpvar_8 = (tmpvar_14 + (unity_Lightmap_HDR.x * color_16.xyz));
  lowp vec4 c_17;
  lowp vec4 c_18;
  c_18.xyz = vec3(0.0, 0.0, 0.0);
  c_18.w = tmpvar_4.w;
  c_17.w = c_18.w;
  c_17.xyz = (tmpvar_4.xyz * tmpvar_8);
  c_2.w = c_17.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_2.xyz = mix (unity_FogColor.xyz, c_17.xyz, vec3(tmpvar_19));
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
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
  tmpvar_5 = col_23;
  mediump vec3 normal_32;
  normal_32 = tmpvar_10;
  mediump vec3 ambient_33;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = normal_32;
  mediump vec3 res_35;
  mediump vec3 x_36;
  x_36.x = dot (unity_SHAr, tmpvar_34);
  x_36.y = dot (unity_SHAg, tmpvar_34);
  x_36.z = dot (unity_SHAb, tmpvar_34);
  mediump vec3 x1_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (normal_32.xyzz * normal_32.yzzx);
  x1_37.x = dot (unity_SHBr, tmpvar_38);
  x1_37.y = dot (unity_SHBg, tmpvar_38);
  x1_37.z = dot (unity_SHBb, tmpvar_38);
  res_35 = (x_36 + (x1_37 + (unity_SHC.xyz * 
    ((normal_32.x * normal_32.x) - (normal_32.y * normal_32.y))
  )));
  mediump vec3 tmpvar_39;
  tmpvar_39 = max (((1.055 * 
    pow (max (res_35, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_35 = tmpvar_39;
  ambient_33 = (tmpvar_5 + max (vec3(0.0, 0.0, 0.0), tmpvar_39));
  tmpvar_5 = ambient_33;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = ambient_33;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_8.w;
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_8.xyz * xlv_TEXCOORD4));
  c_4.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_15));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
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
  tmpvar_5 = col_23;
  mediump vec3 normal_32;
  normal_32 = tmpvar_10;
  mediump vec3 ambient_33;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = normal_32;
  mediump vec3 res_35;
  mediump vec3 x_36;
  x_36.x = dot (unity_SHAr, tmpvar_34);
  x_36.y = dot (unity_SHAg, tmpvar_34);
  x_36.z = dot (unity_SHAb, tmpvar_34);
  mediump vec3 x1_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (normal_32.xyzz * normal_32.yzzx);
  x1_37.x = dot (unity_SHBr, tmpvar_38);
  x1_37.y = dot (unity_SHBg, tmpvar_38);
  x1_37.z = dot (unity_SHBb, tmpvar_38);
  res_35 = (x_36 + (x1_37 + (unity_SHC.xyz * 
    ((normal_32.x * normal_32.x) - (normal_32.y * normal_32.y))
  )));
  mediump vec3 tmpvar_39;
  tmpvar_39 = max (((1.055 * 
    pow (max (res_35, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_35 = tmpvar_39;
  ambient_33 = (tmpvar_5 + max (vec3(0.0, 0.0, 0.0), tmpvar_39));
  tmpvar_5 = ambient_33;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = ambient_33;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_8.w;
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_8.xyz * xlv_TEXCOORD4));
  c_4.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_15));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
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
  tmpvar_5 = col_23;
  mediump vec3 normal_32;
  normal_32 = tmpvar_10;
  mediump vec3 ambient_33;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = normal_32;
  mediump vec3 res_35;
  mediump vec3 x_36;
  x_36.x = dot (unity_SHAr, tmpvar_34);
  x_36.y = dot (unity_SHAg, tmpvar_34);
  x_36.z = dot (unity_SHAb, tmpvar_34);
  mediump vec3 x1_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (normal_32.xyzz * normal_32.yzzx);
  x1_37.x = dot (unity_SHBr, tmpvar_38);
  x1_37.y = dot (unity_SHBg, tmpvar_38);
  x1_37.z = dot (unity_SHBb, tmpvar_38);
  res_35 = (x_36 + (x1_37 + (unity_SHC.xyz * 
    ((normal_32.x * normal_32.x) - (normal_32.y * normal_32.y))
  )));
  mediump vec3 tmpvar_39;
  tmpvar_39 = max (((1.055 * 
    pow (max (res_35, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_35 = tmpvar_39;
  ambient_33 = (tmpvar_5 + max (vec3(0.0, 0.0, 0.0), tmpvar_39));
  tmpvar_5 = ambient_33;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
  xlv_TEXCOORD4 = ambient_33;
  xlv_TEXCOORD5 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1.xyz, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2.xyz, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3.xyz, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_8.w;
  c_11.w = c_12.w;
  c_11.xyz = (c_12.xyz + (tmpvar_8.xyz * xlv_TEXCOORD4));
  c_4.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = mix (unity_FogColor.xyz, c_11.xyz, vec3(tmpvar_15));
  gl_FragData[0] = c_4;
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
  GpuProgramID 99972
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_7 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD4;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11).xyz;
  highp float tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_12;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_10);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_10);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(worldN_3);
  worldN_3 = tmpvar_13;
  tmpvar_6 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9.xyz * tmpvar_1) * diff_16);
  c_15.w = tmpvar_9.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_7 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD4;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11).xyz;
  highp float tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_12;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_10);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_10);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(worldN_3);
  worldN_3 = tmpvar_13;
  tmpvar_6 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9.xyz * tmpvar_1) * diff_16);
  c_15.w = tmpvar_9.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_7 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD4;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11).xyz;
  highp float tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_12;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_10);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_10);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(worldN_3);
  worldN_3 = tmpvar_13;
  tmpvar_6 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9.xyz * tmpvar_1) * diff_16);
  c_15.w = tmpvar_9.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_7.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_7.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_8);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_8);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_8);
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(worldN_3);
  worldN_3 = tmpvar_9;
  tmpvar_4 = tmpvar_9;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_7.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_7 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD4;
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
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_10);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_10);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_10);
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(worldN_3);
  worldN_3 = tmpvar_17;
  tmpvar_6 = tmpvar_17;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_18;
  lowp vec4 c_19;
  lowp float diff_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_20 = tmpvar_21;
  c_19.xyz = ((tmpvar_9.xyz * tmpvar_1) * diff_20);
  c_19.w = tmpvar_9.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_7 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD4;
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
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_10);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_10);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_10);
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(worldN_3);
  worldN_3 = tmpvar_17;
  tmpvar_6 = tmpvar_17;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_18;
  lowp vec4 c_19;
  lowp float diff_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_20 = tmpvar_21;
  c_19.xyz = ((tmpvar_9.xyz * tmpvar_1) * diff_20);
  c_19.w = tmpvar_9.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_7 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD4;
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
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_10);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_10);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_10);
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(worldN_3);
  worldN_3 = tmpvar_17;
  tmpvar_6 = tmpvar_17;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_18;
  lowp vec4 c_19;
  lowp float diff_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_20 = tmpvar_21;
  c_19.xyz = ((tmpvar_9.xyz * tmpvar_1) * diff_20);
  c_19.w = tmpvar_9.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_7 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD4;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11).xyz;
  highp float tmpvar_12;
  tmpvar_12 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_12;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_10);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_10);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(worldN_3);
  worldN_3 = tmpvar_13;
  tmpvar_6 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9.xyz * tmpvar_1) * diff_16);
  c_15.w = tmpvar_9.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_7 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD4;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11).xyz;
  highp float tmpvar_12;
  tmpvar_12 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_12;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_10);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_10);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(worldN_3);
  worldN_3 = tmpvar_13;
  tmpvar_6 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9.xyz * tmpvar_1) * diff_16);
  c_15.w = tmpvar_9.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_7 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD4;
  lightCoord_5 = (unity_WorldToLight * tmpvar_11).xyz;
  highp float tmpvar_12;
  tmpvar_12 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_12;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_10);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_10);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(worldN_3);
  worldN_3 = tmpvar_13;
  tmpvar_6 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9.xyz * tmpvar_1) * diff_16);
  c_15.w = tmpvar_9.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD4;
  highp float tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_10).xy).w;
  atten_4 = tmpvar_11;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_9);
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize(worldN_3);
  worldN_3 = tmpvar_12;
  tmpvar_5 = tmpvar_12;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_13;
  lowp vec4 c_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_15 = tmpvar_16;
  c_14.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_15);
  c_14.w = tmpvar_8.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD4;
  highp float tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_10).xy).w;
  atten_4 = tmpvar_11;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_9);
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize(worldN_3);
  worldN_3 = tmpvar_12;
  tmpvar_5 = tmpvar_12;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_13;
  lowp vec4 c_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_15 = tmpvar_16;
  c_14.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_15);
  c_14.w = tmpvar_8.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = xlv_TEXCOORD4;
  highp float tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_10).xy).w;
  atten_4 = tmpvar_11;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_9);
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize(worldN_3);
  worldN_3 = tmpvar_12;
  tmpvar_5 = tmpvar_12;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  tmpvar_1 = (tmpvar_1 * atten_4);
  lowp vec4 c_13;
  lowp vec4 c_14;
  lowp float diff_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_15 = tmpvar_16;
  c_14.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_15);
  c_14.w = tmpvar_8.w;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp float atten_5;
  highp vec3 lightCoord_6;
  lowp vec3 tmpvar_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD4;
  lightCoord_6 = (unity_WorldToLight * tmpvar_12).xyz;
  highp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, vec2(dot (lightCoord_6, lightCoord_6))).w;
  atten_5 = tmpvar_13;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_11);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_11);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_11);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize(worldN_3);
  worldN_3 = tmpvar_14;
  tmpvar_7 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_5);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_10.xyz * tmpvar_1) * diff_17);
  c_16.w = tmpvar_10.w;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  c_4.w = c_15.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_16.xyz * vec3(tmpvar_19));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp float atten_5;
  highp vec3 lightCoord_6;
  lowp vec3 tmpvar_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD4;
  lightCoord_6 = (unity_WorldToLight * tmpvar_12).xyz;
  highp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, vec2(dot (lightCoord_6, lightCoord_6))).w;
  atten_5 = tmpvar_13;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_11);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_11);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_11);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize(worldN_3);
  worldN_3 = tmpvar_14;
  tmpvar_7 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_5);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_10.xyz * tmpvar_1) * diff_17);
  c_16.w = tmpvar_10.w;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  c_4.w = c_15.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_16.xyz * vec3(tmpvar_19));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp float atten_5;
  highp vec3 lightCoord_6;
  lowp vec3 tmpvar_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD4;
  lightCoord_6 = (unity_WorldToLight * tmpvar_12).xyz;
  highp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, vec2(dot (lightCoord_6, lightCoord_6))).w;
  atten_5 = tmpvar_13;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_11);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_11);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_11);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize(worldN_3);
  worldN_3 = tmpvar_14;
  tmpvar_7 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_5);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_10.xyz * tmpvar_1) * diff_17);
  c_16.w = tmpvar_10.w;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  c_4.w = c_15.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_16.xyz * vec3(tmpvar_19));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_8.w;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  c_4.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_12.xyz * vec3(tmpvar_15));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_8.w;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  c_4.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_12.xyz * vec3(tmpvar_15));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 lightDir_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_6 = tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_9);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_9);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_9);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(worldN_3);
  worldN_3 = tmpvar_10;
  tmpvar_5 = tmpvar_10;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_6;
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_8.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_8.w;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  c_4.w = c_11.w;
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_12.xyz * vec3(tmpvar_15));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp float atten_5;
  highp vec4 lightCoord_6;
  lowp vec3 tmpvar_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD4;
  lightCoord_6 = (unity_WorldToLight * tmpvar_12);
  lowp float tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTexture0, ((lightCoord_6.xy / lightCoord_6.w) + 0.5));
  tmpvar_13 = tmpvar_14.w;
  lowp float tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_LightTextureB0, vec2(dot (lightCoord_6.xyz, lightCoord_6.xyz)));
  tmpvar_15 = tmpvar_16.w;
  highp float tmpvar_17;
  tmpvar_17 = ((float(
    (lightCoord_6.z > 0.0)
  ) * tmpvar_13) * tmpvar_15);
  atten_5 = tmpvar_17;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_11);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_11);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_11);
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(worldN_3);
  worldN_3 = tmpvar_18;
  tmpvar_7 = tmpvar_18;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_5);
  lowp vec4 c_19;
  lowp vec4 c_20;
  lowp float diff_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_21 = tmpvar_22;
  c_20.xyz = ((tmpvar_10.xyz * tmpvar_1) * diff_21);
  c_20.w = tmpvar_10.w;
  c_19.w = c_20.w;
  c_19.xyz = c_20.xyz;
  c_4.w = c_19.w;
  highp float tmpvar_23;
  tmpvar_23 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_20.xyz * vec3(tmpvar_23));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp float atten_5;
  highp vec4 lightCoord_6;
  lowp vec3 tmpvar_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD4;
  lightCoord_6 = (unity_WorldToLight * tmpvar_12);
  lowp float tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTexture0, ((lightCoord_6.xy / lightCoord_6.w) + 0.5));
  tmpvar_13 = tmpvar_14.w;
  lowp float tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_LightTextureB0, vec2(dot (lightCoord_6.xyz, lightCoord_6.xyz)));
  tmpvar_15 = tmpvar_16.w;
  highp float tmpvar_17;
  tmpvar_17 = ((float(
    (lightCoord_6.z > 0.0)
  ) * tmpvar_13) * tmpvar_15);
  atten_5 = tmpvar_17;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_11);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_11);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_11);
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(worldN_3);
  worldN_3 = tmpvar_18;
  tmpvar_7 = tmpvar_18;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_5);
  lowp vec4 c_19;
  lowp vec4 c_20;
  lowp float diff_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_21 = tmpvar_22;
  c_20.xyz = ((tmpvar_10.xyz * tmpvar_1) * diff_21);
  c_20.w = tmpvar_10.w;
  c_19.w = c_20.w;
  c_19.xyz = c_20.xyz;
  c_4.w = c_19.w;
  highp float tmpvar_23;
  tmpvar_23 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_20.xyz * vec3(tmpvar_23));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp float atten_5;
  highp vec4 lightCoord_6;
  lowp vec3 tmpvar_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD4;
  lightCoord_6 = (unity_WorldToLight * tmpvar_12);
  lowp float tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTexture0, ((lightCoord_6.xy / lightCoord_6.w) + 0.5));
  tmpvar_13 = tmpvar_14.w;
  lowp float tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_LightTextureB0, vec2(dot (lightCoord_6.xyz, lightCoord_6.xyz)));
  tmpvar_15 = tmpvar_16.w;
  highp float tmpvar_17;
  tmpvar_17 = ((float(
    (lightCoord_6.z > 0.0)
  ) * tmpvar_13) * tmpvar_15);
  atten_5 = tmpvar_17;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_11);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_11);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_11);
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(worldN_3);
  worldN_3 = tmpvar_18;
  tmpvar_7 = tmpvar_18;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_5);
  lowp vec4 c_19;
  lowp vec4 c_20;
  lowp float diff_21;
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_21 = tmpvar_22;
  c_20.xyz = ((tmpvar_10.xyz * tmpvar_1) * diff_21);
  c_20.w = tmpvar_10.w;
  c_19.w = c_20.w;
  c_19.xyz = c_20.xyz;
  c_4.w = c_19.w;
  highp float tmpvar_23;
  tmpvar_23 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_20.xyz * vec3(tmpvar_23));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp float atten_5;
  highp vec3 lightCoord_6;
  lowp vec3 tmpvar_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD4;
  lightCoord_6 = (unity_WorldToLight * tmpvar_12).xyz;
  highp float tmpvar_13;
  tmpvar_13 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_6, lightCoord_6))).w * textureCube (_LightTexture0, lightCoord_6).w);
  atten_5 = tmpvar_13;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_11);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_11);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_11);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize(worldN_3);
  worldN_3 = tmpvar_14;
  tmpvar_7 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_5);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_10.xyz * tmpvar_1) * diff_17);
  c_16.w = tmpvar_10.w;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  c_4.w = c_15.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_16.xyz * vec3(tmpvar_19));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp float atten_5;
  highp vec3 lightCoord_6;
  lowp vec3 tmpvar_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD4;
  lightCoord_6 = (unity_WorldToLight * tmpvar_12).xyz;
  highp float tmpvar_13;
  tmpvar_13 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_6, lightCoord_6))).w * textureCube (_LightTexture0, lightCoord_6).w);
  atten_5 = tmpvar_13;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_11);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_11);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_11);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize(worldN_3);
  worldN_3 = tmpvar_14;
  tmpvar_7 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_5);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_10.xyz * tmpvar_1) * diff_17);
  c_16.w = tmpvar_10.w;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  c_4.w = c_15.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_16.xyz * vec3(tmpvar_19));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp float atten_5;
  highp vec3 lightCoord_6;
  lowp vec3 tmpvar_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = xlv_TEXCOORD4;
  lightCoord_6 = (unity_WorldToLight * tmpvar_12).xyz;
  highp float tmpvar_13;
  tmpvar_13 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_6, lightCoord_6))).w * textureCube (_LightTexture0, lightCoord_6).w);
  atten_5 = tmpvar_13;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_11);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_11);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_11);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize(worldN_3);
  worldN_3 = tmpvar_14;
  tmpvar_7 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_8;
  tmpvar_1 = (tmpvar_1 * atten_5);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_10.xyz * tmpvar_1) * diff_17);
  c_16.w = tmpvar_10.w;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  c_4.w = c_15.w;
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_16.xyz * vec3(tmpvar_19));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp float atten_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD4;
  highp float tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_11).xy).w;
  atten_5 = tmpvar_12;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_10);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_10);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(worldN_3);
  worldN_3 = tmpvar_13;
  tmpvar_6 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_5);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9.xyz * tmpvar_1) * diff_16);
  c_15.w = tmpvar_9.w;
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  c_4.w = c_14.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_15.xyz * vec3(tmpvar_18));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp float atten_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD4;
  highp float tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_11).xy).w;
  atten_5 = tmpvar_12;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_10);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_10);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(worldN_3);
  worldN_3 = tmpvar_13;
  tmpvar_6 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_5);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9.xyz * tmpvar_1) * diff_16);
  c_15.w = tmpvar_9.w;
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  c_4.w = c_14.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_15.xyz * vec3(tmpvar_18));
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  highp vec3 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform lowp vec4 _Color;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp float atten_5;
  lowp vec3 tmpvar_6;
  lowp vec3 lightDir_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _WorldSpaceLightPos0.xyz;
  lightDir_7 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = xlv_TEXCOORD4;
  highp float tmpvar_12;
  tmpvar_12 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_11).xy).w;
  atten_5 = tmpvar_12;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_10);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_10);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(worldN_3);
  worldN_3 = tmpvar_13;
  tmpvar_6 = tmpvar_13;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_7;
  tmpvar_1 = (tmpvar_1 * atten_5);
  lowp vec4 c_14;
  lowp vec4 c_15;
  lowp float diff_16;
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_16 = tmpvar_17;
  c_15.xyz = ((tmpvar_9.xyz * tmpvar_1) * diff_16);
  c_15.w = tmpvar_9.w;
  c_14.w = c_15.w;
  c_14.xyz = c_15.xyz;
  c_4.w = c_14.w;
  highp float tmpvar_18;
  tmpvar_18 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_4.xyz = (c_15.xyz * vec3(tmpvar_18));
  gl_FragData[0] = c_4;
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
  GpuProgramID 169917
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
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
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
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
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color).xyz;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
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
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
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
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color).xyz;
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
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
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
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_15;
  xlv_TEXCOORD2 = tmpvar_16;
  xlv_TEXCOORD3 = tmpvar_17;
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
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color).xyz;
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
Fallback "Decal/Transparent Diffuse"
}