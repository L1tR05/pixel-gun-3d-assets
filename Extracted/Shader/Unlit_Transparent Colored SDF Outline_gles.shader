//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Transparent Colored SDF Outline" {
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
  GpuProgramID 46492
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
uniform highp vec4 _ScreenParams;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Base;
uniform lowp float _Smooth;
uniform lowp float _Outline;
lowp float xlat_mutable_Outline;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  xlat_mutable_Outline = (_Base + ((768.0 / _ScreenParams.y) * _Outline));
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float edge0_2;
  edge0_2 = (_Base - _Smooth);
  lowp float tmpvar_3;
  tmpvar_3 = clamp (((tmpvar_1.w - edge0_2) / (
    (_Base + _Smooth)
   - edge0_2)), 0.0, 1.0);
  lowp float edge0_4;
  edge0_4 = (xlat_mutable_Outline - _Smooth);
  lowp float tmpvar_5;
  tmpvar_5 = clamp (((tmpvar_1.w - edge0_4) / (
    (xlat_mutable_Outline + _Smooth)
   - edge0_4)), 0.0, 1.0);
  lowp vec4 tmpvar_6;
  tmpvar_6.xyz = _Color.xyz;
  tmpvar_6.w = (((tmpvar_3 * 
    (tmpvar_3 * (3.0 - (2.0 * tmpvar_3)))
  ) * float(
    (_Base < xlat_mutable_Outline)
  )) - (tmpvar_5 * (tmpvar_5 * 
    (3.0 - (2.0 * tmpvar_5))
  )));
  lowp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * xlv_COLOR);
  gl_FragData[0] = tmpvar_7;
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
uniform highp vec4 _ScreenParams;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Base;
uniform lowp float _Smooth;
uniform lowp float _Outline;
lowp float xlat_mutable_Outline;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  xlat_mutable_Outline = (_Base + ((768.0 / _ScreenParams.y) * _Outline));
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float edge0_2;
  edge0_2 = (_Base - _Smooth);
  lowp float tmpvar_3;
  tmpvar_3 = clamp (((tmpvar_1.w - edge0_2) / (
    (_Base + _Smooth)
   - edge0_2)), 0.0, 1.0);
  lowp float edge0_4;
  edge0_4 = (xlat_mutable_Outline - _Smooth);
  lowp float tmpvar_5;
  tmpvar_5 = clamp (((tmpvar_1.w - edge0_4) / (
    (xlat_mutable_Outline + _Smooth)
   - edge0_4)), 0.0, 1.0);
  lowp vec4 tmpvar_6;
  tmpvar_6.xyz = _Color.xyz;
  tmpvar_6.w = (((tmpvar_3 * 
    (tmpvar_3 * (3.0 - (2.0 * tmpvar_3)))
  ) * float(
    (_Base < xlat_mutable_Outline)
  )) - (tmpvar_5 * (tmpvar_5 * 
    (3.0 - (2.0 * tmpvar_5))
  )));
  lowp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * xlv_COLOR);
  gl_FragData[0] = tmpvar_7;
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
uniform highp vec4 _ScreenParams;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform lowp float _Base;
uniform lowp float _Smooth;
uniform lowp float _Outline;
lowp float xlat_mutable_Outline;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  xlat_mutable_Outline = (_Base + ((768.0 / _ScreenParams.y) * _Outline));
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float edge0_2;
  edge0_2 = (_Base - _Smooth);
  lowp float tmpvar_3;
  tmpvar_3 = clamp (((tmpvar_1.w - edge0_2) / (
    (_Base + _Smooth)
   - edge0_2)), 0.0, 1.0);
  lowp float edge0_4;
  edge0_4 = (xlat_mutable_Outline - _Smooth);
  lowp float tmpvar_5;
  tmpvar_5 = clamp (((tmpvar_1.w - edge0_4) / (
    (xlat_mutable_Outline + _Smooth)
   - edge0_4)), 0.0, 1.0);
  lowp vec4 tmpvar_6;
  tmpvar_6.xyz = _Color.xyz;
  tmpvar_6.w = (((tmpvar_3 * 
    (tmpvar_3 * (3.0 - (2.0 * tmpvar_3)))
  ) * float(
    (_Base < xlat_mutable_Outline)
  )) - (tmpvar_5 * (tmpvar_5 * 
    (3.0 - (2.0 * tmpvar_5))
  )));
  lowp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * xlv_COLOR);
  gl_FragData[0] = tmpvar_7;
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