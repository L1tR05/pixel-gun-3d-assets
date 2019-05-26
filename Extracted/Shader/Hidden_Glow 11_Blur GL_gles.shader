//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Glow 11/Blur GL" {
Properties {
_MainTex ("", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 51948
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord2;
attribute vec4 _glesMultiTexCoord4;
attribute vec4 _glesMultiTexCoord6;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
attribute mediump vec4 xlat_attrib_TEXCOORD;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD0_1;
varying mediump vec4 xlv_TEXCOORD0_2;
varying mediump vec4 xlv_TEXCOORD0_3;
varying mediump vec4 xlv_TEXCOORD0_4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = _glesMultiTexCoord0;
  xlv_TEXCOORD0_1 = _glesMultiTexCoord2;
  xlv_TEXCOORD0_2 = _glesMultiTexCoord4;
  xlv_TEXCOORD0_3 = _glesMultiTexCoord6;
  xlv_TEXCOORD0_4 = xlat_attrib_TEXCOORD;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD0_1;
varying mediump vec4 xlv_TEXCOORD0_2;
varying mediump vec4 xlv_TEXCOORD0_3;
varying mediump vec4 xlv_TEXCOORD0_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD0.xy) * 0.227027) + (
    (texture2D (_MainTex, xlv_TEXCOORD0_1.xy) + texture2D (_MainTex, xlv_TEXCOORD0_2.xy))
   * 0.3162162)) + ((texture2D (_MainTex, xlv_TEXCOORD0_3.xy) + texture2D (_MainTex, xlv_TEXCOORD0_4.xy)) * 0.07027027));
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord2;
attribute vec4 _glesMultiTexCoord4;
attribute vec4 _glesMultiTexCoord6;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
attribute mediump vec4 xlat_attrib_TEXCOORD;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD0_1;
varying mediump vec4 xlv_TEXCOORD0_2;
varying mediump vec4 xlv_TEXCOORD0_3;
varying mediump vec4 xlv_TEXCOORD0_4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = _glesMultiTexCoord0;
  xlv_TEXCOORD0_1 = _glesMultiTexCoord2;
  xlv_TEXCOORD0_2 = _glesMultiTexCoord4;
  xlv_TEXCOORD0_3 = _glesMultiTexCoord6;
  xlv_TEXCOORD0_4 = xlat_attrib_TEXCOORD;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD0_1;
varying mediump vec4 xlv_TEXCOORD0_2;
varying mediump vec4 xlv_TEXCOORD0_3;
varying mediump vec4 xlv_TEXCOORD0_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD0.xy) * 0.227027) + (
    (texture2D (_MainTex, xlv_TEXCOORD0_1.xy) + texture2D (_MainTex, xlv_TEXCOORD0_2.xy))
   * 0.3162162)) + ((texture2D (_MainTex, xlv_TEXCOORD0_3.xy) + texture2D (_MainTex, xlv_TEXCOORD0_4.xy)) * 0.07027027));
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord2;
attribute vec4 _glesMultiTexCoord4;
attribute vec4 _glesMultiTexCoord6;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
attribute mediump vec4 xlat_attrib_TEXCOORD;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD0_1;
varying mediump vec4 xlv_TEXCOORD0_2;
varying mediump vec4 xlv_TEXCOORD0_3;
varying mediump vec4 xlv_TEXCOORD0_4;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = _glesMultiTexCoord0;
  xlv_TEXCOORD0_1 = _glesMultiTexCoord2;
  xlv_TEXCOORD0_2 = _glesMultiTexCoord4;
  xlv_TEXCOORD0_3 = _glesMultiTexCoord6;
  xlv_TEXCOORD0_4 = xlat_attrib_TEXCOORD;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD0_1;
varying mediump vec4 xlv_TEXCOORD0_2;
varying mediump vec4 xlv_TEXCOORD0_3;
varying mediump vec4 xlv_TEXCOORD0_4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((texture2D (_MainTex, xlv_TEXCOORD0.xy) * 0.227027) + (
    (texture2D (_MainTex, xlv_TEXCOORD0_1.xy) + texture2D (_MainTex, xlv_TEXCOORD0_2.xy))
   * 0.3162162)) + ((texture2D (_MainTex, xlv_TEXCOORD0_3.xy) + texture2D (_MainTex, xlv_TEXCOORD0_4.xy)) * 0.07027027));
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