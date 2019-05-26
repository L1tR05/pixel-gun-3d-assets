//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Transparent Colored SDF" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" { }
_Color ("Color", Color) = (1,1,1,1)
_Base ("InRange", Range(0, 1)) = 0.6
_Smooth ("Smooth", Range(0, 1)) = 0.5
_Outline ("OutRange", Range(0, 1)) = 0.6
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 63943
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform highp float _Base;
uniform highp float _Smooth;
uniform highp float _Outline;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  highp float xlat_vardistance_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  xlat_vardistance_2 = tmpvar_3;
  highp float edge0_4;
  edge0_4 = (_Base - _Smooth);
  highp float tmpvar_5;
  tmpvar_5 = clamp (((xlat_vardistance_2 - edge0_4) / (
    (_Base + _Smooth)
   - edge0_4)), 0.0, 1.0);
  highp float edge0_6;
  edge0_6 = (_Outline - _Smooth);
  highp float tmpvar_7;
  tmpvar_7 = clamp (((xlat_vardistance_2 - edge0_6) / (
    (_Outline + _Smooth)
   - edge0_6)), 0.0, 1.0);
  highp vec4 tmpvar_8;
  tmpvar_8.xyz = _Color.xyz;
  tmpvar_8.w = ((tmpvar_7 * (tmpvar_7 * 
    (3.0 - (2.0 * tmpvar_7))
  )) - ((tmpvar_5 * 
    (tmpvar_5 * (3.0 - (2.0 * tmpvar_5)))
  ) * float(
    (_Base > _Outline)
  )));
  highp vec4 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * xlv_COLOR);
  tmpvar_1 = tmpvar_9;
  gl_FragData[0] = tmpvar_1;
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
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform highp float _Base;
uniform highp float _Smooth;
uniform highp float _Outline;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  highp float xlat_vardistance_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  xlat_vardistance_2 = tmpvar_3;
  highp float edge0_4;
  edge0_4 = (_Base - _Smooth);
  highp float tmpvar_5;
  tmpvar_5 = clamp (((xlat_vardistance_2 - edge0_4) / (
    (_Base + _Smooth)
   - edge0_4)), 0.0, 1.0);
  highp float edge0_6;
  edge0_6 = (_Outline - _Smooth);
  highp float tmpvar_7;
  tmpvar_7 = clamp (((xlat_vardistance_2 - edge0_6) / (
    (_Outline + _Smooth)
   - edge0_6)), 0.0, 1.0);
  highp vec4 tmpvar_8;
  tmpvar_8.xyz = _Color.xyz;
  tmpvar_8.w = ((tmpvar_7 * (tmpvar_7 * 
    (3.0 - (2.0 * tmpvar_7))
  )) - ((tmpvar_5 * 
    (tmpvar_5 * (3.0 - (2.0 * tmpvar_5)))
  ) * float(
    (_Base > _Outline)
  )));
  highp vec4 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * xlv_COLOR);
  tmpvar_1 = tmpvar_9;
  gl_FragData[0] = tmpvar_1;
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
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform highp float _Base;
uniform highp float _Smooth;
uniform highp float _Outline;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  highp float xlat_vardistance_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  xlat_vardistance_2 = tmpvar_3;
  highp float edge0_4;
  edge0_4 = (_Base - _Smooth);
  highp float tmpvar_5;
  tmpvar_5 = clamp (((xlat_vardistance_2 - edge0_4) / (
    (_Base + _Smooth)
   - edge0_4)), 0.0, 1.0);
  highp float edge0_6;
  edge0_6 = (_Outline - _Smooth);
  highp float tmpvar_7;
  tmpvar_7 = clamp (((xlat_vardistance_2 - edge0_6) / (
    (_Outline + _Smooth)
   - edge0_6)), 0.0, 1.0);
  highp vec4 tmpvar_8;
  tmpvar_8.xyz = _Color.xyz;
  tmpvar_8.w = ((tmpvar_7 * (tmpvar_7 * 
    (3.0 - (2.0 * tmpvar_7))
  )) - ((tmpvar_5 * 
    (tmpvar_5 * (3.0 - (2.0 * tmpvar_5)))
  ) * float(
    (_Base > _Outline)
  )));
  highp vec4 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * xlv_COLOR);
  tmpvar_1 = tmpvar_9;
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
}