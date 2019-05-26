//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Cubic/KillingSphere" {
Properties {
_MainTex ("Grid", 2D) = "white" { }
_MainTex2 ("Wawes", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
_RotationSpeed ("RotSpeed", Range(0, 11)) = 0.01
_Scale ("Scale", Float) = 1
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent-100" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent-100" "RenderType" = "Transparent" }
  ZTest Less
  ZWrite Off
  GpuProgramID 22294
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex2_ST;
uniform highp float _Scale;
uniform highp float _RotationSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 posDelta_1;
  mediump float time_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp float tmpvar_7;
  tmpvar_7 = fract((_Time.x * _RotationSpeed));
  time_2 = tmpvar_7;
  mediump vec2 tmpvar_8;
  tmpvar_8.y = 0.0;
  tmpvar_8.x = time_2;
  posDelta_1.xz = (_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz).xz;
  posDelta_1.y = 0.0;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3 = ((tmpvar_3 + (tmpvar_8 / _Scale)) * _Scale);
  tmpvar_4 = ((_glesMultiTexCoord0.xy * _MainTex2_ST.xy) + _MainTex2_ST.zw);
  tmpvar_5 = ((tmpvar_4 + (vec2(time_2) / _Scale)) * _Scale);
  tmpvar_4 = ((-(tmpvar_4) + (vec2(time_2) / _Scale)) * _Scale);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD4 = mix (1.0, 0.2, clamp ((
    dot (posDelta_1, posDelta_1)
   / 10000.0), 0.0, 1.0));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 colt2_2;
  mediump vec4 colt_3;
  mediump vec4 col_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex2, xlv_TEXCOORD1);
  colt_3 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex2, xlv_TEXCOORD2);
  colt2_2 = tmpvar_7;
  colt_3.w = (colt_3.w * colt2_2.w);
  mediump vec3 tmpvar_8;
  tmpvar_8 = (_Color + colt_3.w).xyz;
  colt_3.w = ((col_4.w + colt_3.w) * xlv_TEXCOORD4);
  mediump vec4 tmpvar_9;
  tmpvar_9.xyz = tmpvar_8;
  tmpvar_9.w = colt_3.w;
  tmpvar_1 = tmpvar_9;
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
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex2_ST;
uniform highp float _Scale;
uniform highp float _RotationSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 posDelta_1;
  mediump float time_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp float tmpvar_7;
  tmpvar_7 = fract((_Time.x * _RotationSpeed));
  time_2 = tmpvar_7;
  mediump vec2 tmpvar_8;
  tmpvar_8.y = 0.0;
  tmpvar_8.x = time_2;
  posDelta_1.xz = (_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz).xz;
  posDelta_1.y = 0.0;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3 = ((tmpvar_3 + (tmpvar_8 / _Scale)) * _Scale);
  tmpvar_4 = ((_glesMultiTexCoord0.xy * _MainTex2_ST.xy) + _MainTex2_ST.zw);
  tmpvar_5 = ((tmpvar_4 + (vec2(time_2) / _Scale)) * _Scale);
  tmpvar_4 = ((-(tmpvar_4) + (vec2(time_2) / _Scale)) * _Scale);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD4 = mix (1.0, 0.2, clamp ((
    dot (posDelta_1, posDelta_1)
   / 10000.0), 0.0, 1.0));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 colt2_2;
  mediump vec4 colt_3;
  mediump vec4 col_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex2, xlv_TEXCOORD1);
  colt_3 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex2, xlv_TEXCOORD2);
  colt2_2 = tmpvar_7;
  colt_3.w = (colt_3.w * colt2_2.w);
  mediump vec3 tmpvar_8;
  tmpvar_8 = (_Color + colt_3.w).xyz;
  colt_3.w = ((col_4.w + colt_3.w) * xlv_TEXCOORD4);
  mediump vec4 tmpvar_9;
  tmpvar_9.xyz = tmpvar_8;
  tmpvar_9.w = colt_3.w;
  tmpvar_1 = tmpvar_9;
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
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex2_ST;
uniform highp float _Scale;
uniform highp float _RotationSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 posDelta_1;
  mediump float time_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp float tmpvar_7;
  tmpvar_7 = fract((_Time.x * _RotationSpeed));
  time_2 = tmpvar_7;
  mediump vec2 tmpvar_8;
  tmpvar_8.y = 0.0;
  tmpvar_8.x = time_2;
  posDelta_1.xz = (_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz).xz;
  posDelta_1.y = 0.0;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3 = ((tmpvar_3 + (tmpvar_8 / _Scale)) * _Scale);
  tmpvar_4 = ((_glesMultiTexCoord0.xy * _MainTex2_ST.xy) + _MainTex2_ST.zw);
  tmpvar_5 = ((tmpvar_4 + (vec2(time_2) / _Scale)) * _Scale);
  tmpvar_4 = ((-(tmpvar_4) + (vec2(time_2) / _Scale)) * _Scale);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD4 = mix (1.0, 0.2, clamp ((
    dot (posDelta_1, posDelta_1)
   / 10000.0), 0.0, 1.0));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 colt2_2;
  mediump vec4 colt_3;
  mediump vec4 col_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex2, xlv_TEXCOORD1);
  colt_3 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex2, xlv_TEXCOORD2);
  colt2_2 = tmpvar_7;
  colt_3.w = (colt_3.w * colt2_2.w);
  mediump vec3 tmpvar_8;
  tmpvar_8 = (_Color + colt_3.w).xyz;
  colt_3.w = ((col_4.w + colt_3.w) * xlv_TEXCOORD4);
  mediump vec4 tmpvar_9;
  tmpvar_9.xyz = tmpvar_8;
  tmpvar_9.w = colt_3.w;
  tmpvar_1 = tmpvar_9;
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
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex2_ST;
uniform highp float _Scale;
uniform highp float _RotationSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 posDelta_1;
  mediump float time_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp float tmpvar_7;
  tmpvar_7 = fract((_Time.x * _RotationSpeed));
  time_2 = tmpvar_7;
  mediump vec2 tmpvar_8;
  tmpvar_8.y = 0.0;
  tmpvar_8.x = time_2;
  posDelta_1.xz = (_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz).xz;
  posDelta_1.y = 0.0;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3 = ((tmpvar_3 + (tmpvar_8 / _Scale)) * _Scale);
  tmpvar_4 = ((_glesMultiTexCoord0.xy * _MainTex2_ST.xy) + _MainTex2_ST.zw);
  tmpvar_5 = ((tmpvar_4 + (vec2(time_2) / _Scale)) * _Scale);
  tmpvar_4 = ((-(tmpvar_4) + (vec2(time_2) / _Scale)) * _Scale);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD4 = mix (1.0, 0.2, clamp ((
    dot (posDelta_1, posDelta_1)
   / 10000.0), 0.0, 1.0));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 colt2_2;
  mediump vec4 colt_3;
  mediump vec4 col_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex2, xlv_TEXCOORD1);
  colt_3 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex2, xlv_TEXCOORD2);
  colt2_2 = tmpvar_7;
  colt_3.w = (colt_3.w * colt2_2.w);
  mediump vec3 tmpvar_8;
  tmpvar_8 = (_Color + colt_3.w).xyz;
  colt_3.w = ((col_4.w + colt_3.w) * xlv_TEXCOORD4);
  mediump vec4 tmpvar_9;
  tmpvar_9.xyz = tmpvar_8;
  tmpvar_9.w = colt_3.w;
  tmpvar_1 = tmpvar_9;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex2_ST;
