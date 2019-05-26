//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/BlendModesOverlay" {
Properties {
_MainTex ("Screen Blended", 2D) = "" { }
_Overlay ("Color", 2D) = "grey" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 6281
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
uniform mediump float _Intensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_Overlay, xlv_TEXCOORD0);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  gl_FragData[0] = (tmpvar_2 + (tmpvar_1 * _Intensity));
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
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
uniform mediump float _Intensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_Overlay, xlv_TEXCOORD0);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  gl_FragData[0] = (tmpvar_2 + (tmpvar_1 * _Intensity));
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
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
uniform mediump float _Intensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_Overlay, xlv_TEXCOORD0);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  gl_FragData[0] = (tmpvar_2 + (tmpvar_1 * _Intensity));
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 125561
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
uniform mediump float _Intensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_Overlay, xlv_TEXCOORD0);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  gl_FragData[0] = (1.0 - ((1.0 - 
    (tmpvar_1 * _Intensity)
  ) * (1.0 - tmpvar_2)));
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
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
uniform mediump float _Intensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_Overlay, xlv_TEXCOORD0);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  gl_FragData[0] = (1.0 - ((1.0 - 
    (tmpvar_1 * _Intensity)
  ) * (1.0 - tmpvar_2)));
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
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
uniform mediump float _Intensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_Overlay, xlv_TEXCOORD0);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  gl_FragData[0] = (1.0 - ((1.0 - 
    (tmpvar_1 * _Intensity)
  ) * (1.0 - tmpvar_2)));
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 137086
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
uniform mediump float _Intensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_Overlay, xlv_TEXCOORD0);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  gl_FragData[0] = (tmpvar_2 * (tmpvar_1 * _Intensity));
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
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
uniform mediump float _Intensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_Overlay, xlv_TEXCOORD0);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  gl_FragData[0] = (tmpvar_2 * (tmpvar_1 * _Intensity));
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
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
uniform mediump float _Intensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_Overlay, xlv_TEXCOORD0);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  gl_FragData[0] = (tmpvar_2 * (tmpvar_1 * _Intensity));
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 235576
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
uniform mediump float _Intensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec3 result_2;
  highp vec3 check_3;
  mediump vec4 color_4;
  mediump vec4 m_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Overlay, xlv_TEXCOORD0);
  m_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  color_4 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = vec3(greaterThanEqual (color_4.xyz, vec3(0.5, 0.5, 0.5)));
  check_3 = tmpvar_8;
  result_2 = (check_3 * (vec3(1.0, 1.0, 1.0) - (
    (vec3(1.0, 1.0, 1.0) - (2.0 * (color_4.xyz - 0.5)))
   * 
    (1.0 - m_5.xyz)
  )));
  result_2 = (result_2 + ((
    (1.0 - check_3)
   * 
    (2.0 * color_4.xyz)
  ) * m_5.xyz));
  highp vec4 tmpvar_9;
  tmpvar_9.xyz = mix (color_4.xyz, result_2, vec3(_Intensity));
  tmpvar_9.w = color_4.w;
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
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
uniform mediump float _Intensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec3 result_2;
  highp vec3 check_3;
  mediump vec4 color_4;
  mediump vec4 m_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Overlay, xlv_TEXCOORD0);
  m_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  color_4 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = vec3(greaterThanEqual (color_4.xyz, vec3(0.5, 0.5, 0.5)));
  check_3 = tmpvar_8;
  result_2 = (check_3 * (vec3(1.0, 1.0, 1.0) - (
    (vec3(1.0, 1.0, 1.0) - (2.0 * (color_4.xyz - 0.5)))
   * 
    (1.0 - m_5.xyz)
  )));
  result_2 = (result_2 + ((
    (1.0 - check_3)
   * 
    (2.0 * color_4.xyz)
  ) * m_5.xyz));
  highp vec4 tmpvar_9;
  tmpvar_9.xyz = mix (color_4.xyz, result_2, vec3(_Intensity));
  tmpvar_9.w = color_4.w;
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
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
uniform mediump float _Intensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec3 result_2;
  highp vec3 check_3;
  mediump vec4 color_4;
  mediump vec4 m_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Overlay, xlv_TEXCOORD0);
  m_5 = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  color_4 = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = vec3(greaterThanEqual (color_4.xyz, vec3(0.5, 0.5, 0.5)));
  check_3 = tmpvar_8;
  result_2 = (check_3 * (vec3(1.0, 1.0, 1.0) - (
    (vec3(1.0, 1.0, 1.0) - (2.0 * (color_4.xyz - 0.5)))
   * 
    (1.0 - m_5.xyz)
  )));
  result_2 = (result_2 + ((
    (1.0 - check_3)
   * 
    (2.0 * color_4.xyz)
  ) * m_5.xyz));
  highp vec4 tmpvar_9;
  tmpvar_9.xyz = mix (color_4.xyz, result_2, vec3(_Intensity));
  tmpvar_9.w = color_4.w;
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 279597
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  mediump vec4 toAdd_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Overlay, xlv_TEXCOORD0);
  toAdd_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  gl_FragData[0] = mix (tmpvar_3, toAdd_1, toAdd_1.wwww);
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
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  mediump vec4 toAdd_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Overlay, xlv_TEXCOORD0);
  toAdd_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  gl_FragData[0] = mix (tmpvar_3, toAdd_1, toAdd_1.wwww);
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
varying highp vec2 xlv_TEXCOORD0_1;
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
  xlv_TEXCOORD0_1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Overlay;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
void main ()
{
  mediump vec4 toAdd_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Overlay, xlv_TEXCOORD0);
  toAdd_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
  gl_FragData[0] = mix (tmpvar_3, toAdd_1, toAdd_1.wwww);
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