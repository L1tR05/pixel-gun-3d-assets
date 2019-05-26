//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-MotionVectors" {
Properties {
}
SubShader {
 Pass {
  Tags { "LIGHTMODE" = "MOTIONVECTORS" }
  ZWrite Off
  GpuProgramID 59123
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp mat4 _NonJitteredVP;
uniform highp mat4 _PreviousVP;
uniform highp mat4 _PreviousM;
uniform bool _HasLastPositionData;
uniform highp float _MotionVectorDepthBias;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec3 tmpvar_2;
  tmpvar_2 = _glesNormal;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_1.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xyw = tmpvar_5.xyw;
  tmpvar_4.z = (tmpvar_5.z + (_MotionVectorDepthBias * tmpvar_5.w));
  tmpvar_3 = (_NonJitteredVP * (unity_ObjectToWorld * _glesVertex));
  highp vec4 tmpvar_7;
  if (_HasLastPositionData) {
    highp vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = tmpvar_2;
    tmpvar_7 = tmpvar_8;
  } else {
    tmpvar_7 = tmpvar_1;
  };
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (_PreviousVP * (_PreviousM * tmpvar_7));
  gl_Position = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform bool _ForceNoMotion;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 uvDiff_1;
  highp vec2 tmpvar_2;
  tmpvar_2 = (((
    (xlv_TEXCOORD0.xyz / xlv_TEXCOORD0.w)
  .xy + 1.0) / 2.0) - ((
    (xlv_TEXCOORD1.xyz / xlv_TEXCOORD1.w)
  .xy + 1.0) / 2.0));
  uvDiff_1 = tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3.zw = vec2(0.0, 1.0);
  tmpvar_3.xy = uvDiff_1;
  gl_FragData[0] = (tmpvar_3 * (vec4(1.0, 1.0, 1.0, 1.0) - vec4(float(_ForceNoMotion))));
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp mat4 _NonJitteredVP;
uniform highp mat4 _PreviousVP;
uniform highp mat4 _PreviousM;
uniform bool _HasLastPositionData;
uniform highp float _MotionVectorDepthBias;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec3 tmpvar_2;
  tmpvar_2 = _glesNormal;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_1.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xyw = tmpvar_5.xyw;
  tmpvar_4.z = (tmpvar_5.z + (_MotionVectorDepthBias * tmpvar_5.w));
  tmpvar_3 = (_NonJitteredVP * (unity_ObjectToWorld * _glesVertex));
  highp vec4 tmpvar_7;
  if (_HasLastPositionData) {
    highp vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = tmpvar_2;
    tmpvar_7 = tmpvar_8;
  } else {
    tmpvar_7 = tmpvar_1;
  };
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (_PreviousVP * (_PreviousM * tmpvar_7));
  gl_Position = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform bool _ForceNoMotion;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 uvDiff_1;
  highp vec2 tmpvar_2;
  tmpvar_2 = (((
    (xlv_TEXCOORD0.xyz / xlv_TEXCOORD0.w)
  .xy + 1.0) / 2.0) - ((
    (xlv_TEXCOORD1.xyz / xlv_TEXCOORD1.w)
  .xy + 1.0) / 2.0));
  uvDiff_1 = tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3.zw = vec2(0.0, 1.0);
  tmpvar_3.xy = uvDiff_1;
  gl_FragData[0] = (tmpvar_3 * (vec4(1.0, 1.0, 1.0, 1.0) - vec4(float(_ForceNoMotion))));
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp mat4 _NonJitteredVP;
uniform highp mat4 _PreviousVP;
uniform highp mat4 _PreviousM;
uniform bool _HasLastPositionData;
uniform highp float _MotionVectorDepthBias;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec3 tmpvar_2;
  tmpvar_2 = _glesNormal;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_1.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  tmpvar_4.xyw = tmpvar_5.xyw;
  tmpvar_4.z = (tmpvar_5.z + (_MotionVectorDepthBias * tmpvar_5.w));
  tmpvar_3 = (_NonJitteredVP * (unity_ObjectToWorld * _glesVertex));
  highp vec4 tmpvar_7;
  if (_HasLastPositionData) {
    highp vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = tmpvar_2;
    tmpvar_7 = tmpvar_8;
  } else {
    tmpvar_7 = tmpvar_1;
  };
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (_PreviousVP * (_PreviousM * tmpvar_7));
  gl_Position = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform bool _ForceNoMotion;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 uvDiff_1;
  highp vec2 tmpvar_2;
  tmpvar_2 = (((
    (xlv_TEXCOORD0.xyz / xlv_TEXCOORD0.w)
  .xy + 1.0) / 2.0) - ((
    (xlv_TEXCOORD1.xyz / xlv_TEXCOORD1.w)
  .xy + 1.0) / 2.0));
  uvDiff_1 = tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3.zw = vec2(0.0, 1.0);
  tmpvar_3.xy = uvDiff_1;
  gl_FragData[0] = (tmpvar_3 * (vec4(1.0, 1.0, 1.0, 1.0) - vec4(float(_ForceNoMotion))));
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
  GpuProgramID 124246
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = o_3.xy;
  xlv_TEXCOORD1 = _glesNormal;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_CameraToWorld;
uniform highp mat4 _NonJitteredVP;
uniform highp mat4 _PreviousVP;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, xlv_TEXCOORD0).x)
   + _ZBufferParams.y))));
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_CameraToWorld * tmpvar_2);
  highp vec4 tmpvar_4;
  tmpvar_4 = (_PreviousVP * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5 = (_NonJitteredVP * tmpvar_3);
  highp vec2 tmpvar_6;
  tmpvar_6 = (((tmpvar_4.xy / tmpvar_4.w) + 1.0) / 2.0);
  highp vec2 tmpvar_7;
  tmpvar_7 = (((tmpvar_5.xy / tmpvar_5.w) + 1.0) / 2.0);
  tmpvar_1 = (tmpvar_7 - tmpvar_6);
  mediump vec4 tmpvar_8;
  tmpvar_8.zw = vec2(0.0, 1.0);
  tmpvar_8.xy = tmpvar_1;
  gl_FragData[0] = tmpvar_8;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = o_3.xy;
  xlv_TEXCOORD1 = _glesNormal;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_CameraToWorld;
uniform highp mat4 _NonJitteredVP;
uniform highp mat4 _PreviousVP;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, xlv_TEXCOORD0).x)
   + _ZBufferParams.y))));
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_CameraToWorld * tmpvar_2);
  highp vec4 tmpvar_4;
  tmpvar_4 = (_PreviousVP * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5 = (_NonJitteredVP * tmpvar_3);
  highp vec2 tmpvar_6;
  tmpvar_6 = (((tmpvar_4.xy / tmpvar_4.w) + 1.0) / 2.0);
  highp vec2 tmpvar_7;
  tmpvar_7 = (((tmpvar_5.xy / tmpvar_5.w) + 1.0) / 2.0);
  tmpvar_1 = (tmpvar_7 - tmpvar_6);
  mediump vec4 tmpvar_8;
  tmpvar_8.zw = vec2(0.0, 1.0);
  tmpvar_8.xy = tmpvar_1;
  gl_FragData[0] = tmpvar_8;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = o_3.xy;
  xlv_TEXCOORD1 = _glesNormal;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_CameraToWorld;
uniform highp mat4 _NonJitteredVP;
uniform highp mat4 _PreviousVP;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, xlv_TEXCOORD0).x)
   + _ZBufferParams.y))));
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_CameraToWorld * tmpvar_2);
  highp vec4 tmpvar_4;
  tmpvar_4 = (_PreviousVP * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5 = (_NonJitteredVP * tmpvar_3);
  highp vec2 tmpvar_6;
  tmpvar_6 = (((tmpvar_4.xy / tmpvar_4.w) + 1.0) / 2.0);
  highp vec2 tmpvar_7;
  tmpvar_7 = (((tmpvar_5.xy / tmpvar_5.w) + 1.0) / 2.0);
  tmpvar_1 = (tmpvar_7 - tmpvar_6);
  mediump vec4 tmpvar_8;
  tmpvar_8.zw = vec2(0.0, 1.0);
  tmpvar_8.xy = tmpvar_1;
  gl_FragData[0] = tmpvar_8;
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
  Cull Off
  GpuProgramID 143618
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = o_3.xy;
  xlv_TEXCOORD1 = _glesNormal;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_frag_depth : enable
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_CameraToWorld;
uniform highp mat4 _NonJitteredVP;
uniform highp mat4 _PreviousVP;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  mediump vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * tmpvar_1.x)
   + _ZBufferParams.y))));
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraToWorld * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5 = (_PreviousVP * tmpvar_4);
  highp vec4 tmpvar_6;
  tmpvar_6 = (_NonJitteredVP * tmpvar_4);
  highp vec2 tmpvar_7;
  tmpvar_7 = (((tmpvar_5.xy / tmpvar_5.w) + 1.0) / 2.0);
  highp vec2 tmpvar_8;
  tmpvar_8 = (((tmpvar_6.xy / tmpvar_6.w) + 1.0) / 2.0);
  tmpvar_2 = (tmpvar_8 - tmpvar_7);
  mediump vec4 tmpvar_9;
  tmpvar_9.zw = vec2(0.0, 1.0);
  tmpvar_9.xy = tmpvar_2;
  gl_FragDepthEXT = tmpvar_1.x;
  gl_FragData[0] = tmpvar_9;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = o_3.xy;
  xlv_TEXCOORD1 = _glesNormal;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_frag_depth : enable
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_CameraToWorld;
uniform highp mat4 _NonJitteredVP;
uniform highp mat4 _PreviousVP;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  mediump vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * tmpvar_1.x)
   + _ZBufferParams.y))));
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraToWorld * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5 = (_PreviousVP * tmpvar_4);
  highp vec4 tmpvar_6;
  tmpvar_6 = (_NonJitteredVP * tmpvar_4);
  highp vec2 tmpvar_7;
  tmpvar_7 = (((tmpvar_5.xy / tmpvar_5.w) + 1.0) / 2.0);
  highp vec2 tmpvar_8;
  tmpvar_8 = (((tmpvar_6.xy / tmpvar_6.w) + 1.0) / 2.0);
  tmpvar_2 = (tmpvar_8 - tmpvar_7);
  mediump vec4 tmpvar_9;
  tmpvar_9.zw = vec2(0.0, 1.0);
  tmpvar_9.xy = tmpvar_2;
  gl_FragDepthEXT = tmpvar_1.x;
  gl_FragData[0] = tmpvar_9;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = o_3.xy;
  xlv_TEXCOORD1 = _glesNormal;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_frag_depth : enable
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_CameraToWorld;
uniform highp mat4 _NonJitteredVP;
uniform highp mat4 _PreviousVP;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  mediump vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * tmpvar_1.x)
   + _ZBufferParams.y))));
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraToWorld * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5 = (_PreviousVP * tmpvar_4);
  highp vec4 tmpvar_6;
  tmpvar_6 = (_NonJitteredVP * tmpvar_4);
  highp vec2 tmpvar_7;
  tmpvar_7 = (((tmpvar_5.xy / tmpvar_5.w) + 1.0) / 2.0);
  highp vec2 tmpvar_8;
  tmpvar_8 = (((tmpvar_6.xy / tmpvar_6.w) + 1.0) / 2.0);
  tmpvar_2 = (tmpvar_8 - tmpvar_7);
  mediump vec4 tmpvar_9;
  tmpvar_9.zw = vec2(0.0, 1.0);
  tmpvar_9.xy = tmpvar_2;
  gl_FragDepthEXT = tmpvar_1.x;
  gl_FragData[0] = tmpvar_9;
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