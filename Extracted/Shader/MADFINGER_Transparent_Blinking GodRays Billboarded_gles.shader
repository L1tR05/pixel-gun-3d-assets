//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Transparent/Blinking GodRays Billboarded" {
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
_VerticalBillboarding ("Vertical billboarding amount", Range(0, 1)) = 1
_ViewerOffset ("Viewer offset", Float) = 0
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
  GpuProgramID 29582
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
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
uniform highp float _VerticalBillboarding;
uniform highp float _ViewerOffset;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0;
  highp float wave_2;
  highp vec3 BBLocalPos_3;
  highp vec3 localDir_4;
  lowp vec4 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6.z = 0.0;
  tmpvar_6.xy = (vec2(0.5, 0.5) - _glesColor.xy);
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * _glesMultiTexCoord1.xyy);
  highp vec3 tmpvar_8;
  tmpvar_8 = (_glesVertex.xyz + tmpvar_7);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_WorldToObject * tmpvar_9).xyz - tmpvar_8);
  localDir_4.xz = tmpvar_10.xz;
  localDir_4.y = (tmpvar_10.y * _VerticalBillboarding);
  highp float tmpvar_11;
  tmpvar_11 = sqrt(dot (localDir_4, localDir_4));
  highp vec3 dir_12;
  dir_12 = (localDir_4 / tmpvar_11);
  highp float tmpvar_13;
  tmpvar_13 = abs(dir_12.y);
  highp vec3 tmpvar_14;
  if ((tmpvar_13 > 0.999)) {
    tmpvar_14 = vec3(0.0, 0.0, 1.0);
  } else {
    tmpvar_14 = vec3(0.0, 1.0, 0.0);
  };
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize(((tmpvar_14.yzx * dir_12.zxy) - (tmpvar_14.zxy * dir_12.yzx)));
  highp vec3 tmpvar_16;
  tmpvar_16 = ((dir_12.yzx * tmpvar_15.zxy) - (dir_12.zxy * tmpvar_15.yzx));
  highp float tmpvar_17;
  tmpvar_17 = min ((max (
    (tmpvar_11 - _SizeGrowStartDist)
  , 0.0) / _SizeGrowEndDist), 1.0);
  BBLocalPos_3 = (((tmpvar_8 - 
    ((tmpvar_15 * tmpvar_7.x) + (tmpvar_16 * tmpvar_7.y))
  ) + (
    ((tmpvar_15 * _glesNormal.x) + (tmpvar_16 * _glesNormal.y))
   * 
    ((tmpvar_17 * tmpvar_17) * (_MaxGrowSize * _glesColor.w))
  )) + (_ViewerOffset * localDir_4));
  highp float tmpvar_18;
  tmpvar_18 = (_Time.y + (_BlinkingTimeOffsScale * _glesColor.z));
  highp float y_19;
  y_19 = (_TimeOnDuration + _TimeOffDuration);
  highp float tmpvar_20;
  tmpvar_20 = (tmpvar_18 / y_19);
  highp float tmpvar_21;
  tmpvar_21 = (fract(abs(tmpvar_20)) * y_19);
  highp float tmpvar_22;
  if ((tmpvar_20 >= 0.0)) {
    tmpvar_22 = tmpvar_21;
  } else {
    tmpvar_22 = -(tmpvar_21);
  };
  highp float tmpvar_23;
  tmpvar_23 = clamp ((tmpvar_22 / (_TimeOnDuration * 0.25)), 0.0, 1.0);
  highp float edge0_24;
  edge0_24 = (_TimeOnDuration * 0.75);
  highp float tmpvar_25;
  tmpvar_25 = clamp (((tmpvar_22 - edge0_24) / (_TimeOnDuration - edge0_24)), 0.0, 1.0);
  highp float tmpvar_26;
  tmpvar_26 = ((tmpvar_23 * (tmpvar_23 * 
    (3.0 - (2.0 * tmpvar_23))
  )) * (1.0 - (tmpvar_25 * 
    (tmpvar_25 * (3.0 - (2.0 * tmpvar_25)))
  )));
  wave_2 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_18 * (6.283185 / _TimeOnDuration));
  highp float tmpvar_28;
  tmpvar_28 = ((_NoiseAmount * (
    sin(tmpvar_27)
   * 
    ((0.5 * cos((
      (tmpvar_27 * 0.6366)
     + 56.7272))) + 0.5)
  )) + (1.0 - _NoiseAmount));
  highp float tmpvar_29;
  if ((_NoiseAmount < 0.01)) {
    tmpvar_29 = tmpvar_26;
  } else {
    tmpvar_29 = tmpvar_28;
  };
  wave_2 = (tmpvar_29 + _Bias);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = BBLocalPos_3;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_30.xyz;
  highp float nfadeout_32;
  highp float tmpvar_33;
  tmpvar_33 = clamp ((tmpvar_11 / _FadeOutDistNear), 0.0, 1.0);
  highp float tmpvar_34;
  tmpvar_34 = (1.0 - clamp ((
    max ((tmpvar_11 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  nfadeout_32 = (tmpvar_33 * tmpvar_33);
  nfadeout_32 = (nfadeout_32 * nfadeout_32);
  nfadeout_32 = (nfadeout_32 * (tmpvar_34 * tmpvar_34));
  tmpvar_5 = ((nfadeout_32 * _Color) * (_Multiplier * wave_2));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_31));
  xlv_TEXCOORD0 = tmpvar_1.xy;
  xlv_TEXCOORD1 = tmpvar_5;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
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
uniform highp float _VerticalBillboarding;
uniform highp float _ViewerOffset;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0;
  highp float wave_2;
  highp vec3 BBLocalPos_3;
  highp vec3 localDir_4;
  lowp vec4 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6.z = 0.0;
  tmpvar_6.xy = (vec2(0.5, 0.5) - _glesColor.xy);
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * _glesMultiTexCoord1.xyy);
  highp vec3 tmpvar_8;
  tmpvar_8 = (_glesVertex.xyz + tmpvar_7);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_WorldToObject * tmpvar_9).xyz - tmpvar_8);
  localDir_4.xz = tmpvar_10.xz;
  localDir_4.y = (tmpvar_10.y * _VerticalBillboarding);
  highp float tmpvar_11;
  tmpvar_11 = sqrt(dot (localDir_4, localDir_4));
  highp vec3 dir_12;
  dir_12 = (localDir_4 / tmpvar_11);
  highp float tmpvar_13;
  tmpvar_13 = abs(dir_12.y);
  highp vec3 tmpvar_14;
  if ((tmpvar_13 > 0.999)) {
    tmpvar_14 = vec3(0.0, 0.0, 1.0);
  } else {
    tmpvar_14 = vec3(0.0, 1.0, 0.0);
  };
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize(((tmpvar_14.yzx * dir_12.zxy) - (tmpvar_14.zxy * dir_12.yzx)));
  highp vec3 tmpvar_16;
  tmpvar_16 = ((dir_12.yzx * tmpvar_15.zxy) - (dir_12.zxy * tmpvar_15.yzx));
  highp float tmpvar_17;
  tmpvar_17 = min ((max (
    (tmpvar_11 - _SizeGrowStartDist)
  , 0.0) / _SizeGrowEndDist), 1.0);
  BBLocalPos_3 = (((tmpvar_8 - 
    ((tmpvar_15 * tmpvar_7.x) + (tmpvar_16 * tmpvar_7.y))
  ) + (
    ((tmpvar_15 * _glesNormal.x) + (tmpvar_16 * _glesNormal.y))
   * 
    ((tmpvar_17 * tmpvar_17) * (_MaxGrowSize * _glesColor.w))
  )) + (_ViewerOffset * localDir_4));
  highp float tmpvar_18;
  tmpvar_18 = (_Time.y + (_BlinkingTimeOffsScale * _glesColor.z));
  highp float y_19;
  y_19 = (_TimeOnDuration + _TimeOffDuration);
  highp float tmpvar_20;
  tmpvar_20 = (tmpvar_18 / y_19);
  highp float tmpvar_21;
  tmpvar_21 = (fract(abs(tmpvar_20)) * y_19);
  highp float tmpvar_22;
  if ((tmpvar_20 >= 0.0)) {
    tmpvar_22 = tmpvar_21;
  } else {
    tmpvar_22 = -(tmpvar_21);
  };
  highp float tmpvar_23;
  tmpvar_23 = clamp ((tmpvar_22 / (_TimeOnDuration * 0.25)), 0.0, 1.0);
  highp float edge0_24;
  edge0_24 = (_TimeOnDuration * 0.75);
  highp float tmpvar_25;
  tmpvar_25 = clamp (((tmpvar_22 - edge0_24) / (_TimeOnDuration - edge0_24)), 0.0, 1.0);
  highp float tmpvar_26;
  tmpvar_26 = ((tmpvar_23 * (tmpvar_23 * 
    (3.0 - (2.0 * tmpvar_23))
  )) * (1.0 - (tmpvar_25 * 
    (tmpvar_25 * (3.0 - (2.0 * tmpvar_25)))
  )));
  wave_2 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_18 * (6.283185 / _TimeOnDuration));
  highp float tmpvar_28;
  tmpvar_28 = ((_NoiseAmount * (
    sin(tmpvar_27)
   * 
    ((0.5 * cos((
      (tmpvar_27 * 0.6366)
     + 56.7272))) + 0.5)
  )) + (1.0 - _NoiseAmount));
  highp float tmpvar_29;
  if ((_NoiseAmount < 0.01)) {
    tmpvar_29 = tmpvar_26;
  } else {
    tmpvar_29 = tmpvar_28;
  };
  wave_2 = (tmpvar_29 + _Bias);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = BBLocalPos_3;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_30.xyz;
  highp float nfadeout_32;
  highp float tmpvar_33;
  tmpvar_33 = clamp ((tmpvar_11 / _FadeOutDistNear), 0.0, 1.0);
  highp float tmpvar_34;
  tmpvar_34 = (1.0 - clamp ((
    max ((tmpvar_11 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  nfadeout_32 = (tmpvar_33 * tmpvar_33);
  nfadeout_32 = (nfadeout_32 * nfadeout_32);
  nfadeout_32 = (nfadeout_32 * (tmpvar_34 * tmpvar_34));
  tmpvar_5 = ((nfadeout_32 * _Color) * (_Multiplier * wave_2));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_31));
  xlv_TEXCOORD0 = tmpvar_1.xy;
  xlv_TEXCOORD1 = tmpvar_5;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
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
uniform highp float _VerticalBillboarding;
uniform highp float _ViewerOffset;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0;
  highp float wave_2;
  highp vec3 BBLocalPos_3;
  highp vec3 localDir_4;
  lowp vec4 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_6.z = 0.0;
  tmpvar_6.xy = (vec2(0.5, 0.5) - _glesColor.xy);
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * _glesMultiTexCoord1.xyy);
  highp vec3 tmpvar_8;
  tmpvar_8 = (_glesVertex.xyz + tmpvar_7);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((unity_WorldToObject * tmpvar_9).xyz - tmpvar_8);
  localDir_4.xz = tmpvar_10.xz;
  localDir_4.y = (tmpvar_10.y * _VerticalBillboarding);
  highp float tmpvar_11;
  tmpvar_11 = sqrt(dot (localDir_4, localDir_4));
  highp vec3 dir_12;
  dir_12 = (localDir_4 / tmpvar_11);
  highp float tmpvar_13;
  tmpvar_13 = abs(dir_12.y);
  highp vec3 tmpvar_14;
  if ((tmpvar_13 > 0.999)) {
    tmpvar_14 = vec3(0.0, 0.0, 1.0);
  } else {
    tmpvar_14 = vec3(0.0, 1.0, 0.0);
  };
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize(((tmpvar_14.yzx * dir_12.zxy) - (tmpvar_14.zxy * dir_12.yzx)));
  highp vec3 tmpvar_16;
  tmpvar_16 = ((dir_12.yzx * tmpvar_15.zxy) - (dir_12.zxy * tmpvar_15.yzx));
  highp float tmpvar_17;
  tmpvar_17 = min ((max (
    (tmpvar_11 - _SizeGrowStartDist)
  , 0.0) / _SizeGrowEndDist), 1.0);
  BBLocalPos_3 = (((tmpvar_8 - 
    ((tmpvar_15 * tmpvar_7.x) + (tmpvar_16 * tmpvar_7.y))
  ) + (
    ((tmpvar_15 * _glesNormal.x) + (tmpvar_16 * _glesNormal.y))
   * 
    ((tmpvar_17 * tmpvar_17) * (_MaxGrowSize * _glesColor.w))
  )) + (_ViewerOffset * localDir_4));
  highp float tmpvar_18;
  tmpvar_18 = (_Time.y + (_BlinkingTimeOffsScale * _glesColor.z));
  highp float y_19;
  y_19 = (_TimeOnDuration + _TimeOffDuration);
  highp float tmpvar_20;
  tmpvar_20 = (tmpvar_18 / y_19);
  highp float tmpvar_21;
  tmpvar_21 = (fract(abs(tmpvar_20)) * y_19);
  highp float tmpvar_22;
  if ((tmpvar_20 >= 0.0)) {
    tmpvar_22 = tmpvar_21;
  } else {
    tmpvar_22 = -(tmpvar_21);
  };
  highp float tmpvar_23;
  tmpvar_23 = clamp ((tmpvar_22 / (_TimeOnDuration * 0.25)), 0.0, 1.0);
  highp float edge0_24;
  edge0_24 = (_TimeOnDuration * 0.75);
  highp float tmpvar_25;
  tmpvar_25 = clamp (((tmpvar_22 - edge0_24) / (_TimeOnDuration - edge0_24)), 0.0, 1.0);
  highp float tmpvar_26;
  tmpvar_26 = ((tmpvar_23 * (tmpvar_23 * 
    (3.0 - (2.0 * tmpvar_23))
  )) * (1.0 - (tmpvar_25 * 
    (tmpvar_25 * (3.0 - (2.0 * tmpvar_25)))
  )));
  wave_2 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_18 * (6.283185 / _TimeOnDuration));
  highp float tmpvar_28;
  tmpvar_28 = ((_NoiseAmount * (
    sin(tmpvar_27)
   * 
    ((0.5 * cos((
      (tmpvar_27 * 0.6366)
     + 56.7272))) + 0.5)
  )) + (1.0 - _NoiseAmount));
  highp float tmpvar_29;
  if ((_NoiseAmount < 0.01)) {
    tmpvar_29 = tmpvar_26;
  } else {
    tmpvar_29 = tmpvar_28;
  };
  wave_2 = (tmpvar_29 + _Bias);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = BBLocalPos_3;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_30.xyz;
  highp float nfadeout_32;
  highp float tmpvar_33;
  tmpvar_33 = clamp ((tmpvar_11 / _FadeOutDistNear), 0.0, 1.0);
  highp float tmpvar_34;
  tmpvar_34 = (1.0 - clamp ((
    max ((tmpvar_11 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  nfadeout_32 = (tmpvar_33 * tmpvar_33);
  nfadeout_32 = (nfadeout_32 * nfadeout_32);
  nfadeout_32 = (nfadeout_32 * (tmpvar_34 * tmpvar_34));
  tmpvar_5 = ((nfadeout_32 * _Color) * (_Multiplier * wave_2));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_31));
  xlv_TEXCOORD0 = tmpvar_1.xy;
  xlv_TEXCOORD1 = tmpvar_5;
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