uniform highp float _Scale;
uniform highp float _RotationSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 posDelta_1;
  mediump float time_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp float tmpvar_7;
  tmpvar_7 = fract((_Time.x * _RotationSpeed));
  time_2 = tmpvar_7;
  mediump vec2 tmpvar_8;
  tmpvar_8.y = 0.0;
  tmpvar_8.x = time_2;
  posDelta_1.xz = (_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz).xz;
  posDelta_1.y = 0.0;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3 = ((tmpvar_3 + (tmpvar_8 / _Scale)) * _Scale);
  tmpvar_4 = ((_glesMultiTexCoord0.xy * _MainTex2_ST.xy) + _MainTex2_ST.zw);
  tmpvar_5 = ((tmpvar_4 + (vec2(time_2) / _Scale)) * _Scale);
  tmpvar_4 = ((-(tmpvar_4) + (vec2(time_2) / _Scale)) * _Scale);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD4 = mix (1.0, 0.2, clamp ((
    dot (posDelta_1, posDelta_1)
   / 10000.0), 0.0, 1.0));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 colt2_2;
  mediump vec4 colt_3;
  mediump vec4 col_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex2, xlv_TEXCOORD1);
  colt_3 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex2, xlv_TEXCOORD2);
  colt2_2 = tmpvar_7;
  colt_3.w = (colt_3.w * colt2_2.w);
  mediump vec3 tmpvar_8;
  tmpvar_8 = (_Color + colt_3.w).xyz;
  colt_3.w = ((col_4.w + colt_3.w) * xlv_TEXCOORD4);
  mediump vec4 tmpvar_9;
  tmpvar_9.xyz = tmpvar_8;
  tmpvar_9.w = colt_3.w;
  tmpvar_1 = tmpvar_9;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex2_ST;
