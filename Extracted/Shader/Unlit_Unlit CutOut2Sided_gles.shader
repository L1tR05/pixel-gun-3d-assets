//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Unlit CutOut2Sided" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
  ZTest Less
  Cull Off
  GpuProgramID 9230
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (0.0, 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  highp vec2 tmpvar_6;
  tmpvar_6 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_6 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_6 + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  if ((col_1.w <= 0.99)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_1;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (0.0, 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  highp vec2 tmpvar_6;
  tmpvar_6 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_6 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_6 + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  if ((col_1.w <= 0.99)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_1;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = clamp (0.0, 0.0, 1.0);
  tmpvar_3 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  highp vec2 tmpvar_6;
  tmpvar_6 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_6 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_6 + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  if ((col_1.w <= 0.99)) {
    discard;
  };
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_1;
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
}