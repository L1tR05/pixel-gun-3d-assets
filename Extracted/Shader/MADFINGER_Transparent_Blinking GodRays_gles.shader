//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Transparent/Blinking GodRays" {
Properties {
_MainTex ("Base texture", 2D) = "white" { }
_FadeOutDistNear ("Near fadeout dist", Float) = 10
_FadeOutDistFar ("Far fadeout dist", Float) = 10000
_Multiplier ("Color multiplier", Float) = 1
_Bias ("Bias", Float) = 0
_TimeOnDuration ("ON duration", Float) = 0.5
_TimeOffDuration ("OFF duration", Float) = 0.5
_BlinkingTimeOffsScale ("Blinking time offset scale (seconds)", Float) = 5
_SizeGrowStartDist ("Size grow start dist", Float) = 5
_SizeGrowEndDist ("Size grow end dist", Float) = 50
_MaxGrowSize ("Max grow size", Float) = 2.5
_NoiseAmount ("Noise amount (when zero, pulse wave is used)", Range(0, 0.5)) = 0
_Color ("Color", Color) = (1,1,1,1)
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 10744
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FadeOutDistNear;
uniform highp float _FadeOutDistFar;
uniform highp float _Multiplier;
uniform highp float _Bias;
uniform highp float _TimeOnDuration;
uniform highp float _TimeOffDuration;
uniform highp float _BlinkingTimeOffsScale;
uniform highp float _SizeGrowStartDist;
uniform highp float _SizeGrowEndDist;
uniform highp float _MaxGrowSize;
uniform highp float _NoiseAmount;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0;
  highp vec4 mdlPos_3;
  highp float distScale_4;
  highp float wave_5;
  highp float ffadeout_6;
  highp float nfadeout_7;
  lowp vec4 tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_Time.y + (_BlinkingTimeOffsScale * _glesColor.z));
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  highp float tmpvar_11;
  tmpvar_11 = sqrt(dot (tmpvar_10, tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = clamp ((tmpvar_11 / _FadeOutDistNear), 0.0, 1.0);
  nfadeout_7 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (1.0 - clamp ((
    max ((tmpvar_11 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  ffadeout_6 = tmpvar_13;
  highp float y_14;
  y_14 = (_TimeOnDuration + _TimeOffDuration);
  highp float tmpvar_15;
  tmpvar_15 = (tmpvar_9 / y_14);
  highp float tmpvar_16;
  tmpvar_16 = (fract(abs(tmpvar_15)) * y_14);
  highp float tmpvar_17;
  if ((tmpvar_15 >= 0.0)) {
    tmpvar_17 = tmpvar_16;
  } else {
    tmpvar_17 = -(tmpvar_16);
  };
  highp float tmpvar_18;
  tmpvar_18 = clamp ((tmpvar_17 / (_TimeOnDuration * 0.25)), 0.0, 1.0);
  highp float edge0_19;
  edge0_19 = (_TimeOnDuration * 0.75);
  highp float tmpvar_20;
  tmpvar_20 = clamp (((tmpvar_17 - edge0_19) / (_TimeOnDuration - edge0_19)), 0.0, 1.0);
  highp float tmpvar_21;
  tmpvar_21 = ((tmpvar_18 * (tmpvar_18 * 
    (3.0 - (2.0 * tmpvar_18))
  )) * (1.0 - (tmpvar_20 * 
    (tmpvar_20 * (3.0 - (2.0 * tmpvar_20)))
  )));
  wave_5 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_9 * (6.283185 / _TimeOnDuration));
  highp float tmpvar_23;
  tmpvar_23 = ((_NoiseAmount * (
    sin(tmpvar_22)
   * 
    ((0.5 * cos((
      (tmpvar_22 * 0.6366)
     + 56.7272))) + 0.5)
  )) + (1.0 - _NoiseAmount));
  highp float tmpvar_24;
  tmpvar_24 = min ((max (
    (tmpvar_11 - _SizeGrowStartDist)
  , 0.0) / _SizeGrowEndDist), 1.0);
  distScale_4 = tmpvar_24;
  highp float tmpvar_25;
  if ((_NoiseAmount < 0.01)) {
    tmpvar_25 = tmpvar_21;
  } else {
    tmpvar_25 = tmpvar_23;
  };
  distScale_4 = ((tmpvar_24 * tmpvar_24) * (_MaxGrowSize * _glesColor.w));
  wave_5 = (tmpvar_25 + _Bias);
  ffadeout_6 = (tmpvar_13 * tmpvar_13);
  nfadeout_7 = (tmpvar_12 * tmpvar_12);
  nfadeout_7 = (nfadeout_7 * nfadeout_7);
  nfadeout_7 = (nfadeout_7 * ffadeout_6);
  mdlPos_3.w = tmpvar_1.w;
  mdlPos_3.xyz = (_glesVertex.xyz + (distScale_4 * _glesNormal));
  highp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = mdlPos_3.xyz;
  tmpvar_8 = ((nfadeout_7 * _Color) * (_Multiplier * wave_5));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_26));
  xlv_TEXCOORD0 = tmpvar_2.xy;
  xlv_TEXCOORD1 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_TEXCOORD1);
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
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FadeOutDistNear;
uniform highp float _FadeOutDistFar;
uniform highp float _Multiplier;
uniform highp float _Bias;
uniform highp float _TimeOnDuration;
uniform highp float _TimeOffDuration;
uniform highp float _BlinkingTimeOffsScale;
uniform highp float _SizeGrowStartDist;
uniform highp float _SizeGrowEndDist;
uniform highp float _MaxGrowSize;
uniform highp float _NoiseAmount;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0;
  highp vec4 mdlPos_3;
  highp float distScale_4;
  highp float wave_5;
  highp float ffadeout_6;
  highp float nfadeout_7;
  lowp vec4 tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_Time.y + (_BlinkingTimeOffsScale * _glesColor.z));
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  highp float tmpvar_11;
  tmpvar_11 = sqrt(dot (tmpvar_10, tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = clamp ((tmpvar_11 / _FadeOutDistNear), 0.0, 1.0);
  nfadeout_7 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (1.0 - clamp ((
    max ((tmpvar_11 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  ffadeout_6 = tmpvar_13;
  highp float y_14;
  y_14 = (_TimeOnDuration + _TimeOffDuration);
  highp float tmpvar_15;
  tmpvar_15 = (tmpvar_9 / y_14);
  highp float tmpvar_16;
  tmpvar_16 = (fract(abs(tmpvar_15)) * y_14);
  highp float tmpvar_17;
  if ((tmpvar_15 >= 0.0)) {
    tmpvar_17 = tmpvar_16;
  } else {
    tmpvar_17 = -(tmpvar_16);
  };
  highp float tmpvar_18;
  tmpvar_18 = clamp ((tmpvar_17 / (_TimeOnDuration * 0.25)), 0.0, 1.0);
  highp float edge0_19;
  edge0_19 = (_TimeOnDuration * 0.75);
  highp float tmpvar_20;
  tmpvar_20 = clamp (((tmpvar_17 - edge0_19) / (_TimeOnDuration - edge0_19)), 0.0, 1.0);
  highp float tmpvar_21;
  tmpvar_21 = ((tmpvar_18 * (tmpvar_18 * 
    (3.0 - (2.0 * tmpvar_18))
  )) * (1.0 - (tmpvar_20 * 
    (tmpvar_20 * (3.0 - (2.0 * tmpvar_20)))
  )));
  wave_5 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_9 * (6.283185 / _TimeOnDuration));
  highp float tmpvar_23;
  tmpvar_23 = ((_NoiseAmount * (
    sin(tmpvar_22)
   * 
    ((0.5 * cos((
      (tmpvar_22 * 0.6366)
     + 56.7272))) + 0.5)
  )) + (1.0 - _NoiseAmount));
  highp float tmpvar_24;
  tmpvar_24 = min ((max (
    (tmpvar_11 - _SizeGrowStartDist)
  , 0.0) / _SizeGrowEndDist), 1.0);
  distScale_4 = tmpvar_24;
  highp float tmpvar_25;
  if ((_NoiseAmount < 0.01)) {
    tmpvar_25 = tmpvar_21;
  } else {
    tmpvar_25 = tmpvar_23;
  };
  distScale_4 = ((tmpvar_24 * tmpvar_24) * (_MaxGrowSize * _glesColor.w));
  wave_5 = (tmpvar_25 + _Bias);
  ffadeout_6 = (tmpvar_13 * tmpvar_13);
  nfadeout_7 = (tmpvar_12 * tmpvar_12);
  nfadeout_7 = (nfadeout_7 * nfadeout_7);
  nfadeout_7 = (nfadeout_7 * ffadeout_6);
  mdlPos_3.w = tmpvar_1.w;
  mdlPos_3.xyz = (_glesVertex.xyz + (distScale_4 * _glesNormal));
  highp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = mdlPos_3.xyz;
  tmpvar_8 = ((nfadeout_7 * _Color) * (_Multiplier * wave_5));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_26));
  xlv_TEXCOORD0 = tmpvar_2.xy;
  xlv_TEXCOORD1 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_TEXCOORD1);
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
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FadeOutDistNear;
uniform highp float _FadeOutDistFar;
uniform highp float _Multiplier;
uniform highp float _Bias;
uniform highp float _TimeOnDuration;
uniform highp float _TimeOffDuration;
uniform highp float _BlinkingTimeOffsScale;
uniform highp float _SizeGrowStartDist;
uniform highp float _SizeGrowEndDist;
uniform highp float _MaxGrowSize;
uniform highp float _NoiseAmount;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0;
  highp vec4 mdlPos_3;
  highp float distScale_4;
  highp float wave_5;
  highp float ffadeout_6;
  highp float nfadeout_7;
  lowp vec4 tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_Time.y + (_BlinkingTimeOffsScale * _glesColor.z));
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  highp float tmpvar_11;
  tmpvar_11 = sqrt(dot (tmpvar_10, tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = clamp ((tmpvar_11 / _FadeOutDistNear), 0.0, 1.0);
  nfadeout_7 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (1.0 - clamp ((
    max ((tmpvar_11 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  ffadeout_6 = tmpvar_13;
  highp float y_14;
  y_14 = (_TimeOnDuration + _TimeOffDuration);
  highp float tmpvar_15;
  tmpvar_15 = (tmpvar_9 / y_14);
  highp float tmpvar_16;
  tmpvar_16 = (fract(abs(tmpvar_15)) * y_14);
  highp float tmpvar_17;
  if ((tmpvar_15 >= 0.0)) {
    tmpvar_17 = tmpvar_16;
  } else {
    tmpvar_17 = -(tmpvar_16);
  };
  highp float tmpvar_18;
  tmpvar_18 = clamp ((tmpvar_17 / (_TimeOnDuration * 0.25)), 0.0, 1.0);
  highp float edge0_19;
  edge0_19 = (_TimeOnDuration * 0.75);
  highp float tmpvar_20;
  tmpvar_20 = clamp (((tmpvar_17 - edge0_19) / (_TimeOnDuration - edge0_19)), 0.0, 1.0);
  highp float tmpvar_21;
  tmpvar_21 = ((tmpvar_18 * (tmpvar_18 * 
    (3.0 - (2.0 * tmpvar_18))
  )) * (1.0 - (tmpvar_20 * 
    (tmpvar_20 * (3.0 - (2.0 * tmpvar_20)))
  )));
  wave_5 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_9 * (6.283185 / _TimeOnDuration));
  highp float tmpvar_23;
  tmpvar_23 = ((_NoiseAmount * (
    sin(tmpvar_22)
   * 
    ((0.5 * cos((
      (tmpvar_22 * 0.6366)
     + 56.7272))) + 0.5)
  )) + (1.0 - _NoiseAmount));
  highp float tmpvar_24;
  tmpvar_24 = min ((max (
    (tmpvar_11 - _SizeGrowStartDist)
  , 0.0) / _SizeGrowEndDist), 1.0);
  distScale_4 = tmpvar_24;
  highp float tmpvar_25;
  if ((_NoiseAmount < 0.01)) {
    tmpvar_25 = tmpvar_21;
  } else {
    tmpvar_25 = tmpvar_23;
  };
  distScale_4 = ((tmpvar_24 * tmpvar_24) * (_MaxGrowSize * _glesColor.w));
  wave_5 = (tmpvar_25 + _Bias);
  ffadeout_6 = (tmpvar_13 * tmpvar_13);
  nfadeout_7 = (tmpvar_12 * tmpvar_12);
  nfadeout_7 = (nfadeout_7 * nfadeout_7);
  nfadeout_7 = (nfadeout_7 * ffadeout_6);
  mdlPos_3.w = tmpvar_1.w;
  mdlPos_3.xyz = (_glesVertex.xyz + (distScale_4 * _glesNormal));
  highp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = mdlPos_3.xyz;
  tmpvar_8 = ((nfadeout_7 * _Color) * (_Multiplier * wave_5));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_26));
  xlv_TEXCOORD0 = tmpvar_2.xy;
  xlv_TEXCOORD1 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_TEXCOORD1);
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