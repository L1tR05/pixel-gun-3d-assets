//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Environment/Blinking emissive" {
Properties {
_MainTex ("Base texture", 2D) = "white" { }
_IntensityScaleBias ("Intensity scale X / bias Y", Vector) = (1,0.1,0,0)
_SwitchOnOffDuration ("Switch ON (X) / OFF (Y) duration", Vector) = (1,3,0,0)
_BlinkingRate ("Blinking rate", Float) = 10
_RndGridSize ("Randomization grid size", Float) = 5
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 63684
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec2 _IntensityScaleBias;
uniform highp vec2 _SwitchOnOffDuration;
uniform highp float _BlinkingRate;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp float rnd_2;
  highp float seed_3;
  lowp vec4 tmpvar_4;
  lowp float tmpvar_5;
  tmpvar_5 = (dot (_glesColor, _glesColor) * 40.0);
  seed_3 = tmpvar_5;
  highp float time_6;
  time_6 = (_Time.y * _BlinkingRate);
  highp float tmpvar_7;
  tmpvar_7 = float((abs(
    cos(((17.0 * sin(
      (time_6 * 5.0)
    )) + (10.0 * sin(
      ((seed_3 + (time_6 * 3.0)) + 7.993)
    ))))
  ) > 0.5));
  rnd_2 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (_SwitchOnOffDuration * (0.8 + (0.4 * 
    fract(seed_3)
  )));
  highp float y_9;
  y_9 = (tmpvar_8.x + tmpvar_8.y);
  highp float tmpvar_10;
  tmpvar_10 = ((_Time.y + seed_3) / y_9);
  highp float tmpvar_11;
  tmpvar_11 = (fract(abs(tmpvar_10)) * y_9);
  highp float tmpvar_12;
  if ((tmpvar_10 >= 0.0)) {
    tmpvar_12 = tmpvar_11;
  } else {
    tmpvar_12 = -(tmpvar_11);
  };
  rnd_2 = (tmpvar_7 * float((tmpvar_12 < tmpvar_8.x)));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_1.xyz;
  tmpvar_4 = (((_glesColor * rnd_2) * _IntensityScaleBias.x) + _IntensityScaleBias.y);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_13));
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
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec2 _IntensityScaleBias;
uniform highp vec2 _SwitchOnOffDuration;
uniform highp float _BlinkingRate;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp float rnd_2;
  highp float seed_3;
  lowp vec4 tmpvar_4;
  lowp float tmpvar_5;
  tmpvar_5 = (dot (_glesColor, _glesColor) * 40.0);
  seed_3 = tmpvar_5;
  highp float time_6;
  time_6 = (_Time.y * _BlinkingRate);
  highp float tmpvar_7;
  tmpvar_7 = float((abs(
    cos(((17.0 * sin(
      (time_6 * 5.0)
    )) + (10.0 * sin(
      ((seed_3 + (time_6 * 3.0)) + 7.993)
    ))))
  ) > 0.5));
  rnd_2 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (_SwitchOnOffDuration * (0.8 + (0.4 * 
    fract(seed_3)
  )));
  highp float y_9;
  y_9 = (tmpvar_8.x + tmpvar_8.y);
  highp float tmpvar_10;
  tmpvar_10 = ((_Time.y + seed_3) / y_9);
  highp float tmpvar_11;
  tmpvar_11 = (fract(abs(tmpvar_10)) * y_9);
  highp float tmpvar_12;
  if ((tmpvar_10 >= 0.0)) {
    tmpvar_12 = tmpvar_11;
  } else {
    tmpvar_12 = -(tmpvar_11);
  };
  rnd_2 = (tmpvar_7 * float((tmpvar_12 < tmpvar_8.x)));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_1.xyz;
  tmpvar_4 = (((_glesColor * rnd_2) * _IntensityScaleBias.x) + _IntensityScaleBias.y);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_13));
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
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec2 _IntensityScaleBias;
uniform highp vec2 _SwitchOnOffDuration;
uniform highp float _BlinkingRate;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp float rnd_2;
  highp float seed_3;
  lowp vec4 tmpvar_4;
  lowp float tmpvar_5;
  tmpvar_5 = (dot (_glesColor, _glesColor) * 40.0);
  seed_3 = tmpvar_5;
  highp float time_6;
  time_6 = (_Time.y * _BlinkingRate);
  highp float tmpvar_7;
  tmpvar_7 = float((abs(
    cos(((17.0 * sin(
      (time_6 * 5.0)
    )) + (10.0 * sin(
      ((seed_3 + (time_6 * 3.0)) + 7.993)
    ))))
  ) > 0.5));
  rnd_2 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (_SwitchOnOffDuration * (0.8 + (0.4 * 
    fract(seed_3)
  )));
  highp float y_9;
  y_9 = (tmpvar_8.x + tmpvar_8.y);
  highp float tmpvar_10;
  tmpvar_10 = ((_Time.y + seed_3) / y_9);
  highp float tmpvar_11;
  tmpvar_11 = (fract(abs(tmpvar_10)) * y_9);
  highp float tmpvar_12;
  if ((tmpvar_10 >= 0.0)) {
    tmpvar_12 = tmpvar_11;
  } else {
    tmpvar_12 = -(tmpvar_11);
  };
  rnd_2 = (tmpvar_7 * float((tmpvar_12 < tmpvar_8.x)));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_1.xyz;
  tmpvar_4 = (((_glesColor * rnd_2) * _IntensityScaleBias.x) + _IntensityScaleBias.y);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_13));
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