uniform highp float _Scale;
uniform highp float _RotationSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 posDelta_1;
  mediump float time_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp float tmpvar_7;
  tmpvar_7 = fract((_Time.x * _RotationSpeed));
  time_2 = tmpvar_7;
  mediump vec2 tmpvar_8;
  tmpvar_8.y = 0.0;
  tmpvar_8.x = time_2;
  posDelta_1.xz = (_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz).xz;
  posDelta_1.y = 0.0;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3 = ((tmpvar_3 + (tmpvar_8 / _Scale)) * _Scale);
  tmpvar_4 = ((_glesMultiTexCoord0.xy * _MainTex2_ST.xy) + _MainTex2_ST.zw);
  tmpvar_5 = ((tmpvar_4 + (vec2(time_2) / _Scale)) * _Scale);
  tmpvar_4 = ((-(tmpvar_4) + (vec2(time_2) / _Scale)) * _Scale);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD4 = mix (1.0, 0.2, clamp ((
    dot (posDelta_1, posDelta_1)
   / 10000.0), 0.0, 1.0));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 colt2_2;
  mediump vec4 colt_3;
  mediump vec4 col_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex2, xlv_TEXCOORD1);
  colt_3 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex2, xlv_TEXCOORD2);
  colt2_2 = tmpvar_7;
  colt_3.w = (colt_3.w * colt2_2.w);
  mediump vec3 tmpvar_8;
  tmpvar_8 = (_Color + colt_3.w).xyz;
  colt_3.w = ((col_4.w + colt_3.w) * xlv_TEXCOORD4);
  mediump vec4 tmpvar_9;
  tmpvar_9.xyz = tmpvar_8;
  tmpvar_9.w = colt_3.w;
  tmpvar_1 = tmpvar_9;
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
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex2_ST;
uniform highp float _Scale;
uniform highp float _RotationSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 posDelta_1;
  mediump float time_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp float tmpvar_7;
  tmpvar_7 = fract((_Time.x * _RotationSpeed));
  time_2 = tmpvar_7;
  mediump vec2 tmpvar_8;
  tmpvar_8.y = 0.0;
  tmpvar_8.x = time_2;
  posDelta_1.xz = (_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz).xz;
  posDelta_1.y = 0.0;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3 = ((tmpvar_3 + (tmpvar_8 / _Scale)) * _Scale);
  tmpvar_4 = ((_glesMultiTexCoord0.xy * _MainTex2_ST.xy) + _MainTex2_ST.zw);
  tmpvar_5 = ((tmpvar_4 + (vec2(time_2) / _Scale)) * _Scale);
  tmpvar_4 = ((-(tmpvar_4) + (vec2(time_2) / _Scale)) * _Scale);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD4 = mix (1.0, 0.2, clamp ((
    dot (posDelta_1, posDelta_1)
   / 10000.0), 0.0, 1.0));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 colt2_2;
  mediump vec4 colt_3;
  mediump vec4 col_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex2, xlv_TEXCOORD1);
  colt_3 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex2, xlv_TEXCOORD2);
  colt2_2 = tmpvar_7;
  colt_3.w = (colt_3.w * colt2_2.w);
  mediump vec3 tmpvar_8;
  tmpvar_8 = (_Color + colt_3.w).xyz;
  colt_3.w = ((col_4.w + colt_3.w) * xlv_TEXCOORD4);
  mediump vec4 tmpvar_9;
  tmpvar_9.xyz = tmpvar_8;
  tmpvar_9.w = colt_3.w;
  tmpvar_1 = tmpvar_9;
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
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex2_ST;
uniform highp float _Scale;
uniform highp float _RotationSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 posDelta_1;
  mediump float time_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp float tmpvar_7;
  tmpvar_7 = fract((_Time.x * _RotationSpeed));
  time_2 = tmpvar_7;
  mediump vec2 tmpvar_8;
  tmpvar_8.y = 0.0;
  tmpvar_8.x = time_2;
  posDelta_1.xz = (_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz).xz;
  posDelta_1.y = 0.0;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3 = ((tmpvar_3 + (tmpvar_8 / _Scale)) * _Scale);
  tmpvar_4 = ((_glesMultiTexCoord0.xy * _MainTex2_ST.xy) + _MainTex2_ST.zw);
  tmpvar_5 = ((tmpvar_4 + (vec2(time_2) / _Scale)) * _Scale);
  tmpvar_4 = ((-(tmpvar_4) + (vec2(time_2) / _Scale)) * _Scale);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD4 = mix (1.0, 0.2, clamp ((
    dot (posDelta_1, posDelta_1)
   / 10000.0), 0.0, 1.0));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 colt2_2;
  mediump vec4 colt_3;
  mediump vec4 col_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex2, xlv_TEXCOORD1);
  colt_3 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex2, xlv_TEXCOORD2);
  colt2_2 = tmpvar_7;
  colt_3.w = (colt_3.w * colt2_2.w);
  mediump vec3 tmpvar_8;
  tmpvar_8 = (_Color + colt_3.w).xyz;
  colt_3.w = ((col_4.w + colt_3.w) * xlv_TEXCOORD4);
  mediump vec4 tmpvar_9;
  tmpvar_9.xyz = tmpvar_8;
  tmpvar_9.w = colt_3.w;
  tmpvar_1 = tmpvar_9;
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
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex2_ST;
uniform highp float _Scale;
uniform highp float _RotationSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 posDelta_1;
  mediump float time_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp float tmpvar_7;
  tmpvar_7 = fract((_Time.x * _RotationSpeed));
  time_2 = tmpvar_7;
  mediump vec2 tmpvar_8;
  tmpvar_8.y = 0.0;
  tmpvar_8.x = time_2;
  posDelta_1.xz = (_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz).xz;
  posDelta_1.y = 0.0;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3 = ((tmpvar_3 + (tmpvar_8 / _Scale)) * _Scale);
  tmpvar_4 = ((_glesMultiTexCoord0.xy * _MainTex2_ST.xy) + _MainTex2_ST.zw);
  tmpvar_5 = ((tmpvar_4 + (vec2(time_2) / _Scale)) * _Scale);
  tmpvar_4 = ((-(tmpvar_4) + (vec2(time_2) / _Scale)) * _Scale);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD4 = mix (1.0, 0.2, clamp ((
    dot (posDelta_1, posDelta_1)
   / 10000.0), 0.0, 1.0));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 colt2_2;
  mediump vec4 colt_3;
  mediump vec4 col_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex2, xlv_TEXCOORD1);
  colt_3 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex2, xlv_TEXCOORD2);
  colt2_2 = tmpvar_7;
  colt_3.w = (colt_3.w * colt2_2.w);
  mediump vec3 tmpvar_8;
  tmpvar_8 = (_Color + colt_3.w).xyz;
  colt_3.w = ((col_4.w + colt_3.w) * xlv_TEXCOORD4);
  mediump vec4 tmpvar_9;
  tmpvar_9.xyz = tmpvar_8;
  tmpvar_9.w = colt_3.w;
  tmpvar_1 = tmpvar_9;
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
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex2_ST;
uniform highp float _Scale;
uniform highp float _RotationSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 posDelta_1;
  mediump float time_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp float tmpvar_7;
  tmpvar_7 = fract((_Time.x * _RotationSpeed));
  time_2 = tmpvar_7;
  mediump vec2 tmpvar_8;
  tmpvar_8.y = 0.0;
  tmpvar_8.x = time_2;
  posDelta_1.xz = (_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz).xz;
  posDelta_1.y = 0.0;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3 = ((tmpvar_3 + (tmpvar_8 / _Scale)) * _Scale);
  tmpvar_4 = ((_glesMultiTexCoord0.xy * _MainTex2_ST.xy) + _MainTex2_ST.zw);
  tmpvar_5 = ((tmpvar_4 + (vec2(time_2) / _Scale)) * _Scale);
  tmpvar_4 = ((-(tmpvar_4) + (vec2(time_2) / _Scale)) * _Scale);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD4 = mix (1.0, 0.2, clamp ((
    dot (posDelta_1, posDelta_1)
   / 10000.0), 0.0, 1.0));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 colt2_2;
  mediump vec4 colt_3;
  mediump vec4 col_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex2, xlv_TEXCOORD1);
  colt_3 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex2, xlv_TEXCOORD2);
  colt2_2 = tmpvar_7;
  colt_3.w = (colt_3.w * colt2_2.w);
  mediump vec3 tmpvar_8;
  tmpvar_8 = (_Color + colt_3.w).xyz;
  colt_3.w = ((col_4.w + colt_3.w) * xlv_TEXCOORD4);
  mediump vec4 tmpvar_9;
  tmpvar_9.xyz = tmpvar_8;
  tmpvar_9.w = colt_3.w;
  tmpvar_1 = tmpvar_9;
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
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex2_ST;
uniform highp float _Scale;
uniform highp float _RotationSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 posDelta_1;
  mediump float time_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp float tmpvar_7;
  tmpvar_7 = fract((_Time.x * _RotationSpeed));
  time_2 = tmpvar_7;
  mediump vec2 tmpvar_8;
  tmpvar_8.y = 0.0;
  tmpvar_8.x = time_2;
  posDelta_1.xz = (_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz).xz;
  posDelta_1.y = 0.0;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3 = ((tmpvar_3 + (tmpvar_8 / _Scale)) * _Scale);
  tmpvar_4 = ((_glesMultiTexCoord0.xy * _MainTex2_ST.xy) + _MainTex2_ST.zw);
  tmpvar_5 = ((tmpvar_4 + (vec2(time_2) / _Scale)) * _Scale);
  tmpvar_4 = ((-(tmpvar_4) + (vec2(time_2) / _Scale)) * _Scale);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD4 = mix (1.0, 0.2, clamp ((
    dot (posDelta_1, posDelta_1)
   / 10000.0), 0.0, 1.0));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 colt2_2;
  mediump vec4 colt_3;
  mediump vec4 col_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex2, xlv_TEXCOORD1);
  colt_3 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex2, xlv_TEXCOORD2);
  colt2_2 = tmpvar_7;
  colt_3.w = (colt_3.w * colt2_2.w);
  mediump vec3 tmpvar_8;
  tmpvar_8 = (_Color + colt_3.w).xyz;
  colt_3.w = ((col_4.w + colt_3.w) * xlv_TEXCOORD4);
  mediump vec4 tmpvar_9;
  tmpvar_9.xyz = tmpvar_8;
  tmpvar_9.w = colt_3.w;
  tmpvar_1 = tmpvar_9;
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
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex2_ST;
uniform highp float _Scale;
uniform highp float _RotationSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  highp vec3 posDelta_1;
  mediump float time_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  highp float tmpvar_7;
  tmpvar_7 = fract((_Time.x * _RotationSpeed));
  time_2 = tmpvar_7;
  mediump vec2 tmpvar_8;
  tmpvar_8.y = 0.0;
  tmpvar_8.x = time_2;
  posDelta_1.xz = (_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz).xz;
  posDelta_1.y = 0.0;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3 = ((tmpvar_3 + (tmpvar_8 / _Scale)) * _Scale);
  tmpvar_4 = ((_glesMultiTexCoord0.xy * _MainTex2_ST.xy) + _MainTex2_ST.zw);
  tmpvar_5 = ((tmpvar_4 + (vec2(time_2) / _Scale)) * _Scale);
  tmpvar_4 = ((-(tmpvar_4) + (vec2(time_2) / _Scale)) * _Scale);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD4 = mix (1.0, 0.2, clamp ((
    dot (posDelta_1, posDelta_1)
   / 10000.0), 0.0, 1.0));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 colt2_2;
  mediump vec4 colt_3;
  mediump vec4 col_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex2, xlv_TEXCOORD1);
  colt_3 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex2, xlv_TEXCOORD2);
  colt2_2 = tmpvar_7;
  colt_3.w = (colt_3.w * colt2_2.w);
  mediump vec3 tmpvar_8;
  tmpvar_8 = (_Color + colt_3.w).xyz;
  colt_3.w = ((col_4.w + colt_3.w) * xlv_TEXCOORD4);
  mediump vec4 tmpvar_9;
  tmpvar_9.xyz = tmpvar_8;
  tmpvar_9.w = colt_3.w;
  tmpvar_1 = tmpvar_9;
  gl_FragData[0] = tmpvar_1;
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
}