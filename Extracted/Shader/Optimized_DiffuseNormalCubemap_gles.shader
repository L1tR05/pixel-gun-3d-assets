//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Optimized/DiffuseNormalCubemap" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Cube ("Cubemap", Cube) = "" { }
_GlossPower ("GlossPower", Range(0.1, 2)) = 0.5
_GlossSize ("GlossSize", Range(0.1, 10)) = 1
_ReflPower ("ReflectPower", Range(0.1, 1)) = 0.5
}
SubShader {
 LOD 150
 Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  LOD 150
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 10102
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
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
  highp vec3 tmpvar_6;
  highp vec3 I_7;
  I_7 = (tmpvar_3 - _WorldSpaceCameraPos);
  tmpvar_6 = (I_7 - (2.0 * (
    dot (tmpvar_5, I_7)
   * tmpvar_5)));
  tmpvar_1 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
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
  highp vec3 tmpvar_6;
  highp vec3 I_7;
  I_7 = (tmpvar_3 - _WorldSpaceCameraPos);
  tmpvar_6 = (I_7 - (2.0 * (
    dot (tmpvar_5, I_7)
   * tmpvar_5)));
  tmpvar_1 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
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
  highp vec3 tmpvar_6;
  highp vec3 I_7;
  I_7 = (tmpvar_3 - _WorldSpaceCameraPos);
  tmpvar_6 = (I_7 - (2.0 * (
    dot (tmpvar_5, I_7)
   * tmpvar_5)));
  tmpvar_1 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_2 = tmpvar_8;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_7;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_2 = tmpvar_8;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_7;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_2 = tmpvar_8;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_7;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_2 = tmpvar_8;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_7;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  highp vec3 worldViewDir_4;
  lowp vec3 lightDir_5;
  highp vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  worldViewDir_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_6 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float shadowMaskAttenuation_9;
  lowp float tmpvar_10;
  tmpvar_10 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_9 = tmpvar_10;
  atten_2 = shadowMaskAttenuation_9;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_8.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_11;
  mediump vec3 lightDir_12;
  lightDir_12 = lightDir_5;
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_4;
  mediump float atten_14;
  atten_14 = atten_2;
  lowp vec3 color_15;
  lowp vec4 c_16;
  lowp vec3 h_17;
  lowp float NDotL_18;
  mediump float tmpvar_19;
  tmpvar_19 = dot (tmpvar_3, lightDir_12);
  NDotL_18 = tmpvar_19;
  lowp float tmpvar_20;
  tmpvar_20 = max (0.05, NDotL_18);
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize((lightDir_12 + viewDir_13));
  h_17 = tmpvar_21;
  mediump vec3 tmpvar_22;
  tmpvar_22 = ((tmpvar_8.xyz * _LightColor0.xyz) * (tmpvar_20 * atten_14));
  color_15 = tmpvar_22;
  c_16.xyz = (color_15 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_17)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_11 = c_16;
  c_1 = (c_1 + tmpvar_11);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_6).xyz * _ReflPower) * float(
    (((tmpvar_8.x + tmpvar_8.z) + tmpvar_8.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_2 = tmpvar_8;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_7;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  highp vec3 worldViewDir_4;
  lowp vec3 lightDir_5;
  highp vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  worldViewDir_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_6 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float shadowMaskAttenuation_9;
  lowp float tmpvar_10;
  tmpvar_10 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_9 = tmpvar_10;
  atten_2 = shadowMaskAttenuation_9;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_8.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_11;
  mediump vec3 lightDir_12;
  lightDir_12 = lightDir_5;
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_4;
  mediump float atten_14;
  atten_14 = atten_2;
  lowp vec3 color_15;
  lowp vec4 c_16;
  lowp vec3 h_17;
  lowp float NDotL_18;
  mediump float tmpvar_19;
  tmpvar_19 = dot (tmpvar_3, lightDir_12);
  NDotL_18 = tmpvar_19;
  lowp float tmpvar_20;
  tmpvar_20 = max (0.05, NDotL_18);
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize((lightDir_12 + viewDir_13));
  h_17 = tmpvar_21;
  mediump vec3 tmpvar_22;
  tmpvar_22 = ((tmpvar_8.xyz * _LightColor0.xyz) * (tmpvar_20 * atten_14));
  color_15 = tmpvar_22;
  c_16.xyz = (color_15 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_17)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_11 = c_16;
  c_1 = (c_1 + tmpvar_11);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_6).xyz * _ReflPower) * float(
    (((tmpvar_8.x + tmpvar_8.z) + tmpvar_8.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_2 = tmpvar_8;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_7;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  highp vec3 worldViewDir_4;
  lowp vec3 lightDir_5;
  highp vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  worldViewDir_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_6 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float shadowMaskAttenuation_9;
  lowp float tmpvar_10;
  tmpvar_10 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_9 = tmpvar_10;
  atten_2 = shadowMaskAttenuation_9;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_8.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_11;
  mediump vec3 lightDir_12;
  lightDir_12 = lightDir_5;
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_4;
  mediump float atten_14;
  atten_14 = atten_2;
  lowp vec3 color_15;
  lowp vec4 c_16;
  lowp vec3 h_17;
  lowp float NDotL_18;
  mediump float tmpvar_19;
  tmpvar_19 = dot (tmpvar_3, lightDir_12);
  NDotL_18 = tmpvar_19;
  lowp float tmpvar_20;
  tmpvar_20 = max (0.05, NDotL_18);
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize((lightDir_12 + viewDir_13));
  h_17 = tmpvar_21;
  mediump vec3 tmpvar_22;
  tmpvar_22 = ((tmpvar_8.xyz * _LightColor0.xyz) * (tmpvar_20 * atten_14));
  color_15 = tmpvar_22;
  c_16.xyz = (color_15 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_17)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_11 = c_16;
  c_1 = (c_1 + tmpvar_11);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_6).xyz * _ReflPower) * float(
    (((tmpvar_8.x + tmpvar_8.z) + tmpvar_8.y) > 0.1)
  )));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_9 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_9 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_9 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_9 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_9 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_9 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_9 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_9 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_9 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_9 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_9 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_9 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_9 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_9 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_9 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_9 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_9 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_9 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_9 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_9 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_9 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_9 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  highp vec2 tmpvar_9;
  tmpvar_9 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_9 + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_9 + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD5 = tmpvar_2;
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD5 = tmpvar_2;
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD5 = tmpvar_2;
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
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
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD7 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
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
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD7 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
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
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD7 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4.xyz - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_4);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
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
  tmpvar_17 = (unity_4LightPosX0 - tmpvar_4.x);
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosY0 - tmpvar_4.y);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosZ0 - tmpvar_4.z);
  lengthSq_16 = (tmpvar_17 * tmpvar_17);
  lengthSq_16 = (lengthSq_16 + (tmpvar_18 * tmpvar_18));
  lengthSq_16 = (lengthSq_16 + (tmpvar_19 * tmpvar_19));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (lengthSq_16, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_16 = tmpvar_20;
  ndotl_15 = (tmpvar_17 * tmpvar_6.x);
  ndotl_15 = (ndotl_15 + (tmpvar_18 * tmpvar_6.y));
  ndotl_15 = (ndotl_15 + (tmpvar_19 * tmpvar_6.z));
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
  tmpvar_2 = col_14;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
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
  tmpvar_17 = (unity_4LightPosX0 - tmpvar_4.x);
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosY0 - tmpvar_4.y);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosZ0 - tmpvar_4.z);
  lengthSq_16 = (tmpvar_17 * tmpvar_17);
  lengthSq_16 = (lengthSq_16 + (tmpvar_18 * tmpvar_18));
  lengthSq_16 = (lengthSq_16 + (tmpvar_19 * tmpvar_19));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (lengthSq_16, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_16 = tmpvar_20;
  ndotl_15 = (tmpvar_17 * tmpvar_6.x);
  ndotl_15 = (ndotl_15 + (tmpvar_18 * tmpvar_6.y));
  ndotl_15 = (ndotl_15 + (tmpvar_19 * tmpvar_6.z));
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
  tmpvar_2 = col_14;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
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
  tmpvar_17 = (unity_4LightPosX0 - tmpvar_4.x);
  highp vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosY0 - tmpvar_4.y);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosZ0 - tmpvar_4.z);
  lengthSq_16 = (tmpvar_17 * tmpvar_17);
  lengthSq_16 = (lengthSq_16 + (tmpvar_18 * tmpvar_18));
  lengthSq_16 = (lengthSq_16 + (tmpvar_19 * tmpvar_19));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (lengthSq_16, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_16 = tmpvar_20;
  ndotl_15 = (tmpvar_17 * tmpvar_6.x);
  ndotl_15 = (ndotl_15 + (tmpvar_18 * tmpvar_6.y));
  ndotl_15 = (ndotl_15 + (tmpvar_19 * tmpvar_6.z));
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
  tmpvar_2 = col_14;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_2 = tmpvar_8;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_7;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_24 = (tmpvar_25 * tmpvar_25);
  lengthSq_24 = (lengthSq_24 + (tmpvar_26 * tmpvar_26));
  lengthSq_24 = (lengthSq_24 + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (lengthSq_24, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_24 = tmpvar_28;
  ndotl_23 = (tmpvar_25 * tmpvar_7.x);
  ndotl_23 = (ndotl_23 + (tmpvar_26 * tmpvar_7.y));
  ndotl_23 = (ndotl_23 + (tmpvar_27 * tmpvar_7.z));
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
  tmpvar_3 = (tmpvar_3 + col_22);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_2 = tmpvar_8;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_7;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_24 = (tmpvar_25 * tmpvar_25);
  lengthSq_24 = (lengthSq_24 + (tmpvar_26 * tmpvar_26));
  lengthSq_24 = (lengthSq_24 + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (lengthSq_24, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_24 = tmpvar_28;
  ndotl_23 = (tmpvar_25 * tmpvar_7.x);
  ndotl_23 = (ndotl_23 + (tmpvar_26 * tmpvar_7.y));
  ndotl_23 = (ndotl_23 + (tmpvar_27 * tmpvar_7.z));
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
  tmpvar_3 = (tmpvar_3 + col_22);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_2 = tmpvar_8;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_7;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_24 = (tmpvar_25 * tmpvar_25);
  lengthSq_24 = (lengthSq_24 + (tmpvar_26 * tmpvar_26));
  lengthSq_24 = (lengthSq_24 + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (lengthSq_24, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_24 = tmpvar_28;
  ndotl_23 = (tmpvar_25 * tmpvar_7.x);
  ndotl_23 = (ndotl_23 + (tmpvar_26 * tmpvar_7.y));
  ndotl_23 = (ndotl_23 + (tmpvar_27 * tmpvar_7.z));
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
  tmpvar_3 = (tmpvar_3 + col_22);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_1 = tmpvar_9;
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
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (lengthSq_18, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_18 = tmpvar_22;
  ndotl_17 = (tmpvar_19 * tmpvar_8.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_8.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_8.z));
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
  tmpvar_2 = col_16;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = tmpvar_3;
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_1 = tmpvar_9;
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
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (lengthSq_18, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_18 = tmpvar_22;
  ndotl_17 = (tmpvar_19 * tmpvar_8.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_8.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_8.z));
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
  tmpvar_2 = col_16;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = tmpvar_3;
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_1 = tmpvar_9;
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
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (lengthSq_18, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_18 = tmpvar_22;
  ndotl_17 = (tmpvar_19 * tmpvar_8.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_8.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_8.z));
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
  tmpvar_2 = col_16;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = tmpvar_3;
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
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
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_26 = (tmpvar_27 * tmpvar_27);
  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_26 = tmpvar_30;
  ndotl_25 = (tmpvar_27 * tmpvar_9.x);
  ndotl_25 = (ndotl_25 + (tmpvar_28 * tmpvar_9.y));
  ndotl_25 = (ndotl_25 + (tmpvar_29 * tmpvar_9.z));
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
  tmpvar_3 = (tmpvar_3 + col_24);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD7 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
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
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_26 = (tmpvar_27 * tmpvar_27);
  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_26 = tmpvar_30;
  ndotl_25 = (tmpvar_27 * tmpvar_9.x);
  ndotl_25 = (ndotl_25 + (tmpvar_28 * tmpvar_9.y));
  ndotl_25 = (ndotl_25 + (tmpvar_29 * tmpvar_9.z));
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
  tmpvar_3 = (tmpvar_3 + col_24);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD7 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
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
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_26 = (tmpvar_27 * tmpvar_27);
  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_26 = tmpvar_30;
  ndotl_25 = (tmpvar_27 * tmpvar_9.x);
  ndotl_25 = (ndotl_25 + (tmpvar_28 * tmpvar_9.y));
  ndotl_25 = (ndotl_25 + (tmpvar_29 * tmpvar_9.z));
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
  tmpvar_3 = (tmpvar_3 + col_24);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD7 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
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
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_7.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_7.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_7.z));
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
  tmpvar_2 = col_15;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
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
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_7.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_7.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_7.z));
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
  tmpvar_2 = col_15;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
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
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_7.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_7.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_7.z));
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
  tmpvar_2 = col_15;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_8.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_8.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_8.z));
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
  tmpvar_3 = (tmpvar_3 + col_23);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_8.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_8.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_8.z));
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
  tmpvar_3 = (tmpvar_3 + col_23);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_8.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_8.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_8.z));
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
  tmpvar_3 = (tmpvar_3 + col_23);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
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
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_7.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_7.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_7.z));
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
  tmpvar_2 = col_15;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
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
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_7.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_7.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_7.z));
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
  tmpvar_2 = col_15;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
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
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_7.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_7.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_7.z));
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
  tmpvar_2 = col_15;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_8.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_8.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_8.z));
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
  tmpvar_3 = (tmpvar_3 + col_23);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_8.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_8.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_8.z));
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
  tmpvar_3 = (tmpvar_3 + col_23);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
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
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_8.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_8.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_8.z));
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
  tmpvar_3 = (tmpvar_3 + col_23);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
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
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD6 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_19));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
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
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD6 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_19));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
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
  highp vec3 tmpvar_7;
  highp vec3 I_8;
  I_8 = (tmpvar_4 - _WorldSpaceCameraPos);
  tmpvar_7 = (I_8 - (2.0 * (
    dot (tmpvar_6, I_8)
   * tmpvar_6)));
  tmpvar_1 = tmpvar_7;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD6 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_19));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_19));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_19));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_19));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  highp vec3 worldViewDir_4;
  lowp vec3 lightDir_5;
  highp vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  worldViewDir_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_6 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float shadowMaskAttenuation_9;
  lowp float tmpvar_10;
  tmpvar_10 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_9 = tmpvar_10;
  atten_2 = shadowMaskAttenuation_9;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_8.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_11;
  mediump vec3 lightDir_12;
  lightDir_12 = lightDir_5;
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_4;
  mediump float atten_14;
  atten_14 = atten_2;
  lowp vec3 color_15;
  lowp vec4 c_16;
  lowp vec3 h_17;
  lowp float NDotL_18;
  mediump float tmpvar_19;
  tmpvar_19 = dot (tmpvar_3, lightDir_12);
  NDotL_18 = tmpvar_19;
  lowp float tmpvar_20;
  tmpvar_20 = max (0.05, NDotL_18);
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize((lightDir_12 + viewDir_13));
  h_17 = tmpvar_21;
  mediump vec3 tmpvar_22;
  tmpvar_22 = ((tmpvar_8.xyz * _LightColor0.xyz) * (tmpvar_20 * atten_14));
  color_15 = tmpvar_22;
  c_16.xyz = (color_15 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_17)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_11 = c_16;
  c_1 = (c_1 + tmpvar_11);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_6).xyz * _ReflPower) * float(
    (((tmpvar_8.x + tmpvar_8.z) + tmpvar_8.y) > 0.1)
  )));
  highp float tmpvar_23;
  tmpvar_23 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_23));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  highp vec3 worldViewDir_4;
  lowp vec3 lightDir_5;
  highp vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  worldViewDir_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_6 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float shadowMaskAttenuation_9;
  lowp float tmpvar_10;
  tmpvar_10 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_9 = tmpvar_10;
  atten_2 = shadowMaskAttenuation_9;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_8.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_11;
  mediump vec3 lightDir_12;
  lightDir_12 = lightDir_5;
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_4;
  mediump float atten_14;
  atten_14 = atten_2;
  lowp vec3 color_15;
  lowp vec4 c_16;
  lowp vec3 h_17;
  lowp float NDotL_18;
  mediump float tmpvar_19;
  tmpvar_19 = dot (tmpvar_3, lightDir_12);
  NDotL_18 = tmpvar_19;
  lowp float tmpvar_20;
  tmpvar_20 = max (0.05, NDotL_18);
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize((lightDir_12 + viewDir_13));
  h_17 = tmpvar_21;
  mediump vec3 tmpvar_22;
  tmpvar_22 = ((tmpvar_8.xyz * _LightColor0.xyz) * (tmpvar_20 * atten_14));
  color_15 = tmpvar_22;
  c_16.xyz = (color_15 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_17)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_11 = c_16;
  c_1 = (c_1 + tmpvar_11);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_6).xyz * _ReflPower) * float(
    (((tmpvar_8.x + tmpvar_8.z) + tmpvar_8.y) > 0.1)
  )));
  highp float tmpvar_23;
  tmpvar_23 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_23));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  highp vec3 worldViewDir_4;
  lowp vec3 lightDir_5;
  highp vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_7;
  worldViewDir_4 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_6 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float shadowMaskAttenuation_9;
  lowp float tmpvar_10;
  tmpvar_10 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_9 = tmpvar_10;
  atten_2 = shadowMaskAttenuation_9;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_8.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_11;
  mediump vec3 lightDir_12;
  lightDir_12 = lightDir_5;
  mediump vec3 viewDir_13;
  viewDir_13 = worldViewDir_4;
  mediump float atten_14;
  atten_14 = atten_2;
  lowp vec3 color_15;
  lowp vec4 c_16;
  lowp vec3 h_17;
  lowp float NDotL_18;
  mediump float tmpvar_19;
  tmpvar_19 = dot (tmpvar_3, lightDir_12);
  NDotL_18 = tmpvar_19;
  lowp float tmpvar_20;
  tmpvar_20 = max (0.05, NDotL_18);
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize((lightDir_12 + viewDir_13));
  h_17 = tmpvar_21;
  mediump vec3 tmpvar_22;
  tmpvar_22 = ((tmpvar_8.xyz * _LightColor0.xyz) * (tmpvar_20 * atten_14));
  color_15 = tmpvar_22;
  c_16.xyz = (color_15 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_17)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_11 = c_16;
  c_1 = (c_1 + tmpvar_11);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_6).xyz * _ReflPower) * float(
    (((tmpvar_8.x + tmpvar_8.z) + tmpvar_8.y) > 0.1)
  )));
  highp float tmpvar_23;
  tmpvar_23 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_23));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  highp vec2 tmpvar_10;
  tmpvar_10 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_10 + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_10 + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  highp vec2 tmpvar_10;
  tmpvar_10 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_10 + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_10 + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  highp vec2 tmpvar_10;
  tmpvar_10 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_10 + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_10 + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  highp vec2 tmpvar_10;
  tmpvar_10 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_10 + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_10 + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  highp vec2 tmpvar_10;
  tmpvar_10 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_10 + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_10 + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  highp vec2 tmpvar_10;
  tmpvar_10 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_10 + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_10 + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  highp vec2 tmpvar_10;
  tmpvar_10 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_10 + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_10 + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  highp vec2 tmpvar_10;
  tmpvar_10 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_10 + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_10 + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  highp vec2 tmpvar_10;
  tmpvar_10 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_10 + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_10 + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  highp vec2 tmpvar_10;
  tmpvar_10 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_10 + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_10 + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  highp vec2 tmpvar_10;
  tmpvar_10 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_10 + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_10 + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  highp vec2 tmpvar_10;
  tmpvar_10 = (_glesMultiTexCoord1.xy * unity_LightmapST.xy);
  tmpvar_2.xy = (tmpvar_10 + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (tmpvar_10 + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_7;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * lm_1);
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_8;
  tmpvar_8 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_8));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_1 = tmpvar_9;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD5 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_34;
  tmpvar_34 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_34));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_1 = tmpvar_9;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD5 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_34;
  tmpvar_34 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_34));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_1 = tmpvar_9;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD5 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_34;
  tmpvar_34 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_34));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec3 tmpvar_11;
  highp vec3 I_12;
  I_12 = (tmpvar_8 - _WorldSpaceCameraPos);
  tmpvar_11 = (I_12 - (2.0 * (
    dot (tmpvar_10, I_12)
   * tmpvar_10)));
  tmpvar_2 = tmpvar_11;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10;
  mediump vec4 normal_14;
  normal_14 = tmpvar_13;
  mediump vec3 res_15;
  mediump vec3 x_16;
  x_16.x = dot (unity_SHAr, normal_14);
  x_16.y = dot (unity_SHAg, normal_14);
  x_16.z = dot (unity_SHAb, normal_14);
  mediump vec3 x1_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_14.xyzz * normal_14.yzzx);
  x1_17.x = dot (unity_SHBr, tmpvar_18);
  x1_17.y = dot (unity_SHBg, tmpvar_18);
  x1_17.z = dot (unity_SHBb, tmpvar_18);
  res_15 = (x_16 + (x1_17 + (unity_SHC.xyz * 
    ((normal_14.x * normal_14.x) - (normal_14.y * normal_14.y))
  )));
  mediump vec3 tmpvar_19;
  tmpvar_19 = max (((1.055 * 
    pow (max (res_15, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_15 = tmpvar_19;
  shlight_1 = tmpvar_19;
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_34;
  tmpvar_34 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_34));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec3 tmpvar_11;
  highp vec3 I_12;
  I_12 = (tmpvar_8 - _WorldSpaceCameraPos);
  tmpvar_11 = (I_12 - (2.0 * (
    dot (tmpvar_10, I_12)
   * tmpvar_10)));
  tmpvar_2 = tmpvar_11;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10;
  mediump vec4 normal_14;
  normal_14 = tmpvar_13;
  mediump vec3 res_15;
  mediump vec3 x_16;
  x_16.x = dot (unity_SHAr, normal_14);
  x_16.y = dot (unity_SHAg, normal_14);
  x_16.z = dot (unity_SHAb, normal_14);
  mediump vec3 x1_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_14.xyzz * normal_14.yzzx);
  x1_17.x = dot (unity_SHBr, tmpvar_18);
  x1_17.y = dot (unity_SHBg, tmpvar_18);
  x1_17.z = dot (unity_SHBb, tmpvar_18);
  res_15 = (x_16 + (x1_17 + (unity_SHC.xyz * 
    ((normal_14.x * normal_14.x) - (normal_14.y * normal_14.y))
  )));
  mediump vec3 tmpvar_19;
  tmpvar_19 = max (((1.055 * 
    pow (max (res_15, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_15 = tmpvar_19;
  shlight_1 = tmpvar_19;
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_34;
  tmpvar_34 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_34));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec3 tmpvar_11;
  highp vec3 I_12;
  I_12 = (tmpvar_8 - _WorldSpaceCameraPos);
  tmpvar_11 = (I_12 - (2.0 * (
    dot (tmpvar_10, I_12)
   * tmpvar_10)));
  tmpvar_2 = tmpvar_11;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10;
  mediump vec4 normal_14;
  normal_14 = tmpvar_13;
  mediump vec3 res_15;
  mediump vec3 x_16;
  x_16.x = dot (unity_SHAr, normal_14);
  x_16.y = dot (unity_SHAg, normal_14);
  x_16.z = dot (unity_SHAb, normal_14);
  mediump vec3 x1_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_14.xyzz * normal_14.yzzx);
  x1_17.x = dot (unity_SHBr, tmpvar_18);
  x1_17.y = dot (unity_SHBg, tmpvar_18);
  x1_17.z = dot (unity_SHBb, tmpvar_18);
  res_15 = (x_16 + (x1_17 + (unity_SHC.xyz * 
    ((normal_14.x * normal_14.x) - (normal_14.y * normal_14.y))
  )));
  mediump vec3 tmpvar_19;
  tmpvar_19 = max (((1.055 * 
    pow (max (res_15, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_15 = tmpvar_19;
  shlight_1 = tmpvar_19;
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_34;
  tmpvar_34 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_34));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
  gl_FragData[0] = c_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5.xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  tmpvar_2.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5.xyz;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_5);
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 unity_FogColor;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 lmtex_2;
  lowp vec4 c_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_6;
  highp float lightShadowDataX_7;
  mediump float tmpvar_8;
  tmpvar_8 = _LightShadowData.x;
  lightShadowDataX_7 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_7);
  tmpvar_6 = tmpvar_9;
  mediump vec4 tmpvar_10;
  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
  lmtex_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (unity_Lightmap_HDR.x * lmtex_2.xyz);
  lm_1 = tmpvar_11;
  c_3.w = 0.0;
  c_3.xyz = (tmpvar_5.xyz * min (lm_1, vec3((tmpvar_6 * 2.0))));
  c_3.xyz = (c_3.xyz + ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float(
    (((tmpvar_5.x + tmpvar_5.z) + tmpvar_5.y) > 0.1)
  )));
  highp float tmpvar_12;
  tmpvar_12 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_3.xyz = mix (unity_FogColor.xyz, c_3.xyz, vec3(tmpvar_12));
  c_3.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
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
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_7.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_7.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_7.z));
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
  tmpvar_2 = col_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_19));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
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
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_7.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_7.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_7.z));
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
  tmpvar_2 = col_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_19));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = (tmpvar_5 - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
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
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_17 = (tmpvar_18 * tmpvar_18);
  lengthSq_17 = (lengthSq_17 + (tmpvar_19 * tmpvar_19));
  lengthSq_17 = (lengthSq_17 + (tmpvar_20 * tmpvar_20));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (lengthSq_17, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_17 = tmpvar_21;
  ndotl_16 = (tmpvar_18 * tmpvar_7.x);
  ndotl_16 = (ndotl_16 + (tmpvar_19 * tmpvar_7.y));
  ndotl_16 = (ndotl_16 + (tmpvar_20 * tmpvar_7.z));
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
  tmpvar_2 = col_15;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD6 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_19));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_8.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_8.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_8.z));
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
  tmpvar_3 = (tmpvar_3 + col_23);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_19));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_8.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_8.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_8.z));
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
  tmpvar_3 = (tmpvar_3 + col_23);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_19));
  c_1.w = 1.0;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_2 = tmpvar_9;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_8;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_25 = (tmpvar_26 * tmpvar_26);
  lengthSq_25 = (lengthSq_25 + (tmpvar_27 * tmpvar_27));
  lengthSq_25 = (lengthSq_25 + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (lengthSq_25, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_25 = tmpvar_29;
  ndotl_24 = (tmpvar_26 * tmpvar_8.x);
  ndotl_24 = (ndotl_24 + (tmpvar_27 * tmpvar_8.y));
  ndotl_24 = (ndotl_24 + (tmpvar_28 * tmpvar_8.z));
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
  tmpvar_3 = (tmpvar_3 + col_23);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 worldViewDir_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  worldViewDir_3 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_7.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_8;
  mediump vec3 lightDir_9;
  lightDir_9 = lightDir_4;
  mediump vec3 viewDir_10;
  viewDir_10 = worldViewDir_3;
  lowp vec3 color_11;
  lowp vec4 c_12;
  lowp vec3 h_13;
  lowp float NDotL_14;
  mediump float tmpvar_15;
  tmpvar_15 = dot (tmpvar_2, lightDir_9);
  NDotL_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = max (0.05, NDotL_14);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize((lightDir_9 + viewDir_10));
  h_13 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = ((tmpvar_7.xyz * _LightColor0.xyz) * tmpvar_16);
  color_11 = tmpvar_18;
  c_12.xyz = (color_11 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_2), h_13)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_8 = c_12;
  c_1 = (c_1 + tmpvar_8);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y) > 0.1)
  )));
  highp float tmpvar_19;
  tmpvar_19 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_19));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
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
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_1 = tmpvar_10;
  highp vec3 lightColor0_12;
  lightColor0_12 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_13;
  lightColor1_13 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_14;
  lightColor2_14 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_15;
  lightColor3_15 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_16;
  lightAttenSq_16 = unity_4LightAtten0;
  highp vec3 col_17;
  highp vec4 ndotl_18;
  highp vec4 lengthSq_19;
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_19 = (tmpvar_20 * tmpvar_20);
  lengthSq_19 = (lengthSq_19 + (tmpvar_21 * tmpvar_21));
  lengthSq_19 = (lengthSq_19 + (tmpvar_22 * tmpvar_22));
  highp vec4 tmpvar_23;
  tmpvar_23 = max (lengthSq_19, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_19 = tmpvar_23;
  ndotl_18 = (tmpvar_20 * tmpvar_9.x);
  ndotl_18 = (ndotl_18 + (tmpvar_21 * tmpvar_9.y));
  ndotl_18 = (ndotl_18 + (tmpvar_22 * tmpvar_9.z));
  highp vec4 tmpvar_24;
  tmpvar_24 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_18 * inversesqrt(tmpvar_23)));
  ndotl_18 = tmpvar_24;
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_24 * (1.0/((1.0 + 
    (tmpvar_23 * lightAttenSq_16)
  ))));
  col_17 = (lightColor0_12 * tmpvar_25.x);
  col_17 = (col_17 + (lightColor1_13 * tmpvar_25.y));
  col_17 = (col_17 + (lightColor2_14 * tmpvar_25.z));
  col_17 = (col_17 + (lightColor3_15 * tmpvar_25.w));
  tmpvar_2 = col_17;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = tmpvar_3;
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_34;
  tmpvar_34 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_34));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
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
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_1 = tmpvar_10;
  highp vec3 lightColor0_12;
  lightColor0_12 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_13;
  lightColor1_13 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_14;
  lightColor2_14 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_15;
  lightColor3_15 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_16;
  lightAttenSq_16 = unity_4LightAtten0;
  highp vec3 col_17;
  highp vec4 ndotl_18;
  highp vec4 lengthSq_19;
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_19 = (tmpvar_20 * tmpvar_20);
  lengthSq_19 = (lengthSq_19 + (tmpvar_21 * tmpvar_21));
  lengthSq_19 = (lengthSq_19 + (tmpvar_22 * tmpvar_22));
  highp vec4 tmpvar_23;
  tmpvar_23 = max (lengthSq_19, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_19 = tmpvar_23;
  ndotl_18 = (tmpvar_20 * tmpvar_9.x);
  ndotl_18 = (ndotl_18 + (tmpvar_21 * tmpvar_9.y));
  ndotl_18 = (ndotl_18 + (tmpvar_22 * tmpvar_9.z));
  highp vec4 tmpvar_24;
  tmpvar_24 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_18 * inversesqrt(tmpvar_23)));
  ndotl_18 = tmpvar_24;
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_24 * (1.0/((1.0 + 
    (tmpvar_23 * lightAttenSq_16)
  ))));
  col_17 = (lightColor0_12 * tmpvar_25.x);
  col_17 = (col_17 + (lightColor1_13 * tmpvar_25.y));
  col_17 = (col_17 + (lightColor2_14 * tmpvar_25.z));
  col_17 = (col_17 + (lightColor3_15 * tmpvar_25.w));
  tmpvar_2 = col_17;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = tmpvar_3;
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_34;
  tmpvar_34 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_34));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
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
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_1 = tmpvar_10;
  highp vec3 lightColor0_12;
  lightColor0_12 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_13;
  lightColor1_13 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_14;
  lightColor2_14 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_15;
  lightColor3_15 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_16;
  lightAttenSq_16 = unity_4LightAtten0;
  highp vec3 col_17;
  highp vec4 ndotl_18;
  highp vec4 lengthSq_19;
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_19 = (tmpvar_20 * tmpvar_20);
  lengthSq_19 = (lengthSq_19 + (tmpvar_21 * tmpvar_21));
  lengthSq_19 = (lengthSq_19 + (tmpvar_22 * tmpvar_22));
  highp vec4 tmpvar_23;
  tmpvar_23 = max (lengthSq_19, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_19 = tmpvar_23;
  ndotl_18 = (tmpvar_20 * tmpvar_9.x);
  ndotl_18 = (ndotl_18 + (tmpvar_21 * tmpvar_9.y));
  ndotl_18 = (ndotl_18 + (tmpvar_22 * tmpvar_9.z));
  highp vec4 tmpvar_24;
  tmpvar_24 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_18 * inversesqrt(tmpvar_23)));
  ndotl_18 = tmpvar_24;
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_24 * (1.0/((1.0 + 
    (tmpvar_23 * lightAttenSq_16)
  ))));
  col_17 = (lightColor0_12 * tmpvar_25.x);
  col_17 = (col_17 + (lightColor1_13 * tmpvar_25.y));
  col_17 = (col_17 + (lightColor2_14 * tmpvar_25.z));
  col_17 = (col_17 + (lightColor3_15 * tmpvar_25.w));
  tmpvar_2 = col_17;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = tmpvar_3;
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_34;
  tmpvar_34 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_34));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec3 tmpvar_11;
  highp vec3 I_12;
  I_12 = (tmpvar_8 - _WorldSpaceCameraPos);
  tmpvar_11 = (I_12 - (2.0 * (
    dot (tmpvar_10, I_12)
   * tmpvar_10)));
  tmpvar_2 = tmpvar_11;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10;
  mediump vec4 normal_14;
  normal_14 = tmpvar_13;
  mediump vec3 res_15;
  mediump vec3 x_16;
  x_16.x = dot (unity_SHAr, normal_14);
  x_16.y = dot (unity_SHAg, normal_14);
  x_16.z = dot (unity_SHAb, normal_14);
  mediump vec3 x1_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_14.xyzz * normal_14.yzzx);
  x1_17.x = dot (unity_SHBr, tmpvar_18);
  x1_17.y = dot (unity_SHBg, tmpvar_18);
  x1_17.z = dot (unity_SHBb, tmpvar_18);
  res_15 = (x_16 + (x1_17 + (unity_SHC.xyz * 
    ((normal_14.x * normal_14.x) - (normal_14.y * normal_14.y))
  )));
  mediump vec3 tmpvar_19;
  tmpvar_19 = max (((1.055 * 
    pow (max (res_15, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_15 = tmpvar_19;
  shlight_1 = tmpvar_19;
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 col_25;
  highp vec4 ndotl_26;
  highp vec4 lengthSq_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_27 = (tmpvar_28 * tmpvar_28);
  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_27 = tmpvar_31;
  ndotl_26 = (tmpvar_28 * tmpvar_10.x);
  ndotl_26 = (ndotl_26 + (tmpvar_29 * tmpvar_10.y));
  ndotl_26 = (ndotl_26 + (tmpvar_30 * tmpvar_10.z));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
  ndotl_26 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
    (tmpvar_31 * lightAttenSq_24)
  ))));
  col_25 = (lightColor0_20 * tmpvar_33.x);
  col_25 = (col_25 + (lightColor1_21 * tmpvar_33.y));
  col_25 = (col_25 + (lightColor2_22 * tmpvar_33.z));
  col_25 = (col_25 + (lightColor3_23 * tmpvar_33.w));
  tmpvar_3 = (tmpvar_3 + col_25);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_34;
  tmpvar_34 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_34));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec3 tmpvar_11;
  highp vec3 I_12;
  I_12 = (tmpvar_8 - _WorldSpaceCameraPos);
  tmpvar_11 = (I_12 - (2.0 * (
    dot (tmpvar_10, I_12)
   * tmpvar_10)));
  tmpvar_2 = tmpvar_11;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10;
  mediump vec4 normal_14;
  normal_14 = tmpvar_13;
  mediump vec3 res_15;
  mediump vec3 x_16;
  x_16.x = dot (unity_SHAr, normal_14);
  x_16.y = dot (unity_SHAg, normal_14);
  x_16.z = dot (unity_SHAb, normal_14);
  mediump vec3 x1_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_14.xyzz * normal_14.yzzx);
  x1_17.x = dot (unity_SHBr, tmpvar_18);
  x1_17.y = dot (unity_SHBg, tmpvar_18);
  x1_17.z = dot (unity_SHBb, tmpvar_18);
  res_15 = (x_16 + (x1_17 + (unity_SHC.xyz * 
    ((normal_14.x * normal_14.x) - (normal_14.y * normal_14.y))
  )));
  mediump vec3 tmpvar_19;
  tmpvar_19 = max (((1.055 * 
    pow (max (res_15, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_15 = tmpvar_19;
  shlight_1 = tmpvar_19;
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 col_25;
  highp vec4 ndotl_26;
  highp vec4 lengthSq_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_27 = (tmpvar_28 * tmpvar_28);
  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_27 = tmpvar_31;
  ndotl_26 = (tmpvar_28 * tmpvar_10.x);
  ndotl_26 = (ndotl_26 + (tmpvar_29 * tmpvar_10.y));
  ndotl_26 = (ndotl_26 + (tmpvar_30 * tmpvar_10.z));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
  ndotl_26 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
    (tmpvar_31 * lightAttenSq_24)
  ))));
  col_25 = (lightColor0_20 * tmpvar_33.x);
  col_25 = (col_25 + (lightColor1_21 * tmpvar_33.y));
  col_25 = (col_25 + (lightColor2_22 * tmpvar_33.z));
  col_25 = (col_25 + (lightColor3_23 * tmpvar_33.w));
  tmpvar_3 = (tmpvar_3 + col_25);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_34;
  tmpvar_34 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_34));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
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
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp vec3 tmpvar_11;
  highp vec3 I_12;
  I_12 = (tmpvar_8 - _WorldSpaceCameraPos);
  tmpvar_11 = (I_12 - (2.0 * (
    dot (tmpvar_10, I_12)
   * tmpvar_10)));
  tmpvar_2 = tmpvar_11;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10;
  mediump vec4 normal_14;
  normal_14 = tmpvar_13;
  mediump vec3 res_15;
  mediump vec3 x_16;
  x_16.x = dot (unity_SHAr, normal_14);
  x_16.y = dot (unity_SHAg, normal_14);
  x_16.z = dot (unity_SHAb, normal_14);
  mediump vec3 x1_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_14.xyzz * normal_14.yzzx);
  x1_17.x = dot (unity_SHBr, tmpvar_18);
  x1_17.y = dot (unity_SHBg, tmpvar_18);
  x1_17.z = dot (unity_SHBb, tmpvar_18);
  res_15 = (x_16 + (x1_17 + (unity_SHC.xyz * 
    ((normal_14.x * normal_14.x) - (normal_14.y * normal_14.y))
  )));
  mediump vec3 tmpvar_19;
  tmpvar_19 = max (((1.055 * 
    pow (max (res_15, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_15 = tmpvar_19;
  shlight_1 = tmpvar_19;
  tmpvar_3 = shlight_1;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 col_25;
  highp vec4 ndotl_26;
  highp vec4 lengthSq_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_27 = (tmpvar_28 * tmpvar_28);
  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_27 = tmpvar_31;
  ndotl_26 = (tmpvar_28 * tmpvar_10.x);
  ndotl_26 = (ndotl_26 + (tmpvar_29 * tmpvar_10.y));
  ndotl_26 = (ndotl_26 + (tmpvar_30 * tmpvar_10.z));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
  ndotl_26 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
    (tmpvar_31 * lightAttenSq_24)
  ))));
  col_25 = (lightColor0_20 * tmpvar_33.x);
  col_25 = (col_25 + (lightColor1_21 * tmpvar_33.y));
  col_25 = (col_25 + (lightColor2_22 * tmpvar_33.z));
  col_25 = (col_25 + (lightColor3_23 * tmpvar_33.w));
  tmpvar_3 = (tmpvar_3 + col_25);
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  highp vec4 v_11;
  v_11.x = unity_MatrixV[0].z;
  v_11.y = unity_MatrixV[1].z;
  v_11.z = unity_MatrixV[2].z;
  v_11.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((
    mix (dot (tmpvar_8, v_11.xyz), sqrt(dot (tmpvar_12, tmpvar_12)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_16;
  highp vec4 shadowCoord_17;
  shadowCoord_17 = (unity_WorldToShadow[0] * tmpvar_15);
  highp float lightShadowDataX_18;
  mediump float tmpvar_19;
  tmpvar_19 = _LightShadowData.x;
  lightShadowDataX_18 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (float((texture2D (_ShadowMapTexture, shadowCoord_17.xy).x > shadowCoord_17.z)), lightShadowDataX_18);
  tmpvar_16 = tmpvar_20;
  realtimeShadowAttenuation_10 = tmpvar_16;
  mediump float tmpvar_21;
  tmpvar_21 = clamp ((realtimeShadowAttenuation_10 + tmpvar_13), 0.0, 1.0);
  atten_2 = tmpvar_21;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_22;
  mediump vec3 lightDir_23;
  lightDir_23 = lightDir_4;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_7;
  mediump float atten_25;
  atten_25 = atten_2;
  lowp vec3 color_26;
  lowp vec4 c_27;
  lowp vec3 h_28;
  lowp float NDotL_29;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_3, lightDir_23);
  NDotL_29 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = max (0.05, NDotL_29);
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize((lightDir_23 + viewDir_24));
  h_28 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_31 * atten_25));
  color_26 = tmpvar_33;
  c_27.xyz = (color_26 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_28)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_22 = c_27;
  c_1 = (c_1 + tmpvar_22);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_34;
  tmpvar_34 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_34));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_1 = tmpvar_9;
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
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (lengthSq_18, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_18 = tmpvar_22;
  ndotl_17 = (tmpvar_19 * tmpvar_8.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_8.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_8.z));
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
  tmpvar_2 = col_16;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_1 = tmpvar_9;
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
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (lengthSq_18, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_18 = tmpvar_22;
  ndotl_17 = (tmpvar_19 * tmpvar_8.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_8.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_8.z));
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
  tmpvar_2 = col_16;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_1 = tmpvar_9;
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
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (lengthSq_18, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_18 = tmpvar_22;
  ndotl_17 = (tmpvar_19 * tmpvar_8.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_8.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_8.z));
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
  tmpvar_2 = col_16;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_26 = (tmpvar_27 * tmpvar_27);
  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_26 = tmpvar_30;
  ndotl_25 = (tmpvar_27 * tmpvar_9.x);
  ndotl_25 = (ndotl_25 + (tmpvar_28 * tmpvar_9.y));
  ndotl_25 = (ndotl_25 + (tmpvar_29 * tmpvar_9.z));
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
  tmpvar_3 = (tmpvar_3 + col_24);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_26 = (tmpvar_27 * tmpvar_27);
  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_26 = tmpvar_30;
  ndotl_25 = (tmpvar_27 * tmpvar_9.x);
  ndotl_25 = (ndotl_25 + (tmpvar_28 * tmpvar_9.y));
  ndotl_25 = (ndotl_25 + (tmpvar_29 * tmpvar_9.z));
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
  tmpvar_3 = (tmpvar_3 + col_24);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_26 = (tmpvar_27 * tmpvar_27);
  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_26 = tmpvar_30;
  ndotl_25 = (tmpvar_27 * tmpvar_9.x);
  ndotl_25 = (ndotl_25 + (tmpvar_28 * tmpvar_9.y));
  ndotl_25 = (ndotl_25 + (tmpvar_29 * tmpvar_9.z));
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
  tmpvar_3 = (tmpvar_3 + col_24);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = mix (realtimeShadowAttenuation_10, shadowMaskAttenuation_11, tmpvar_14);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_1 = tmpvar_9;
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
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (lengthSq_18, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_18 = tmpvar_22;
  ndotl_17 = (tmpvar_19 * tmpvar_8.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_8.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_8.z));
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
  tmpvar_2 = col_16;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_1 = tmpvar_9;
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
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (lengthSq_18, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_18 = tmpvar_22;
  ndotl_17 = (tmpvar_19 * tmpvar_8.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_8.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_8.z));
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
  tmpvar_2 = col_16;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp vec3 tmpvar_9;
  highp vec3 I_10;
  I_10 = (tmpvar_6 - _WorldSpaceCameraPos);
  tmpvar_9 = (I_10 - (2.0 * (
    dot (tmpvar_8, I_10)
   * tmpvar_8)));
  tmpvar_1 = tmpvar_9;
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
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (lengthSq_18, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_18 = tmpvar_22;
  ndotl_17 = (tmpvar_19 * tmpvar_8.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_8.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_8.z));
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
  tmpvar_2 = col_16;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_2;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_26 = (tmpvar_27 * tmpvar_27);
  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_26 = tmpvar_30;
  ndotl_25 = (tmpvar_27 * tmpvar_9.x);
  ndotl_25 = (ndotl_25 + (tmpvar_28 * tmpvar_9.y));
  ndotl_25 = (ndotl_25 + (tmpvar_29 * tmpvar_9.z));
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
  tmpvar_3 = (tmpvar_3 + col_24);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_26 = (tmpvar_27 * tmpvar_27);
  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_26 = tmpvar_30;
  ndotl_25 = (tmpvar_27 * tmpvar_9.x);
  ndotl_25 = (ndotl_25 + (tmpvar_28 * tmpvar_9.y));
  ndotl_25 = (ndotl_25 + (tmpvar_29 * tmpvar_9.z));
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
  tmpvar_3 = (tmpvar_3 + col_24);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
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
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
varying highp vec4 xlv_TEXCOORD7;
void main ()
{
  highp vec3 shlight_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp vec3 tmpvar_10;
  highp vec3 I_11;
  I_11 = (tmpvar_7 - _WorldSpaceCameraPos);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  tmpvar_2 = tmpvar_10;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
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
  tmpvar_3 = shlight_1;
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
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_26 = (tmpvar_27 * tmpvar_27);
  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_30;
  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_26 = tmpvar_30;
  ndotl_25 = (tmpvar_27 * tmpvar_9.x);
  ndotl_25 = (ndotl_25 + (tmpvar_28 * tmpvar_9.y));
  ndotl_25 = (ndotl_25 + (tmpvar_29 * tmpvar_9.z));
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
  tmpvar_3 = (tmpvar_3 + col_24);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_9;
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD7 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 unity_OcclusionMaskSelector;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform sampler2D unity_ShadowMask;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform lowp float _GlossSize;
uniform lowp float _GlossPower;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp vec4 c_1;
  lowp float atten_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (_WorldSpaceCameraPos - xlv_TEXCOORD3);
  tmpvar_7 = normalize(tmpvar_8);
  tmpvar_5 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD2;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float realtimeShadowAttenuation_10;
  mediump float shadowMaskAttenuation_11;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (xlv_TEXCOORD3 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot (tmpvar_8, v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = clamp (dot (texture2D (unity_ShadowMask, xlv_TEXCOORD5), unity_OcclusionMaskSelector), 0.0, 1.0);
  shadowMaskAttenuation_11 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = xlv_TEXCOORD3;
  lowp float tmpvar_18;
  highp vec4 shadowCoord_19;
  shadowCoord_19 = (unity_WorldToShadow[0] * tmpvar_17);
  highp float lightShadowDataX_20;
  mediump float tmpvar_21;
  tmpvar_21 = _LightShadowData.x;
  lightShadowDataX_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = max (float((texture2D (_ShadowMapTexture, shadowCoord_19.xy).x > shadowCoord_19.z)), lightShadowDataX_20);
  tmpvar_18 = tmpvar_22;
  realtimeShadowAttenuation_10 = tmpvar_18;
  mediump float tmpvar_23;
  tmpvar_23 = min (clamp ((realtimeShadowAttenuation_10 + tmpvar_14), 0.0, 1.0), shadowMaskAttenuation_11);
  atten_2 = tmpvar_23;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_9.xyz * xlv_TEXCOORD4);
  highp vec4 tmpvar_24;
  mediump vec3 lightDir_25;
  lightDir_25 = lightDir_4;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_7;
  mediump float atten_27;
  atten_27 = atten_2;
  lowp vec3 color_28;
  lowp vec4 c_29;
  lowp vec3 h_30;
  lowp float NDotL_31;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_3, lightDir_25);
  NDotL_31 = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = max (0.05, NDotL_31);
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize((lightDir_25 + viewDir_26));
  h_30 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_9.xyz * _LightColor0.xyz) * (tmpvar_33 * atten_27));
  color_28 = tmpvar_35;
  c_29.xyz = (color_28 + (max (0.0, 
    pow (max (0.0, dot (normalize(tmpvar_3), h_30)), (48.0 * _GlossSize))
  ) * _GlossPower));
  tmpvar_24 = c_29;
  c_1 = (c_1 + tmpvar_24);
  c_1.xyz = (c_1.xyz + ((textureCube (_Cube, tmpvar_5).xyz * _ReflPower) * float(
    (((tmpvar_9.x + tmpvar_9.z) + tmpvar_9.y) > 0.1)
  )));
  highp float tmpvar_36;
  tmpvar_36 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_36));
  c_1.w = 1.0;
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
Keywords { "DIRECTIONAL" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
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
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "META"
  LOD 150
  Tags { "LIGHTMODE" = "META" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 129521
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
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
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_5 = tmpvar_7.xyz;
  tmpvar_6 = ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float((
    ((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y)
   > 0.1)));
  tmpvar_2 = tmpvar_5;
  tmpvar_3 = tmpvar_6;
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
      emission_11 = tmpvar_3;
    } else {
      emission_11 = (tmpvar_3 * ((tmpvar_3 * 
        ((tmpvar_3 * 0.305306) + 0.6821711)
      ) + 0.01252288));
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
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
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
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_5 = tmpvar_7.xyz;
  tmpvar_6 = ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float((
    ((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y)
   > 0.1)));
  tmpvar_2 = tmpvar_5;
  tmpvar_3 = tmpvar_6;
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
      emission_11 = tmpvar_3;
    } else {
      emission_11 = (tmpvar_3 * ((tmpvar_3 * 
        ((tmpvar_3 * 0.305306) + 0.6821711)
      ) + 0.01252288));
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
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
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
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp vec3 tmpvar_8;
  highp vec3 I_9;
  I_9 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
  tmpvar_8 = (I_9 - (2.0 * (
    dot (tmpvar_7, I_9)
   * tmpvar_7)));
  tmpvar_1 = tmpvar_8;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp float _ReflPower;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_5 = tmpvar_7.xyz;
  tmpvar_6 = ((textureCube (_Cube, tmpvar_4).xyz * _ReflPower) * float((
    ((tmpvar_7.x + tmpvar_7.z) + tmpvar_7.y)
   > 0.1)));
  tmpvar_2 = tmpvar_5;
  tmpvar_3 = tmpvar_6;
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
      emission_11 = tmpvar_3;
    } else {
      emission_11 = (tmpvar_3 * ((tmpvar_3 * 
        ((tmpvar_3 * 0.305306) + 0.6821711)
      ) + 0.01252288));
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