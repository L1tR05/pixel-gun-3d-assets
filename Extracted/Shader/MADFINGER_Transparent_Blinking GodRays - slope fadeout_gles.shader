//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Transparent/Blinking GodRays - slope fadeout" {
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
  GpuProgramID 19628
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
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
  highp float wave_3;
  highp float ffadeout_4;
  highp float nfadeout_5;
  lowp vec4 tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = (_Time.y + (_BlinkingTimeOffsScale * _glesColor.z));
  highp vec3 tmpvar_8;
  tmpvar_8 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  highp float tmpvar_9;
  tmpvar_9 = sqrt(dot (tmpvar_8, tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = clamp ((tmpvar_9 / _FadeOutDistNear), 0.0, 1.0);
  nfadeout_5 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (1.0 - clamp ((
    max ((tmpvar_9 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  ffadeout_4 = tmpvar_11;
  highp float y_12;
  y_12 = (_TimeOnDuration + _TimeOffDuration);
  highp float tmpvar_13;
  tmpvar_13 = (tmpvar_7 / y_12);
  highp float tmpvar_14;
  tmpvar_14 = (fract(abs(tmpvar_13)) * y_12);
  highp float tmpvar_15;
  if ((tmpvar_13 >= 0.0)) {
    tmpvar_15 = tmpvar_14;
  } else {
    tmpvar_15 = -(tmpvar_14);
  };
  highp float tmpvar_16;
  tmpvar_16 = clamp ((tmpvar_15 / (_TimeOnDuration * 0.25)), 0.0, 1.0);
  highp float edge0_17;
  edge0_17 = (_TimeOnDuration * 0.75);
  highp float tmpvar_18;
  tmpvar_18 = clamp (((tmpvar_15 - edge0_17) / (_TimeOnDuration - edge0_17)), 0.0, 1.0);
  highp float tmpvar_19;
  tmpvar_19 = ((tmpvar_16 * (tmpvar_16 * 
    (3.0 - (2.0 * tmpvar_16))
  )) * (1.0 - (tmpvar_18 * 
    (tmpvar_18 * (3.0 - (2.0 * tmpvar_18)))
  )));
  wave_3 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = (tmpvar_7 * (6.283185 / _TimeOnDuration));
  highp float tmpvar_21;
  tmpvar_21 = ((_NoiseAmount * (
    sin(tmpvar_20)
   * 
    ((0.5 * cos((
      (tmpvar_20 * 0.6366)
     + 56.7272))) + 0.5)
  )) + (1.0 - _NoiseAmount));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp float tmpvar_23;
  tmpvar_23 = clamp (abs(dot (
    normalize((tmpvar_22 * _glesNormal))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz))
  )), 0.0, 1.0);
  highp float tmpvar_24;
  if ((_NoiseAmount < 0.01)) {
    tmpvar_24 = tmpvar_19;
  } else {
    tmpvar_24 = tmpvar_21;
  };
  wave_3 = (tmpvar_24 + _Bias);
  ffadeout_4 = (tmpvar_11 * tmpvar_11);
  nfadeout_5 = (tmpvar_10 * tmpvar_10);
  nfadeout_5 = (nfadeout_5 * nfadeout_5);
  nfadeout_5 = (nfadeout_5 * ffadeout_4);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = tmpvar_1.xyz;
  tmpvar_6 = ((nfadeout_5 * _Color) * ((_Multiplier * wave_3) * tmpvar_23));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_25));
  xlv_TEXCOORD0 = tmpvar_2.xy;
  xlv_TEXCOORD1 = tmpvar_6;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
  highp float wave_3;
  highp float ffadeout_4;
  highp float nfadeout_5;
  lowp vec4 tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = (_Time.y + (_BlinkingTimeOffsScale * _glesColor.z));
  highp vec3 tmpvar_8;
  tmpvar_8 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  highp float tmpvar_9;
  tmpvar_9 = sqrt(dot (tmpvar_8, tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = clamp ((tmpvar_9 / _FadeOutDistNear), 0.0, 1.0);
  nfadeout_5 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (1.0 - clamp ((
    max ((tmpvar_9 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  ffadeout_4 = tmpvar_11;
  highp float y_12;
  y_12 = (_TimeOnDuration + _TimeOffDuration);
  highp float tmpvar_13;
  tmpvar_13 = (tmpvar_7 / y_12);
  highp float tmpvar_14;
  tmpvar_14 = (fract(abs(tmpvar_13)) * y_12);
  highp float tmpvar_15;
  if ((tmpvar_13 >= 0.0)) {
    tmpvar_15 = tmpvar_14;
  } else {
    tmpvar_15 = -(tmpvar_14);
  };
  highp float tmpvar_16;
  tmpvar_16 = clamp ((tmpvar_15 / (_TimeOnDuration * 0.25)), 0.0, 1.0);
  highp float edge0_17;
  edge0_17 = (_TimeOnDuration * 0.75);
  highp float tmpvar_18;
  tmpvar_18 = clamp (((tmpvar_15 - edge0_17) / (_TimeOnDuration - edge0_17)), 0.0, 1.0);
  highp float tmpvar_19;
  tmpvar_19 = ((tmpvar_16 * (tmpvar_16 * 
    (3.0 - (2.0 * tmpvar_16))
  )) * (1.0 - (tmpvar_18 * 
    (tmpvar_18 * (3.0 - (2.0 * tmpvar_18)))
  )));
  wave_3 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = (tmpvar_7 * (6.283185 / _TimeOnDuration));
  highp float tmpvar_21;
  tmpvar_21 = ((_NoiseAmount * (
    sin(tmpvar_20)
   * 
    ((0.5 * cos((
      (tmpvar_20 * 0.6366)
     + 56.7272))) + 0.5)
  )) + (1.0 - _NoiseAmount));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp float tmpvar_23;
  tmpvar_23 = clamp (abs(dot (
    normalize((tmpvar_22 * _glesNormal))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz))
  )), 0.0, 1.0);
  highp float tmpvar_24;
  if ((_NoiseAmount < 0.01)) {
    tmpvar_24 = tmpvar_19;
  } else {
    tmpvar_24 = tmpvar_21;
  };
  wave_3 = (tmpvar_24 + _Bias);
  ffadeout_4 = (tmpvar_11 * tmpvar_11);
  nfadeout_5 = (tmpvar_10 * tmpvar_10);
  nfadeout_5 = (nfadeout_5 * nfadeout_5);
  nfadeout_5 = (nfadeout_5 * ffadeout_4);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = tmpvar_1.xyz;
  tmpvar_6 = ((nfadeout_5 * _Color) * ((_Multiplier * wave_3) * tmpvar_23));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_25));
  xlv_TEXCOORD0 = tmpvar_2.xy;
  xlv_TEXCOORD1 = tmpvar_6;
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
uniform highp vec3 _WorldSpaceCameraPos;
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
  highp float wave_3;
  highp float ffadeout_4;
  highp float nfadeout_5;
  lowp vec4 tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = (_Time.y + (_BlinkingTimeOffsScale * _glesColor.z));
  highp vec3 tmpvar_8;
  tmpvar_8 = ((unity_MatrixV * unity_ObjectToWorld) * _glesVertex).xyz;
  highp float tmpvar_9;
  tmpvar_9 = sqrt(dot (tmpvar_8, tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = clamp ((tmpvar_9 / _FadeOutDistNear), 0.0, 1.0);
  nfadeout_5 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (1.0 - clamp ((
    max ((tmpvar_9 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  ffadeout_4 = tmpvar_11;
  highp float y_12;
  y_12 = (_TimeOnDuration + _TimeOffDuration);
  highp float tmpvar_13;
  tmpvar_13 = (tmpvar_7 / y_12);
  highp float tmpvar_14;
  tmpvar_14 = (fract(abs(tmpvar_13)) * y_12);
  highp float tmpvar_15;
  if ((tmpvar_13 >= 0.0)) {
    tmpvar_15 = tmpvar_14;
  } else {
    tmpvar_15 = -(tmpvar_14);
  };
  highp float tmpvar_16;
  tmpvar_16 = clamp ((tmpvar_15 / (_TimeOnDuration * 0.25)), 0.0, 1.0);
  highp float edge0_17;
  edge0_17 = (_TimeOnDuration * 0.75);
  highp float tmpvar_18;
  tmpvar_18 = clamp (((tmpvar_15 - edge0_17) / (_TimeOnDuration - edge0_17)), 0.0, 1.0);
  highp float tmpvar_19;
  tmpvar_19 = ((tmpvar_16 * (tmpvar_16 * 
    (3.0 - (2.0 * tmpvar_16))
  )) * (1.0 - (tmpvar_18 * 
    (tmpvar_18 * (3.0 - (2.0 * tmpvar_18)))
  )));
  wave_3 = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = (tmpvar_7 * (6.283185 / _TimeOnDuration));
  highp float tmpvar_21;
  tmpvar_21 = ((_NoiseAmount * (
    sin(tmpvar_20)
   * 
    ((0.5 * cos((
      (tmpvar_20 * 0.6366)
     + 56.7272))) + 0.5)
  )) + (1.0 - _NoiseAmount));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp float tmpvar_23;
  tmpvar_23 = clamp (abs(dot (
    normalize((tmpvar_22 * _glesNormal))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * _glesVertex).xyz))
  )), 0.0, 1.0);
  highp float tmpvar_24;
  if ((_NoiseAmount < 0.01)) {
    tmpvar_24 = tmpvar_19;
  } else {
    tmpvar_24 = tmpvar_21;
  };
  wave_3 = (tmpvar_24 + _Bias);
  ffadeout_4 = (tmpvar_11 * tmpvar_11);
  nfadeout_5 = (tmpvar_10 * tmpvar_10);
  nfadeout_5 = (nfadeout_5 * nfadeout_5);
  nfadeout_5 = (nfadeout_5 * ffadeout_4);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = tmpvar_1.xyz;
  tmpvar_6 = ((nfadeout_5 * _Color) * ((_Multiplier * wave_3) * tmpvar_23));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_25));
  xlv_TEXCOORD0 = tmpvar_2.xy;
  xlv_TEXCOORD1 = tmpvar_6;
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