//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/PrepareSunShaftsBlur" {
Properties {
_MainTex ("Base", 2D) = "" { }
_Skybox ("Skybox", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 7847
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform sampler2D _MainTex;
uniform sampler2D _CameraDepthTexture;
uniform mediump float _NoSkyBoxMask;
uniform mediump vec4 _SunPosition;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 outColor_1;
  mediump vec2 vec_2;
  mediump vec4 tex_3;
  highp float depthSample_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0).x;
  depthSample_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex_3 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = (1.0/(((_ZBufferParams.x * depthSample_4) + _ZBufferParams.y)));
  depthSample_4 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (_SunPosition.xy - xlv_TEXCOORD0);
  vec_2 = tmpvar_8;
  mediump float tmpvar_9;
  tmpvar_9 = clamp ((_SunPosition.w - sqrt(
    dot (vec_2, vec_2)
  )), 0.0, 1.0);
  outColor_1 = vec4(0.0, 0.0, 0.0, 0.0);
  if ((tmpvar_7 > 0.99)) {
    outColor_1 = vec4((max (tex_3.w, (_NoSkyBoxMask * 
      dot (tex_3.xyz, vec3(0.59, 0.3, 0.11))
    )) * tmpvar_9));
  };
  gl_FragData[0] = outColor_1;
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
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform sampler2D _MainTex;
uniform sampler2D _CameraDepthTexture;
uniform mediump float _NoSkyBoxMask;
uniform mediump vec4 _SunPosition;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 outColor_1;
  mediump vec2 vec_2;
  mediump vec4 tex_3;
  highp float depthSample_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0).x;
  depthSample_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex_3 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = (1.0/(((_ZBufferParams.x * depthSample_4) + _ZBufferParams.y)));
  depthSample_4 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (_SunPosition.xy - xlv_TEXCOORD0);
  vec_2 = tmpvar_8;
  mediump float tmpvar_9;
  tmpvar_9 = clamp ((_SunPosition.w - sqrt(
    dot (vec_2, vec_2)
  )), 0.0, 1.0);
  outColor_1 = vec4(0.0, 0.0, 0.0, 0.0);
  if ((tmpvar_7 > 0.99)) {
    outColor_1 = vec4((max (tex_3.w, (_NoSkyBoxMask * 
      dot (tex_3.xyz, vec3(0.59, 0.3, 0.11))
    )) * tmpvar_9));
  };
  gl_FragData[0] = outColor_1;
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
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform sampler2D _MainTex;
uniform sampler2D _CameraDepthTexture;
uniform mediump float _NoSkyBoxMask;
uniform mediump vec4 _SunPosition;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 outColor_1;
  mediump vec2 vec_2;
  mediump vec4 tex_3;
  highp float depthSample_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0).x;
  depthSample_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex_3 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = (1.0/(((_ZBufferParams.x * depthSample_4) + _ZBufferParams.y)));
  depthSample_4 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (_SunPosition.xy - xlv_TEXCOORD0);
  vec_2 = tmpvar_8;
  mediump float tmpvar_9;
  tmpvar_9 = clamp ((_SunPosition.w - sqrt(
    dot (vec_2, vec_2)
  )), 0.0, 1.0);
  outColor_1 = vec4(0.0, 0.0, 0.0, 0.0);
  if ((tmpvar_7 > 0.99)) {
    outColor_1 = vec4((max (tex_3.w, (_NoSkyBoxMask * 
      dot (tex_3.xyz, vec3(0.59, 0.3, 0.11))
    )) * tmpvar_9));
  };
  gl_FragData[0] = outColor_1;
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
  GpuProgramID 116553
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Skybox;
uniform mediump float _NoSkyBoxMask;
uniform mediump vec4 _SunPosition;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 outColor_1;
  mediump vec2 vec_2;
  highp vec4 tex_3;
  highp vec4 sky_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Skybox, xlv_TEXCOORD0);
  sky_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex_3 = tmpvar_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_SunPosition.xy - xlv_TEXCOORD0);
  vec_2 = tmpvar_7;
  mediump float tmpvar_8;
  tmpvar_8 = clamp ((_SunPosition.w - sqrt(
    dot (vec_2, vec_2)
  )), 0.0, 1.0);
  outColor_1 = vec4(0.0, 0.0, 0.0, 0.0);
  highp vec3 tmpvar_9;
  tmpvar_9 = abs((sky_4.xyz - tex_3.xyz));
  mediump vec3 rgb_10;
  rgb_10 = tmpvar_9;
  mediump float tmpvar_11;
  tmpvar_11 = dot (rgb_10, vec3(0.22, 0.707, 0.071));
  if ((tmpvar_11 < 0.2)) {
    mediump vec4 skyboxValue_12;
    skyboxValue_12 = sky_4;
    outColor_1 = vec4((max (skyboxValue_12.w, (_NoSkyBoxMask * 
      dot (skyboxValue_12.xyz, vec3(0.59, 0.3, 0.11))
    )) * tmpvar_8));
  };
  gl_FragData[0] = outColor_1;
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
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Skybox;
uniform mediump float _NoSkyBoxMask;
uniform mediump vec4 _SunPosition;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 outColor_1;
  mediump vec2 vec_2;
  highp vec4 tex_3;
  highp vec4 sky_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Skybox, xlv_TEXCOORD0);
  sky_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex_3 = tmpvar_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_SunPosition.xy - xlv_TEXCOORD0);
  vec_2 = tmpvar_7;
  mediump float tmpvar_8;
  tmpvar_8 = clamp ((_SunPosition.w - sqrt(
    dot (vec_2, vec_2)
  )), 0.0, 1.0);
  outColor_1 = vec4(0.0, 0.0, 0.0, 0.0);
  highp vec3 tmpvar_9;
  tmpvar_9 = abs((sky_4.xyz - tex_3.xyz));
  mediump vec3 rgb_10;
  rgb_10 = tmpvar_9;
  mediump float tmpvar_11;
  tmpvar_11 = dot (rgb_10, vec3(0.22, 0.707, 0.071));
  if ((tmpvar_11 < 0.2)) {
    mediump vec4 skyboxValue_12;
    skyboxValue_12 = sky_4;
    outColor_1 = vec4((max (skyboxValue_12.w, (_NoSkyBoxMask * 
      dot (skyboxValue_12.xyz, vec3(0.59, 0.3, 0.11))
    )) * tmpvar_8));
  };
  gl_FragData[0] = outColor_1;
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
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Skybox;
uniform mediump float _NoSkyBoxMask;
uniform mediump vec4 _SunPosition;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 outColor_1;
  mediump vec2 vec_2;
  highp vec4 tex_3;
  highp vec4 sky_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Skybox, xlv_TEXCOORD0);
  sky_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex_3 = tmpvar_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (_SunPosition.xy - xlv_TEXCOORD0);
  vec_2 = tmpvar_7;
  mediump float tmpvar_8;
  tmpvar_8 = clamp ((_SunPosition.w - sqrt(
    dot (vec_2, vec_2)
  )), 0.0, 1.0);
  outColor_1 = vec4(0.0, 0.0, 0.0, 0.0);
  highp vec3 tmpvar_9;
  tmpvar_9 = abs((sky_4.xyz - tex_3.xyz));
  mediump vec3 rgb_10;
  rgb_10 = tmpvar_9;
  mediump float tmpvar_11;
  tmpvar_11 = dot (rgb_10, vec3(0.22, 0.707, 0.071));
  if ((tmpvar_11 < 0.2)) {
    mediump vec4 skyboxValue_12;
    skyboxValue_12 = sky_4;
    outColor_1 = vec4((max (skyboxValue_12.w, (_NoSkyBoxMask * 
      dot (skyboxValue_12.xyz, vec3(0.59, 0.3, 0.11))
    )) * tmpvar_8));
  };
  gl_FragData[0] = outColor_1;
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