//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "NinjutsuGames/Map TextureMask" {
Properties {
_Color ("_Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB)", 2D) = "white" { }
_Circle ("Circle", 2D) = "white" { }
_CirclesOfst ("Circles Offset", Vector) = (0,0,0,0)
_CirclesScl ("Circles Scale", Vector) = (0,0,0,0)
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  Offset -1, -1
  GpuProgramID 22775
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _Color;
uniform highp mat4 _Matrix;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = (_Matrix * _glesMultiTexCoord0).xy;
  xlv_COLOR = _Color;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _Circle;
uniform highp vec4 _CirclesScl;
uniform highp vec4 _CirclesOfst;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 o_1;
  highp float distance2_2;
  highp float xlat_vardistance_3;
  highp vec4 tex_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex_4 = tmpvar_5;
  highp vec2 P_6;
  P_6 = (((xlv_TEXCOORD0 + _CirclesOfst.xy) / _CirclesScl.x) + (0.5 - (1.0/(_CirclesScl.x))));
  lowp float tmpvar_7;
  tmpvar_7 = texture2D (_Circle, P_6).w;
  xlat_vardistance_3 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = clamp (((xlat_vardistance_3 - 0.19) / 0.01000001), 0.0, 1.0);
  highp float tmpvar_9;
  tmpvar_9 = (1.0 - (tmpvar_8 * (tmpvar_8 * 
    (3.0 - (2.0 * tmpvar_8))
  )));
  highp vec2 P_10;
  P_10 = (((xlv_TEXCOORD0 + _CirclesOfst.zw) / _CirclesScl.y) + (0.5 - (1.0/(_CirclesScl.y))));
  lowp float tmpvar_11;
  tmpvar_11 = texture2D (_Circle, P_10).w;
  distance2_2 = tmpvar_11;
  highp float edge0_12;
  edge0_12 = (0.79 - _CirclesScl.z);
  highp float tmpvar_13;
  tmpvar_13 = clamp (((distance2_2 - edge0_12) / (
    (0.8 - _CirclesScl.z)
   - edge0_12)), 0.0, 1.0);
  highp float tmpvar_14;
  tmpvar_14 = clamp (((distance2_2 - 0.88) / 0.00999999), 0.0, 1.0);
  highp float tmpvar_15;
  tmpvar_15 = ((tmpvar_14 * (tmpvar_14 * 
    (3.0 - (2.0 * tmpvar_14))
  )) - (tmpvar_13 * (tmpvar_13 * 
    (3.0 - (2.0 * tmpvar_13))
  )));
  highp vec4 tmpvar_16;
  tmpvar_16 = (vec4(0.0, 0.0, 1.0, 0.5) * tmpvar_9);
  highp vec4 tmpvar_17;
  tmpvar_17.w = 0.0;
  tmpvar_17.x = tmpvar_9;
  tmpvar_17.y = tmpvar_9;
  tmpvar_17.z = tmpvar_9;
  o_1 = (((
    (tex_4 * _Color)
   - tmpvar_17) + tmpvar_16) - tmpvar_15);
  gl_FragData[0] = o_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _Color;
uniform highp mat4 _Matrix;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = (_Matrix * _glesMultiTexCoord0).xy;
  xlv_COLOR = _Color;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _Circle;
uniform highp vec4 _CirclesScl;
uniform highp vec4 _CirclesOfst;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 o_1;
  highp float distance2_2;
  highp float xlat_vardistance_3;
  highp vec4 tex_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex_4 = tmpvar_5;
  highp vec2 P_6;
  P_6 = (((xlv_TEXCOORD0 + _CirclesOfst.xy) / _CirclesScl.x) + (0.5 - (1.0/(_CirclesScl.x))));
  lowp float tmpvar_7;
  tmpvar_7 = texture2D (_Circle, P_6).w;
  xlat_vardistance_3 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = clamp (((xlat_vardistance_3 - 0.19) / 0.01000001), 0.0, 1.0);
  highp float tmpvar_9;
  tmpvar_9 = (1.0 - (tmpvar_8 * (tmpvar_8 * 
    (3.0 - (2.0 * tmpvar_8))
  )));
  highp vec2 P_10;
  P_10 = (((xlv_TEXCOORD0 + _CirclesOfst.zw) / _CirclesScl.y) + (0.5 - (1.0/(_CirclesScl.y))));
  lowp float tmpvar_11;
  tmpvar_11 = texture2D (_Circle, P_10).w;
  distance2_2 = tmpvar_11;
  highp float edge0_12;
  edge0_12 = (0.79 - _CirclesScl.z);
  highp float tmpvar_13;
  tmpvar_13 = clamp (((distance2_2 - edge0_12) / (
    (0.8 - _CirclesScl.z)
   - edge0_12)), 0.0, 1.0);
  highp float tmpvar_14;
  tmpvar_14 = clamp (((distance2_2 - 0.88) / 0.00999999), 0.0, 1.0);
  highp float tmpvar_15;
  tmpvar_15 = ((tmpvar_14 * (tmpvar_14 * 
    (3.0 - (2.0 * tmpvar_14))
  )) - (tmpvar_13 * (tmpvar_13 * 
    (3.0 - (2.0 * tmpvar_13))
  )));
  highp vec4 tmpvar_16;
  tmpvar_16 = (vec4(0.0, 0.0, 1.0, 0.5) * tmpvar_9);
  highp vec4 tmpvar_17;
  tmpvar_17.w = 0.0;
  tmpvar_17.x = tmpvar_9;
  tmpvar_17.y = tmpvar_9;
  tmpvar_17.z = tmpvar_9;
  o_1 = (((
    (tex_4 * _Color)
   - tmpvar_17) + tmpvar_16) - tmpvar_15);
  gl_FragData[0] = o_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _Color;
uniform highp mat4 _Matrix;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = (_Matrix * _glesMultiTexCoord0).xy;
  xlv_COLOR = _Color;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _Circle;
uniform highp vec4 _CirclesScl;
uniform highp vec4 _CirclesOfst;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 o_1;
  highp float distance2_2;
  highp float xlat_vardistance_3;
  highp vec4 tex_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex_4 = tmpvar_5;
  highp vec2 P_6;
  P_6 = (((xlv_TEXCOORD0 + _CirclesOfst.xy) / _CirclesScl.x) + (0.5 - (1.0/(_CirclesScl.x))));
  lowp float tmpvar_7;
  tmpvar_7 = texture2D (_Circle, P_6).w;
  xlat_vardistance_3 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = clamp (((xlat_vardistance_3 - 0.19) / 0.01000001), 0.0, 1.0);
  highp float tmpvar_9;
  tmpvar_9 = (1.0 - (tmpvar_8 * (tmpvar_8 * 
    (3.0 - (2.0 * tmpvar_8))
  )));
  highp vec2 P_10;
  P_10 = (((xlv_TEXCOORD0 + _CirclesOfst.zw) / _CirclesScl.y) + (0.5 - (1.0/(_CirclesScl.y))));
  lowp float tmpvar_11;
  tmpvar_11 = texture2D (_Circle, P_10).w;
  distance2_2 = tmpvar_11;
  highp float edge0_12;
  edge0_12 = (0.79 - _CirclesScl.z);
  highp float tmpvar_13;
  tmpvar_13 = clamp (((distance2_2 - edge0_12) / (
    (0.8 - _CirclesScl.z)
   - edge0_12)), 0.0, 1.0);
  highp float tmpvar_14;
  tmpvar_14 = clamp (((distance2_2 - 0.88) / 0.00999999), 0.0, 1.0);
  highp float tmpvar_15;
  tmpvar_15 = ((tmpvar_14 * (tmpvar_14 * 
    (3.0 - (2.0 * tmpvar_14))
  )) - (tmpvar_13 * (tmpvar_13 * 
    (3.0 - (2.0 * tmpvar_13))
  )));
  highp vec4 tmpvar_16;
  tmpvar_16 = (vec4(0.0, 0.0, 1.0, 0.5) * tmpvar_9);
  highp vec4 tmpvar_17;
  tmpvar_17.w = 0.0;
  tmpvar_17.x = tmpvar_9;
  tmpvar_17.y = tmpvar_9;
  tmpvar_17.z = tmpvar_9;
  o_1 = (((
    (tex_4 * _Color)
   - tmpvar_17) + tmpvar_16) - tmpvar_15);
  gl_FragData[0] = o_1;
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