//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Vignetting" {
Properties {
_MainTex ("Base", 2D) = "white" { }
_VignetteTex ("Vignette", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 60767
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec2 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  tmpvar_3 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _VignetteTex;
uniform mediump float _Intensity;
uniform mediump float _Blur;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 tmpvar_1;
  mediump vec4 colorBlur_2;
  highp float mask_3;
  mediump vec4 color_4;
  mediump vec2 uv_5;
  mediump vec2 coords_6;
  coords_6 = xlv_TEXCOORD0;
  uv_5 = xlv_TEXCOORD0;
  coords_6 = ((coords_6 - 0.5) * 2.0);
  mediump float tmpvar_7;
  tmpvar_7 = dot (coords_6, coords_6);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, uv_5);
  color_4 = tmpvar_8;
  mediump float tmpvar_9;
  tmpvar_9 = (1.0 - ((tmpvar_7 * _Intensity) * 0.1));
  mask_3 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_VignetteTex, xlv_TEXCOORD1);
  colorBlur_2 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = mix (color_4, colorBlur_2, vec4(clamp ((_Blur * tmpvar_7), 0.0, 1.0)));
  color_4 = tmpvar_11;
  tmpvar_1 = (tmpvar_11 * mask_3);
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec2 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  tmpvar_3 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _VignetteTex;
uniform mediump float _Intensity;
uniform mediump float _Blur;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 tmpvar_1;
  mediump vec4 colorBlur_2;
  highp float mask_3;
  mediump vec4 color_4;
  mediump vec2 uv_5;
  mediump vec2 coords_6;
  coords_6 = xlv_TEXCOORD0;
  uv_5 = xlv_TEXCOORD0;
  coords_6 = ((coords_6 - 0.5) * 2.0);
  mediump float tmpvar_7;
  tmpvar_7 = dot (coords_6, coords_6);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, uv_5);
  color_4 = tmpvar_8;
  mediump float tmpvar_9;
  tmpvar_9 = (1.0 - ((tmpvar_7 * _Intensity) * 0.1));
  mask_3 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_VignetteTex, xlv_TEXCOORD1);
  colorBlur_2 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = mix (color_4, colorBlur_2, vec4(clamp ((_Blur * tmpvar_7), 0.0, 1.0)));
  color_4 = tmpvar_11;
  tmpvar_1 = (tmpvar_11 * mask_3);
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec2 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  tmpvar_3 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _VignetteTex;
uniform mediump float _Intensity;
uniform mediump float _Blur;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 tmpvar_1;
  mediump vec4 colorBlur_2;
  highp float mask_3;
  mediump vec4 color_4;
  mediump vec2 uv_5;
  mediump vec2 coords_6;
  coords_6 = xlv_TEXCOORD0;
  uv_5 = xlv_TEXCOORD0;
  coords_6 = ((coords_6 - 0.5) * 2.0);
  mediump float tmpvar_7;
  tmpvar_7 = dot (coords_6, coords_6);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, uv_5);
  color_4 = tmpvar_8;
  mediump float tmpvar_9;
  tmpvar_9 = (1.0 - ((tmpvar_7 * _Intensity) * 0.1));
  mask_3 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_VignetteTex, xlv_TEXCOORD1);
  colorBlur_2 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = mix (color_4, colorBlur_2, vec4(clamp ((_Blur * tmpvar_7), 0.0, 1.0)));
  color_4 = tmpvar_11;
  tmpvar_1 = (tmpvar_11 * mask_3);
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