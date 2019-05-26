//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ColorCorrectionCurves" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
_RgbTex ("_RgbTex (RGB)", 2D) = "" { }
_ZCurve ("_ZCurve (RGB)", 2D) = "" { }
_RgbDepthTex ("_RgbDepthTex (RGB)", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 55031
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _CameraDepthTexture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _CameraDepthTexture_ST.xy) + _CameraDepthTexture_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform sampler2D _MainTex;
uniform sampler2D _CameraDepthTexture;
uniform sampler2D _RgbTex;
uniform sampler2D _ZCurve;
uniform sampler2D _RgbDepthTex;
uniform lowp float _Saturation;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 depthBlue_1;
  mediump vec3 depthGreen_2;
  mediump vec3 depthRed_3;
  mediump float zval_4;
  mediump float theDepth_5;
  mediump vec3 blue_6;
  mediump vec3 green_7;
  mediump vec3 red_8;
  mediump vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  color_9 = tmpvar_10;
  mediump vec2 tmpvar_11;
  tmpvar_11.x = color_9.x;
  tmpvar_11.y = 0.125;
  lowp vec3 tmpvar_12;
  tmpvar_12 = (texture2D (_RgbTex, tmpvar_11).xyz * vec3(1.0, 0.0, 0.0));
  red_8 = tmpvar_12;
  mediump vec2 tmpvar_13;
  tmpvar_13.x = color_9.y;
  tmpvar_13.y = 0.375;
  lowp vec3 tmpvar_14;
  tmpvar_14 = (texture2D (_RgbTex, tmpvar_13).xyz * vec3(0.0, 1.0, 0.0));
  green_7 = tmpvar_14;
  mediump vec2 tmpvar_15;
  tmpvar_15.x = color_9.z;
  tmpvar_15.y = 0.625;
  lowp vec3 tmpvar_16;
  tmpvar_16 = (texture2D (_RgbTex, tmpvar_15).xyz * vec3(0.0, 0.0, 1.0));
  blue_6 = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = texture2D (_CameraDepthTexture, xlv_TEXCOORD1).x;
  theDepth_5 = tmpvar_17;
  highp float z_18;
  z_18 = theDepth_5;
  highp vec2 tmpvar_19;
  tmpvar_19.y = 0.5;
  tmpvar_19.x = (1.0/(((_ZBufferParams.x * z_18) + _ZBufferParams.y)));
  lowp float tmpvar_20;
  tmpvar_20 = texture2D (_ZCurve, tmpvar_19).x;
  zval_4 = tmpvar_20;
  mediump vec2 tmpvar_21;
  tmpvar_21.x = color_9.x;
  tmpvar_21.y = 0.125;
  lowp vec3 tmpvar_22;
  tmpvar_22 = (texture2D (_RgbDepthTex, tmpvar_21).xyz * vec3(1.0, 0.0, 0.0));
  depthRed_3 = tmpvar_22;
  mediump vec2 tmpvar_23;
  tmpvar_23.x = color_9.y;
  tmpvar_23.y = 0.375;
  lowp vec3 tmpvar_24;
  tmpvar_24 = (texture2D (_RgbDepthTex, tmpvar_23).xyz * vec3(0.0, 1.0, 0.0));
  depthGreen_2 = tmpvar_24;
  mediump vec2 tmpvar_25;
  tmpvar_25.x = color_9.z;
  tmpvar_25.y = 0.625;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (texture2D (_RgbDepthTex, tmpvar_25).xyz * vec3(0.0, 0.0, 1.0));
  depthBlue_1 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27.xyz = mix (((red_8 + green_7) + blue_6), ((depthRed_3 + depthBlue_1) + depthGreen_2), vec3(zval_4));
  tmpvar_27.w = color_9.w;
  color_9.w = tmpvar_27.w;
  color_9.xyz = mix (vec3(dot (tmpvar_27.xyz, vec3(0.22, 0.707, 0.071))), tmpvar_27.xyz, vec3(_Saturation));
  gl_FragData[0] = color_9;
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
uniform highp vec4 _CameraDepthTexture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _CameraDepthTexture_ST.xy) + _CameraDepthTexture_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform sampler2D _MainTex;
uniform sampler2D _CameraDepthTexture;
uniform sampler2D _RgbTex;
uniform sampler2D _ZCurve;
uniform sampler2D _RgbDepthTex;
uniform lowp float _Saturation;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 depthBlue_1;
  mediump vec3 depthGreen_2;
  mediump vec3 depthRed_3;
  mediump float zval_4;
  mediump float theDepth_5;
  mediump vec3 blue_6;
  mediump vec3 green_7;
  mediump vec3 red_8;
  mediump vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  color_9 = tmpvar_10;
  mediump vec2 tmpvar_11;
  tmpvar_11.x = color_9.x;
  tmpvar_11.y = 0.125;
  lowp vec3 tmpvar_12;
  tmpvar_12 = (texture2D (_RgbTex, tmpvar_11).xyz * vec3(1.0, 0.0, 0.0));
  red_8 = tmpvar_12;
  mediump vec2 tmpvar_13;
  tmpvar_13.x = color_9.y;
  tmpvar_13.y = 0.375;
  lowp vec3 tmpvar_14;
  tmpvar_14 = (texture2D (_RgbTex, tmpvar_13).xyz * vec3(0.0, 1.0, 0.0));
  green_7 = tmpvar_14;
  mediump vec2 tmpvar_15;
  tmpvar_15.x = color_9.z;
  tmpvar_15.y = 0.625;
  lowp vec3 tmpvar_16;
  tmpvar_16 = (texture2D (_RgbTex, tmpvar_15).xyz * vec3(0.0, 0.0, 1.0));
  blue_6 = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = texture2D (_CameraDepthTexture, xlv_TEXCOORD1).x;
  theDepth_5 = tmpvar_17;
  highp float z_18;
  z_18 = theDepth_5;
  highp vec2 tmpvar_19;
  tmpvar_19.y = 0.5;
  tmpvar_19.x = (1.0/(((_ZBufferParams.x * z_18) + _ZBufferParams.y)));
  lowp float tmpvar_20;
  tmpvar_20 = texture2D (_ZCurve, tmpvar_19).x;
  zval_4 = tmpvar_20;
  mediump vec2 tmpvar_21;
  tmpvar_21.x = color_9.x;
  tmpvar_21.y = 0.125;
  lowp vec3 tmpvar_22;
  tmpvar_22 = (texture2D (_RgbDepthTex, tmpvar_21).xyz * vec3(1.0, 0.0, 0.0));
  depthRed_3 = tmpvar_22;
  mediump vec2 tmpvar_23;
  tmpvar_23.x = color_9.y;
  tmpvar_23.y = 0.375;
  lowp vec3 tmpvar_24;
  tmpvar_24 = (texture2D (_RgbDepthTex, tmpvar_23).xyz * vec3(0.0, 1.0, 0.0));
  depthGreen_2 = tmpvar_24;
  mediump vec2 tmpvar_25;
  tmpvar_25.x = color_9.z;
  tmpvar_25.y = 0.625;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (texture2D (_RgbDepthTex, tmpvar_25).xyz * vec3(0.0, 0.0, 1.0));
  depthBlue_1 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27.xyz = mix (((red_8 + green_7) + blue_6), ((depthRed_3 + depthBlue_1) + depthGreen_2), vec3(zval_4));
  tmpvar_27.w = color_9.w;
  color_9.w = tmpvar_27.w;
  color_9.xyz = mix (vec3(dot (tmpvar_27.xyz, vec3(0.22, 0.707, 0.071))), tmpvar_27.xyz, vec3(_Saturation));
  gl_FragData[0] = color_9;
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
uniform highp vec4 _CameraDepthTexture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _CameraDepthTexture_ST.xy) + _CameraDepthTexture_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform sampler2D _MainTex;
uniform sampler2D _CameraDepthTexture;
uniform sampler2D _RgbTex;
uniform sampler2D _ZCurve;
uniform sampler2D _RgbDepthTex;
uniform lowp float _Saturation;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 depthBlue_1;
  mediump vec3 depthGreen_2;
  mediump vec3 depthRed_3;
  mediump float zval_4;
  mediump float theDepth_5;
  mediump vec3 blue_6;
  mediump vec3 green_7;
  mediump vec3 red_8;
  mediump vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  color_9 = tmpvar_10;
  mediump vec2 tmpvar_11;
  tmpvar_11.x = color_9.x;
  tmpvar_11.y = 0.125;
  lowp vec3 tmpvar_12;
  tmpvar_12 = (texture2D (_RgbTex, tmpvar_11).xyz * vec3(1.0, 0.0, 0.0));
  red_8 = tmpvar_12;
  mediump vec2 tmpvar_13;
  tmpvar_13.x = color_9.y;
  tmpvar_13.y = 0.375;
  lowp vec3 tmpvar_14;
  tmpvar_14 = (texture2D (_RgbTex, tmpvar_13).xyz * vec3(0.0, 1.0, 0.0));
  green_7 = tmpvar_14;
  mediump vec2 tmpvar_15;
  tmpvar_15.x = color_9.z;
  tmpvar_15.y = 0.625;
  lowp vec3 tmpvar_16;
  tmpvar_16 = (texture2D (_RgbTex, tmpvar_15).xyz * vec3(0.0, 0.0, 1.0));
  blue_6 = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = texture2D (_CameraDepthTexture, xlv_TEXCOORD1).x;
  theDepth_5 = tmpvar_17;
  highp float z_18;
  z_18 = theDepth_5;
  highp vec2 tmpvar_19;
  tmpvar_19.y = 0.5;
  tmpvar_19.x = (1.0/(((_ZBufferParams.x * z_18) + _ZBufferParams.y)));
  lowp float tmpvar_20;
  tmpvar_20 = texture2D (_ZCurve, tmpvar_19).x;
  zval_4 = tmpvar_20;
  mediump vec2 tmpvar_21;
  tmpvar_21.x = color_9.x;
  tmpvar_21.y = 0.125;
  lowp vec3 tmpvar_22;
  tmpvar_22 = (texture2D (_RgbDepthTex, tmpvar_21).xyz * vec3(1.0, 0.0, 0.0));
  depthRed_3 = tmpvar_22;
  mediump vec2 tmpvar_23;
  tmpvar_23.x = color_9.y;
  tmpvar_23.y = 0.375;
  lowp vec3 tmpvar_24;
  tmpvar_24 = (texture2D (_RgbDepthTex, tmpvar_23).xyz * vec3(0.0, 1.0, 0.0));
  depthGreen_2 = tmpvar_24;
  mediump vec2 tmpvar_25;
  tmpvar_25.x = color_9.z;
  tmpvar_25.y = 0.625;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (texture2D (_RgbDepthTex, tmpvar_25).xyz * vec3(0.0, 0.0, 1.0));
  depthBlue_1 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27.xyz = mix (((red_8 + green_7) + blue_6), ((depthRed_3 + depthBlue_1) + depthGreen_2), vec3(zval_4));
  tmpvar_27.w = color_9.w;
  color_9.w = tmpvar_27.w;
  color_9.xyz = mix (vec3(dot (tmpvar_27.xyz, vec3(0.22, 0.707, 0.071))), tmpvar_27.xyz, vec3(_Saturation));
  gl_FragData[0] = color_9;
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