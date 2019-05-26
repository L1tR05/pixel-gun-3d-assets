//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Glow 11/Unity/Mobile/VertexLit (Only Directional Lights)" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_GlowTex ("Glow", 2D) = "" { }
_GlowColor ("Glow Color", Color) = (1,1,1,1)
_GlowStrength ("Glow Strength", Float) = 1
}
SubShader {
 LOD 80
 Tags { "RenderEffect" = "Glow11" "RenderType" = "Glow11" }
 Pass {
  Name "FORWARD"
  LOD 80
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderEffect" = "Glow11" "RenderType" = "Glow11" "SHADOWSUPPORT" = "true" }
  GpuProgramID 17490
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
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
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  mediump vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_8;
  color_8 = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = (unity_Lightmap_HDR.x * color_8.xyz);
  lm_1 = tmpvar_9;
  c_2.xyz = (tmpvar_3 * lm_1);
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "SHADOWS_SHADOWMASK" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec3 tmpvar_3;
  lowp float tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_5 = tmpvar_6;
  tmpvar_3 = c_5.xyz;
  tmpvar_4 = c_5.w;
  lowp float tmpvar_7;
  highp float lightShadowDataX_8;
  mediump float tmpvar_9;
  tmpvar_9 = _LightShadowData.x;
  lightShadowDataX_8 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_8);
  tmpvar_7 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec3 tmpvar_13;
  tmpvar_13 = (unity_Lightmap_HDR.x * color_12.xyz);
  lm_1 = tmpvar_13;
  c_2.xyz = (tmpvar_3 * min (lm_1, vec3((tmpvar_7 * 2.0))));
  c_2.w = tmpvar_4;
  gl_FragData[0] = c_2;
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2 * xlv_TEXCOORD2);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _LightColor0;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_4[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_4[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _glesNormal);
  tmpvar_1 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec4 normal_7;
  normal_7 = tmpvar_6;
  mediump vec3 res_8;
  mediump vec3 x_9;
  x_9.x = dot (unity_SHAr, normal_7);
  x_9.y = dot (unity_SHAg, normal_7);
  x_9.z = dot (unity_SHAb, normal_7);
  mediump vec3 x1_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = (normal_7.xyzz * normal_7.yzzx);
  x1_10.x = dot (unity_SHBr, tmpvar_11);
  x1_10.y = dot (unity_SHBg, tmpvar_11);
  x1_10.z = dot (unity_SHBb, tmpvar_11);
  res_8 = (x_9 + (x1_10 + (unity_SHC.xyz * 
    ((normal_7.x * normal_7.x) - (normal_7.y * normal_7.y))
  )));
  mediump vec3 tmpvar_12;
  tmpvar_12 = max (((1.055 * 
    pow (max (res_8, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_8 = tmpvar_12;
  tmpvar_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  highp vec3 lightDir_14;
  lightDir_14 = _WorldSpaceLightPos0.xyz;
  lowp float diff_15;
  highp float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, lightDir_14));
  diff_15 = tmpvar_16;
  tmpvar_13 = (_LightColor0.xyz * (diff_15 * 2.0));
  tmpvar_2 = (tmpvar_2 + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_3 = tmpvar_4;
  tmpvar_2 = c_3.xyz;
  lowp float tmpvar_5;
  highp float lightShadowDataX_6;
  mediump float tmpvar_7;
  tmpvar_7 = _LightShadowData.x;
  lightShadowDataX_6 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_6);
  tmpvar_5 = tmpvar_8;
  c_1.w = 0.0;
  c_1.xyz = ((tmpvar_2 * xlv_TEXCOORD2) * tmpvar_5);
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
}
}
}
Fallback "Mobile/VertexLit"
CustomEditor "GlowMatInspector"
}