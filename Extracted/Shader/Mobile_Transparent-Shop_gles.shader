//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Mobile/Transparent-Shop" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 LOD 150
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  LOD 150
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  GpuProgramID 52442
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
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
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
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
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
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
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
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
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = max (vec3(0.0, 0.0, 0.0), tmpvar_10);
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
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
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = max (vec3(0.0, 0.0, 0.0), tmpvar_10);
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
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
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = max (vec3(0.0, 0.0, 0.0), tmpvar_10);
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
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
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = tmpvar_5;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ambient_21;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
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
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = tmpvar_5;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ambient_21;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
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
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = tmpvar_5;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ambient_21;
}


#endif
#ifdef FRAGMENT
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_3));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
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
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = max (vec3(0.0, 0.0, 0.0), tmpvar_11);
  xlv_TEXCOORD3 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = normalize((_glesNormal * tmpvar_4));
  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD2 = tmpvar_1;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ambient_22;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ambient_22;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD3;
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
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ambient_22;
  xlv_TEXCOORD3 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
varying highp float xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  c_1.w = 0.0;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  c_1.xyz = (unity_FogColor.xyz * (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_2)));
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
  LOD 150
  Tags { "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 74541
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
varying highp vec3 xlv_TEXCOORD0;
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
  xlv_TEXCOORD0 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 res_2;
  res_2 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    res_2.w = 1.0;
    highp vec3 tmpvar_3;
    tmpvar_3 = clamp (pow (vec3(0.0, 0.0, 0.0), vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_2.xyz = tmpvar_3;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_4;
    if (bool(unity_UseLinearSpace)) {
      emission_4 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_4 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_5;
    tmpvar_5.w = 1.0;
    tmpvar_5.xyz = emission_4;
    res_2 = tmpvar_5;
  };
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
varying highp vec3 xlv_TEXCOORD0;
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
  xlv_TEXCOORD0 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 res_2;
  res_2 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    res_2.w = 1.0;
    highp vec3 tmpvar_3;
    tmpvar_3 = clamp (pow (vec3(0.0, 0.0, 0.0), vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_2.xyz = tmpvar_3;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_4;
    if (bool(unity_UseLinearSpace)) {
      emission_4 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_4 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_5;
    tmpvar_5.w = 1.0;
    tmpvar_5.xyz = emission_4;
    res_2 = tmpvar_5;
  };
  tmpvar_1 = res_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
varying highp vec3 xlv_TEXCOORD0;
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
  xlv_TEXCOORD0 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 res_2;
  res_2 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    res_2.w = 1.0;
    highp vec3 tmpvar_3;
    tmpvar_3 = clamp (pow (vec3(0.0, 0.0, 0.0), vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_2.xyz = tmpvar_3;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_4;
    if (bool(unity_UseLinearSpace)) {
      emission_4 = vec3(0.0, 0.0, 0.0);
    } else {
      emission_4 = vec3(0.0, 0.0, 0.0);
    };
    mediump vec4 tmpvar_5;
    tmpvar_5.w = 1.0;
    tmpvar_5.xyz = emission_4;
    res_2 = tmpvar_5;
  };
  tmpvar_1 = res_2;
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