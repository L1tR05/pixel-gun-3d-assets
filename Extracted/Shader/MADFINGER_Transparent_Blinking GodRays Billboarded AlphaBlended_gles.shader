//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Transparent/Blinking GodRays Billboarded AlphaBlended" {
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
  GpuProgramID 42725
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
uniform highp vec4 _MainTex_ST;
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
  highp float wave_1;
  highp vec3 BBLocalPos_2;
  highp vec3 localDir_3;
  lowp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.z = 0.0;
  tmpvar_5.xy = (vec2(0.5, 0.5) - _glesColor.xy);
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * _glesMultiTexCoord1.xyy);
  highp vec3 tmpvar_7;
  tmpvar_7 = (_glesVertex.xyz + tmpvar_6);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = ((unity_WorldToObject * tmpvar_8).xyz - tmpvar_7);
  localDir_3.xz = tmpvar_9.xz;
  localDir_3.y = (tmpvar_9.y * _VerticalBillboarding);
  highp float tmpvar_10;
  tmpvar_10 = sqrt(dot (localDir_3, localDir_3));
  highp vec3 dir_11;
  dir_11 = (localDir_3 / tmpvar_10);
  highp float tmpvar_12;
  tmpvar_12 = abs(dir_11.y);
  highp vec3 tmpvar_13;
  if ((tmpvar_12 > 0.999)) {
    tmpvar_13 = vec3(0.0, 0.0, 1.0);
  } else {
    tmpvar_13 = vec3(0.0, 1.0, 0.0);
  };
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize(((tmpvar_13.yzx * dir_11.zxy) - (tmpvar_13.zxy * dir_11.yzx)));
  highp vec3 tmpvar_15;
  tmpvar_15 = ((dir_11.yzx * tmpvar_14.zxy) - (dir_11.zxy * tmpvar_14.yzx));
  highp float tmpvar_16;
  tmpvar_16 = min ((max (
    (tmpvar_10 - _SizeGrowStartDist)
  , 0.0) / _SizeGrowEndDist), 1.0);
  BBLocalPos_2 = (((tmpvar_7 - 
    ((tmpvar_14 * tmpvar_6.x) + (tmpvar_15 * tmpvar_6.y))
  ) + (
    ((tmpvar_14 * _glesNormal.x) + (tmpvar_15 * _glesNormal.y))
   * 
    ((tmpvar_16 * tmpvar_16) * (_MaxGrowSize * _glesColor.w))
  )) + (_ViewerOffset * localDir_3));
  highp float tmpvar_17;
  tmpvar_17 = (_Time.y + (_BlinkingTimeOffsScale * _glesColor.z));
  highp float y_18;
  y_18 = (_TimeOnDuration + _TimeOffDuration);
  highp float tmpvar_19;
  tmpvar_19 = (tmpvar_17 / y_18);
  highp float tmpvar_20;
  tmpvar_20 = (fract(abs(tmpvar_19)) * y_18);
  highp float tmpvar_21;
  if ((tmpvar_19 >= 0.0)) {
    tmpvar_21 = tmpvar_20;
  } else {
    tmpvar_21 = -(tmpvar_20);
  };
  highp float tmpvar_22;
  tmpvar_22 = clamp ((tmpvar_21 / (_TimeOnDuration * 0.25)), 0.0, 1.0);
  highp float edge0_23;
  edge0_23 = (_TimeOnDuration * 0.75);
  highp float tmpvar_24;
  tmpvar_24 = clamp (((tmpvar_21 - edge0_23) / (_TimeOnDuration - edge0_23)), 0.0, 1.0);
  highp float tmpvar_25;
  tmpvar_25 = ((tmpvar_22 * (tmpvar_22 * 
    (3.0 - (2.0 * tmpvar_22))
  )) * (1.0 - (tmpvar_24 * 
    (tmpvar_24 * (3.0 - (2.0 * tmpvar_24)))
  )));
  wave_1 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (tmpvar_17 * (6.283185 / _TimeOnDuration));
  highp float tmpvar_27;
  tmpvar_27 = ((_NoiseAmount * (
    sin(tmpvar_26)
   * 
    ((0.5 * cos((
      (tmpvar_26 * 0.6366)
     + 56.7272))) + 0.5)
  )) + (1.0 - _NoiseAmount));
  highp float tmpvar_28;
  if ((_NoiseAmount < 0.01)) {
    tmpvar_28 = tmpvar_25;
  } else {
    tmpvar_28 = tmpvar_27;
  };
  wave_1 = (tmpvar_28 + _Bias);
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = BBLocalPos_2;
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_29.xyz;
  highp float nfadeout_31;
  highp float tmpvar_32;
  tmpvar_32 = clamp ((tmpvar_10 / _FadeOutDistNear), 0.0, 1.0);
  highp float tmpvar_33;
  tmpvar_33 = (1.0 - clamp ((
    max ((tmpvar_10 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  nfadeout_31 = (tmpvar_32 * tmpvar_32);
  nfadeout_31 = (nfadeout_31 * nfadeout_31);
  nfadeout_31 = (nfadeout_31 * (tmpvar_33 * tmpvar_33));
  tmpvar_4 = ((nfadeout_31 * _Color) * (_Multiplier * wave_1));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_30));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_4;
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
uniform highp vec4 _MainTex_ST;
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
  highp float wave_1;
  highp vec3 BBLocalPos_2;
  highp vec3 localDir_3;
  lowp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.z = 0.0;
  tmpvar_5.xy = (vec2(0.5, 0.5) - _glesColor.xy);
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * _glesMultiTexCoord1.xyy);
  highp vec3 tmpvar_7;
  tmpvar_7 = (_glesVertex.xyz + tmpvar_6);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = ((unity_WorldToObject * tmpvar_8).xyz - tmpvar_7);
  localDir_3.xz = tmpvar_9.xz;
  localDir_3.y = (tmpvar_9.y * _VerticalBillboarding);
  highp float tmpvar_10;
  tmpvar_10 = sqrt(dot (localDir_3, localDir_3));
  highp vec3 dir_11;
  dir_11 = (localDir_3 / tmpvar_10);
  highp float tmpvar_12;
  tmpvar_12 = abs(dir_11.y);
  highp vec3 tmpvar_13;
  if ((tmpvar_12 > 0.999)) {
    tmpvar_13 = vec3(0.0, 0.0, 1.0);
  } else {
    tmpvar_13 = vec3(0.0, 1.0, 0.0);
  };
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize(((tmpvar_13.yzx * dir_11.zxy) - (tmpvar_13.zxy * dir_11.yzx)));
  highp vec3 tmpvar_15;
  tmpvar_15 = ((dir_11.yzx * tmpvar_14.zxy) - (dir_11.zxy * tmpvar_14.yzx));
  highp float tmpvar_16;
  tmpvar_16 = min ((max (
    (tmpvar_10 - _SizeGrowStartDist)
  , 0.0) / _SizeGrowEndDist), 1.0);
  BBLocalPos_2 = (((tmpvar_7 - 
    ((tmpvar_14 * tmpvar_6.x) + (tmpvar_15 * tmpvar_6.y))
  ) + (
    ((tmpvar_14 * _glesNormal.x) + (tmpvar_15 * _glesNormal.y))
   * 
    ((tmpvar_16 * tmpvar_16) * (_MaxGrowSize * _glesColor.w))
  )) + (_ViewerOffset * localDir_3));
  highp float tmpvar_17;
  tmpvar_17 = (_Time.y + (_BlinkingTimeOffsScale * _glesColor.z));
  highp float y_18;
  y_18 = (_TimeOnDuration + _TimeOffDuration);
  highp float tmpvar_19;
  tmpvar_19 = (tmpvar_17 / y_18);
  highp float tmpvar_20;
  tmpvar_20 = (fract(abs(tmpvar_19)) * y_18);
  highp float tmpvar_21;
  if ((tmpvar_19 >= 0.0)) {
    tmpvar_21 = tmpvar_20;
  } else {
    tmpvar_21 = -(tmpvar_20);
  };
  highp float tmpvar_22;
  tmpvar_22 = clamp ((tmpvar_21 / (_TimeOnDuration * 0.25)), 0.0, 1.0);
  highp float edge0_23;
  edge0_23 = (_TimeOnDuration * 0.75);
  highp float tmpvar_24;
  tmpvar_24 = clamp (((tmpvar_21 - edge0_23) / (_TimeOnDuration - edge0_23)), 0.0, 1.0);
  highp float tmpvar_25;
  tmpvar_25 = ((tmpvar_22 * (tmpvar_22 * 
    (3.0 - (2.0 * tmpvar_22))
  )) * (1.0 - (tmpvar_24 * 
    (tmpvar_24 * (3.0 - (2.0 * tmpvar_24)))
  )));
  wave_1 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (tmpvar_17 * (6.283185 / _TimeOnDuration));
  highp float tmpvar_27;
  tmpvar_27 = ((_NoiseAmount * (
    sin(tmpvar_26)
   * 
    ((0.5 * cos((
      (tmpvar_26 * 0.6366)
     + 56.7272))) + 0.5)
  )) + (1.0 - _NoiseAmount));
  highp float tmpvar_28;
  if ((_NoiseAmount < 0.01)) {
    tmpvar_28 = tmpvar_25;
  } else {
    tmpvar_28 = tmpvar_27;
  };
  wave_1 = (tmpvar_28 + _Bias);
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = BBLocalPos_2;
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_29.xyz;
  highp float nfadeout_31;
  highp float tmpvar_32;
  tmpvar_32 = clamp ((tmpvar_10 / _FadeOutDistNear), 0.0, 1.0);
  highp float tmpvar_33;
  tmpvar_33 = (1.0 - clamp ((
    max ((tmpvar_10 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  nfadeout_31 = (tmpvar_32 * tmpvar_32);
  nfadeout_31 = (nfadeout_31 * nfadeout_31);
  nfadeout_31 = (nfadeout_31 * (tmpvar_33 * tmpvar_33));
  tmpvar_4 = ((nfadeout_31 * _Color) * (_Multiplier * wave_1));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_30));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_4;
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
uniform highp vec4 _MainTex_ST;
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
  highp float wave_1;
  highp vec3 BBLocalPos_2;
  highp vec3 localDir_3;
  lowp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_5.z = 0.0;
  tmpvar_5.xy = (vec2(0.5, 0.5) - _glesColor.xy);
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * _glesMultiTexCoord1.xyy);
  highp vec3 tmpvar_7;
  tmpvar_7 = (_glesVertex.xyz + tmpvar_6);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = ((unity_WorldToObject * tmpvar_8).xyz - tmpvar_7);
  localDir_3.xz = tmpvar_9.xz;
  localDir_3.y = (tmpvar_9.y * _VerticalBillboarding);
  highp float tmpvar_10;
  tmpvar_10 = sqrt(dot (localDir_3, localDir_3));
  highp vec3 dir_11;
  dir_11 = (localDir_3 / tmpvar_10);
  highp float tmpvar_12;
  tmpvar_12 = abs(dir_11.y);
  highp vec3 tmpvar_13;
  if ((tmpvar_12 > 0.999)) {
    tmpvar_13 = vec3(0.0, 0.0, 1.0);
  } else {
    tmpvar_13 = vec3(0.0, 1.0, 0.0);
  };
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize(((tmpvar_13.yzx * dir_11.zxy) - (tmpvar_13.zxy * dir_11.yzx)));
  highp vec3 tmpvar_15;
  tmpvar_15 = ((dir_11.yzx * tmpvar_14.zxy) - (dir_11.zxy * tmpvar_14.yzx));
  highp float tmpvar_16;
  tmpvar_16 = min ((max (
    (tmpvar_10 - _SizeGrowStartDist)
  , 0.0) / _SizeGrowEndDist), 1.0);
  BBLocalPos_2 = (((tmpvar_7 - 
    ((tmpvar_14 * tmpvar_6.x) + (tmpvar_15 * tmpvar_6.y))
  ) + (
    ((tmpvar_14 * _glesNormal.x) + (tmpvar_15 * _glesNormal.y))
   * 
    ((tmpvar_16 * tmpvar_16) * (_MaxGrowSize * _glesColor.w))
  )) + (_ViewerOffset * localDir_3));
  highp float tmpvar_17;
  tmpvar_17 = (_Time.y + (_BlinkingTimeOffsScale * _glesColor.z));
  highp float y_18;
  y_18 = (_TimeOnDuration + _TimeOffDuration);
  highp float tmpvar_19;
  tmpvar_19 = (tmpvar_17 / y_18);
  highp float tmpvar_20;
  tmpvar_20 = (fract(abs(tmpvar_19)) * y_18);
  highp float tmpvar_21;
  if ((tmpvar_19 >= 0.0)) {
    tmpvar_21 = tmpvar_20;
  } else {
    tmpvar_21 = -(tmpvar_20);
  };
  highp float tmpvar_22;
  tmpvar_22 = clamp ((tmpvar_21 / (_TimeOnDuration * 0.25)), 0.0, 1.0);
  highp float edge0_23;
  edge0_23 = (_TimeOnDuration * 0.75);
  highp float tmpvar_24;
  tmpvar_24 = clamp (((tmpvar_21 - edge0_23) / (_TimeOnDuration - edge0_23)), 0.0, 1.0);
  highp float tmpvar_25;
  tmpvar_25 = ((tmpvar_22 * (tmpvar_22 * 
    (3.0 - (2.0 * tmpvar_22))
  )) * (1.0 - (tmpvar_24 * 
    (tmpvar_24 * (3.0 - (2.0 * tmpvar_24)))
  )));
  wave_1 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (tmpvar_17 * (6.283185 / _TimeOnDuration));
  highp float tmpvar_27;
  tmpvar_27 = ((_NoiseAmount * (
    sin(tmpvar_26)
   * 
    ((0.5 * cos((
      (tmpvar_26 * 0.6366)
     + 56.7272))) + 0.5)
  )) + (1.0 - _NoiseAmount));
  highp float tmpvar_28;
  if ((_NoiseAmount < 0.01)) {
    tmpvar_28 = tmpvar_25;
  } else {
    tmpvar_28 = tmpvar_27;
  };
  wave_1 = (tmpvar_28 + _Bias);
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = BBLocalPos_2;
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_29.xyz;
  highp float nfadeout_31;
  highp float tmpvar_32;
  tmpvar_32 = clamp ((tmpvar_10 / _FadeOutDistNear), 0.0, 1.0);
  highp float tmpvar_33;
  tmpvar_33 = (1.0 - clamp ((
    max ((tmpvar_10 - _FadeOutDistFar), 0.0)
   * 0.2), 0.0, 1.0));
  nfadeout_31 = (tmpvar_32 * tmpvar_32);
  nfadeout_31 = (nfadeout_31 * nfadeout_31);
  nfadeout_31 = (nfadeout_31 * (tmpvar_33 * tmpvar_33));
  tmpvar_4 = ((nfadeout_31 * _Color) * (_Multiplier * wave_1));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_30));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_4;
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