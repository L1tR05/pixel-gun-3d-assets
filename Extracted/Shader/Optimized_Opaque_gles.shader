//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Optimized/Opaque" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_MainTex2 ("Texture", 2D) = "white" { }
_Scale ("Scale", Float) = 1
_OffsetX ("Offset X", Float) = 1
_OffsetY ("Offset Y", Float) = 1
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZTest Less
  GpuProgramID 35617
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform sampler2D _MainTex2;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp float diff_1;
  mediump float nl_2;
  mediump vec3 worldNormal_3;
  lowp vec4 vertPose_4;
  lowp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  vertPose_4 = tmpvar_7;
  lowp vec2 tmpvar_8;
  tmpvar_8.x = _OffsetX;
  tmpvar_8.y = _OffsetY;
  tmpvar_5 = (vertPose_4.xz + tmpvar_8);
  tmpvar_5 = (tmpvar_5 / _Scale);
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(normalize((_glesNormal * tmpvar_9)));
  worldNormal_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = max (0.0, dot (worldNormal_3, _WorldSpaceLightPos0.xyz));
  nl_2 = tmpvar_11;
  mediump float tmpvar_12;
  tmpvar_12 = (pow (nl_2, 4.0) / 3.0);
  diff_1 = tmpvar_12;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_5;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_COLOR1 = (texture2DLod (_MainTex2, tmpvar_5, 0.0) + diff_1);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR1);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform sampler2D _MainTex2;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp float diff_1;
  mediump float nl_2;
  mediump vec3 worldNormal_3;
  lowp vec4 vertPose_4;
  lowp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  vertPose_4 = tmpvar_7;
  lowp vec2 tmpvar_8;
  tmpvar_8.x = _OffsetX;
  tmpvar_8.y = _OffsetY;
  tmpvar_5 = (vertPose_4.xz + tmpvar_8);
  tmpvar_5 = (tmpvar_5 / _Scale);
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(normalize((_glesNormal * tmpvar_9)));
  worldNormal_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = max (0.0, dot (worldNormal_3, _WorldSpaceLightPos0.xyz));
  nl_2 = tmpvar_11;
  mediump float tmpvar_12;
  tmpvar_12 = (pow (nl_2, 4.0) / 3.0);
  diff_1 = tmpvar_12;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_5;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_COLOR1 = (texture2DLod (_MainTex2, tmpvar_5, 0.0) + diff_1);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR1);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform sampler2D _MainTex2;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp float diff_1;
  mediump float nl_2;
  mediump vec3 worldNormal_3;
  lowp vec4 vertPose_4;
  lowp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  vertPose_4 = tmpvar_7;
  lowp vec2 tmpvar_8;
  tmpvar_8.x = _OffsetX;
  tmpvar_8.y = _OffsetY;
  tmpvar_5 = (vertPose_4.xz + tmpvar_8);
  tmpvar_5 = (tmpvar_5 / _Scale);
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(normalize((_glesNormal * tmpvar_9)));
  worldNormal_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = max (0.0, dot (worldNormal_3, _WorldSpaceLightPos0.xyz));
  nl_2 = tmpvar_11;
  mediump float tmpvar_12;
  tmpvar_12 = (pow (nl_2, 4.0) / 3.0);
  diff_1 = tmpvar_12;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_5;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_COLOR1 = (texture2DLod (_MainTex2, tmpvar_5, 0.0) + diff_1);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR1);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform sampler2D _MainTex2;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp float diff_1;
  mediump float nl_2;
  mediump vec3 worldNormal_3;
  lowp vec4 vertPose_4;
  lowp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  vertPose_4 = tmpvar_8;
  lowp vec2 tmpvar_9;
  tmpvar_9.x = _OffsetX;
  tmpvar_9.y = _OffsetY;
  tmpvar_5 = (vertPose_4.xz + tmpvar_9);
  tmpvar_5 = (tmpvar_5 / _Scale);
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_WorldToObject[0].xyz;
  tmpvar_10[1] = unity_WorldToObject[1].xyz;
  tmpvar_10[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(normalize((_glesNormal * tmpvar_10)));
  worldNormal_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (worldNormal_3, _WorldSpaceLightPos0.xyz));
  nl_2 = tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (pow (nl_2, 4.0) / 3.0);
  diff_1 = tmpvar_13;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD1 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_6;
  xlv_COLOR1 = (texture2DLod (_MainTex2, tmpvar_5, 0.0) + diff_1);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR1);
  col_1.w = tmpvar_2.w;
  highp float tmpvar_3;
  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform sampler2D _MainTex2;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp float diff_1;
  mediump float nl_2;
  mediump vec3 worldNormal_3;
  lowp vec4 vertPose_4;
  lowp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  vertPose_4 = tmpvar_8;
  lowp vec2 tmpvar_9;
  tmpvar_9.x = _OffsetX;
  tmpvar_9.y = _OffsetY;
  tmpvar_5 = (vertPose_4.xz + tmpvar_9);
  tmpvar_5 = (tmpvar_5 / _Scale);
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_WorldToObject[0].xyz;
  tmpvar_10[1] = unity_WorldToObject[1].xyz;
  tmpvar_10[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(normalize((_glesNormal * tmpvar_10)));
  worldNormal_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (worldNormal_3, _WorldSpaceLightPos0.xyz));
  nl_2 = tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (pow (nl_2, 4.0) / 3.0);
  diff_1 = tmpvar_13;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD1 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_6;
  xlv_COLOR1 = (texture2DLod (_MainTex2, tmpvar_5, 0.0) + diff_1);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR1);
  col_1.w = tmpvar_2.w;
  highp float tmpvar_3;
  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform sampler2D _MainTex2;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp float diff_1;
  mediump float nl_2;
  mediump vec3 worldNormal_3;
  lowp vec4 vertPose_4;
  lowp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  vertPose_4 = tmpvar_8;
  lowp vec2 tmpvar_9;
  tmpvar_9.x = _OffsetX;
  tmpvar_9.y = _OffsetY;
  tmpvar_5 = (vertPose_4.xz + tmpvar_9);
  tmpvar_5 = (tmpvar_5 / _Scale);
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_WorldToObject[0].xyz;
  tmpvar_10[1] = unity_WorldToObject[1].xyz;
  tmpvar_10[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(normalize((_glesNormal * tmpvar_10)));
  worldNormal_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (worldNormal_3, _WorldSpaceLightPos0.xyz));
  nl_2 = tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (pow (nl_2, 4.0) / 3.0);
  diff_1 = tmpvar_13;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD1 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_6;
  xlv_COLOR1 = (texture2DLod (_MainTex2, tmpvar_5, 0.0) + diff_1);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR1);
  col_1.w = tmpvar_2.w;
  highp float tmpvar_3;
  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
  gl_FragData[0] = col_1;
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
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform sampler2D _MainTex2;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp float diff_1;
  mediump float nl_2;
  mediump vec3 worldNormal_3;
  lowp vec4 vertPose_4;
  lowp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  vertPose_4 = tmpvar_7;
  lowp vec2 tmpvar_8;
  tmpvar_8.x = _OffsetX;
  tmpvar_8.y = _OffsetY;
  tmpvar_5 = (vertPose_4.xz + tmpvar_8);
  tmpvar_5 = (tmpvar_5 / _Scale);
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(normalize((_glesNormal * tmpvar_9)));
  worldNormal_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = max (0.0, dot (worldNormal_3, _WorldSpaceLightPos0.xyz));
  nl_2 = tmpvar_11;
  mediump float tmpvar_12;
  tmpvar_12 = (pow (nl_2, 4.0) / 3.0);
  diff_1 = tmpvar_12;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_5;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_COLOR1 = (texture2DLod (_MainTex2, tmpvar_5, 0.0) + diff_1);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR1);
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
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform sampler2D _MainTex2;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp float diff_1;
  mediump float nl_2;
  mediump vec3 worldNormal_3;
  lowp vec4 vertPose_4;
  lowp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  vertPose_4 = tmpvar_7;
  lowp vec2 tmpvar_8;
  tmpvar_8.x = _OffsetX;
  tmpvar_8.y = _OffsetY;
  tmpvar_5 = (vertPose_4.xz + tmpvar_8);
  tmpvar_5 = (tmpvar_5 / _Scale);
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(normalize((_glesNormal * tmpvar_9)));
  worldNormal_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = max (0.0, dot (worldNormal_3, _WorldSpaceLightPos0.xyz));
  nl_2 = tmpvar_11;
  mediump float tmpvar_12;
  tmpvar_12 = (pow (nl_2, 4.0) / 3.0);
  diff_1 = tmpvar_12;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_5;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_COLOR1 = (texture2DLod (_MainTex2, tmpvar_5, 0.0) + diff_1);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR1);
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
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform sampler2D _MainTex2;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp float diff_1;
  mediump float nl_2;
  mediump vec3 worldNormal_3;
  lowp vec4 vertPose_4;
  lowp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex);
  vertPose_4 = tmpvar_7;
  lowp vec2 tmpvar_8;
  tmpvar_8.x = _OffsetX;
  tmpvar_8.y = _OffsetY;
  tmpvar_5 = (vertPose_4.xz + tmpvar_8);
  tmpvar_5 = (tmpvar_5 / _Scale);
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(normalize((_glesNormal * tmpvar_9)));
  worldNormal_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = max (0.0, dot (worldNormal_3, _WorldSpaceLightPos0.xyz));
  nl_2 = tmpvar_11;
  mediump float tmpvar_12;
  tmpvar_12 = (pow (nl_2, 4.0) / 3.0);
  diff_1 = tmpvar_12;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_5;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  xlv_COLOR1 = (texture2DLod (_MainTex2, tmpvar_5, 0.0) + diff_1);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR1);
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
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform sampler2D _MainTex2;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp float diff_1;
  mediump float nl_2;
  mediump vec3 worldNormal_3;
  lowp vec4 vertPose_4;
  lowp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  vertPose_4 = tmpvar_8;
  lowp vec2 tmpvar_9;
  tmpvar_9.x = _OffsetX;
  tmpvar_9.y = _OffsetY;
  tmpvar_5 = (vertPose_4.xz + tmpvar_9);
  tmpvar_5 = (tmpvar_5 / _Scale);
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_WorldToObject[0].xyz;
  tmpvar_10[1] = unity_WorldToObject[1].xyz;
  tmpvar_10[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(normalize((_glesNormal * tmpvar_10)));
  worldNormal_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (worldNormal_3, _WorldSpaceLightPos0.xyz));
  nl_2 = tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (pow (nl_2, 4.0) / 3.0);
  diff_1 = tmpvar_13;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD1 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_6;
  xlv_COLOR1 = (texture2DLod (_MainTex2, tmpvar_5, 0.0) + diff_1);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR1);
  col_1.w = tmpvar_2.w;
  highp float tmpvar_3;
  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform sampler2D _MainTex2;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp float diff_1;
  mediump float nl_2;
  mediump vec3 worldNormal_3;
  lowp vec4 vertPose_4;
  lowp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  vertPose_4 = tmpvar_8;
  lowp vec2 tmpvar_9;
  tmpvar_9.x = _OffsetX;
  tmpvar_9.y = _OffsetY;
  tmpvar_5 = (vertPose_4.xz + tmpvar_9);
  tmpvar_5 = (tmpvar_5 / _Scale);
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_WorldToObject[0].xyz;
  tmpvar_10[1] = unity_WorldToObject[1].xyz;
  tmpvar_10[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(normalize((_glesNormal * tmpvar_10)));
  worldNormal_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (worldNormal_3, _WorldSpaceLightPos0.xyz));
  nl_2 = tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (pow (nl_2, 4.0) / 3.0);
  diff_1 = tmpvar_13;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD1 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_6;
  xlv_COLOR1 = (texture2DLod (_MainTex2, tmpvar_5, 0.0) + diff_1);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR1);
  col_1.w = tmpvar_2.w;
  highp float tmpvar_3;
  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform sampler2D _MainTex2;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp float diff_1;
  mediump float nl_2;
  mediump vec3 worldNormal_3;
  lowp vec4 vertPose_4;
  lowp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  vertPose_4 = tmpvar_8;
  lowp vec2 tmpvar_9;
  tmpvar_9.x = _OffsetX;
  tmpvar_9.y = _OffsetY;
  tmpvar_5 = (vertPose_4.xz + tmpvar_9);
  tmpvar_5 = (tmpvar_5 / _Scale);
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_WorldToObject[0].xyz;
  tmpvar_10[1] = unity_WorldToObject[1].xyz;
  tmpvar_10[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(normalize((_glesNormal * tmpvar_10)));
  worldNormal_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (worldNormal_3, _WorldSpaceLightPos0.xyz));
  nl_2 = tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (pow (nl_2, 4.0) / 3.0);
  diff_1 = tmpvar_13;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD1 = ((tmpvar_6.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_6;
  xlv_COLOR1 = (texture2DLod (_MainTex2, tmpvar_5, 0.0) + diff_1);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR1);
  col_1.w = tmpvar_2.w;
  highp float tmpvar_3;
  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, tmpvar_2.xyz, vec3(tmpvar_3));
  gl_FragData[0] = col_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
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
}
}
}
Fallback "Optimized/FallBack/Opaque"
}