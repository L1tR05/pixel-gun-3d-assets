//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/TrailShader" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
_BulletSpeed ("BulletSpeed", Float) = 2
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Offset -1, -1
  GpuProgramID 15728
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
uniform highp float _BulletSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  highp float mult_2;
  highp float alphaMult_3;
  highp float a2_4;
  highp vec4 col_5;
  highp vec2 tmpvar_6;
  tmpvar_6.x = (((xlv_TEXCOORD0.x + 
    fract(_Time.x)
  ) / xlv_COLOR.x) * 0.5);
  tmpvar_6.y = xlv_TEXCOORD0.y;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, tmpvar_6);
  col_5 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((xlv_TEXCOORD0.x * 5.0) / xlv_COLOR.w);
  tmpvar_8.y = xlv_TEXCOORD0.y;
  lowp float tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, tmpvar_8).w;
  a2_4 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = ((1.0 - (xlv_COLOR.w * 0.99)) * _BulletSpeed);
  highp float tmpvar_11;
  tmpvar_11 = (tmpvar_10 + (xlv_COLOR.x * 0.5));
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - (clamp (
    (0.01 - xlv_TEXCOORD0.x)
  , 0.0, 1.0) / 0.01));
  alphaMult_3 = tmpvar_12;
  mult_2 = clamp (((xlv_TEXCOORD0.x - 
    (tmpvar_10 - xlv_COLOR.x)
  ) / xlv_COLOR.x), 0.0, 1.0);
  if ((xlv_TEXCOORD0.x > tmpvar_10)) {
    highp float tmpvar_13;
    tmpvar_13 = clamp (((tmpvar_11 - xlv_TEXCOORD0.x) / (xlv_COLOR.x * 0.5)), 0.0, 1.0);
    mult_2 = tmpvar_13;
    alphaMult_3 = clamp ((tmpvar_12 * tmpvar_13), 0.0, 1.0);
  };
  col_5.xyz = ((col_5.xyz * (1.0 - mult_2)) + ((mult_2 * 2.0) * _Color.xyz));
  col_5.w = (col_5.w * a2_4);
  col_5.w = (((col_5.w * xlv_COLOR.w) * 0.8) + (mult_2 * 3.0));
  col_5.w = ((float(
    ((col_5.w * 2.0) >= 0.1)
  ) * col_5.w) * alphaMult_3);
  tmpvar_1 = col_5;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
uniform highp float _BulletSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  highp float mult_2;
  highp float alphaMult_3;
  highp float a2_4;
  highp vec4 col_5;
  highp vec2 tmpvar_6;
  tmpvar_6.x = (((xlv_TEXCOORD0.x + 
    fract(_Time.x)
  ) / xlv_COLOR.x) * 0.5);
  tmpvar_6.y = xlv_TEXCOORD0.y;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, tmpvar_6);
  col_5 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((xlv_TEXCOORD0.x * 5.0) / xlv_COLOR.w);
  tmpvar_8.y = xlv_TEXCOORD0.y;
  lowp float tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, tmpvar_8).w;
  a2_4 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = ((1.0 - (xlv_COLOR.w * 0.99)) * _BulletSpeed);
  highp float tmpvar_11;
  tmpvar_11 = (tmpvar_10 + (xlv_COLOR.x * 0.5));
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - (clamp (
    (0.01 - xlv_TEXCOORD0.x)
  , 0.0, 1.0) / 0.01));
  alphaMult_3 = tmpvar_12;
  mult_2 = clamp (((xlv_TEXCOORD0.x - 
    (tmpvar_10 - xlv_COLOR.x)
  ) / xlv_COLOR.x), 0.0, 1.0);
  if ((xlv_TEXCOORD0.x > tmpvar_10)) {
    highp float tmpvar_13;
    tmpvar_13 = clamp (((tmpvar_11 - xlv_TEXCOORD0.x) / (xlv_COLOR.x * 0.5)), 0.0, 1.0);
    mult_2 = tmpvar_13;
    alphaMult_3 = clamp ((tmpvar_12 * tmpvar_13), 0.0, 1.0);
  };
  col_5.xyz = ((col_5.xyz * (1.0 - mult_2)) + ((mult_2 * 2.0) * _Color.xyz));
  col_5.w = (col_5.w * a2_4);
  col_5.w = (((col_5.w * xlv_COLOR.w) * 0.8) + (mult_2 * 3.0));
  col_5.w = ((float(
    ((col_5.w * 2.0) >= 0.1)
  ) * col_5.w) * alphaMult_3);
  tmpvar_1 = col_5;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
uniform highp float _BulletSpeed;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  highp float mult_2;
  highp float alphaMult_3;
  highp float a2_4;
  highp vec4 col_5;
  highp vec2 tmpvar_6;
  tmpvar_6.x = (((xlv_TEXCOORD0.x + 
    fract(_Time.x)
  ) / xlv_COLOR.x) * 0.5);
  tmpvar_6.y = xlv_TEXCOORD0.y;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, tmpvar_6);
  col_5 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((xlv_TEXCOORD0.x * 5.0) / xlv_COLOR.w);
  tmpvar_8.y = xlv_TEXCOORD0.y;
  lowp float tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, tmpvar_8).w;
  a2_4 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = ((1.0 - (xlv_COLOR.w * 0.99)) * _BulletSpeed);
  highp float tmpvar_11;
  tmpvar_11 = (tmpvar_10 + (xlv_COLOR.x * 0.5));
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - (clamp (
    (0.01 - xlv_TEXCOORD0.x)
  , 0.0, 1.0) / 0.01));
  alphaMult_3 = tmpvar_12;
  mult_2 = clamp (((xlv_TEXCOORD0.x - 
    (tmpvar_10 - xlv_COLOR.x)
  ) / xlv_COLOR.x), 0.0, 1.0);
  if ((xlv_TEXCOORD0.x > tmpvar_10)) {
    highp float tmpvar_13;
    tmpvar_13 = clamp (((tmpvar_11 - xlv_TEXCOORD0.x) / (xlv_COLOR.x * 0.5)), 0.0, 1.0);
    mult_2 = tmpvar_13;
    alphaMult_3 = clamp ((tmpvar_12 * tmpvar_13), 0.0, 1.0);
  };
  col_5.xyz = ((col_5.xyz * (1.0 - mult_2)) + ((mult_2 * 2.0) * _Color.xyz));
  col_5.w = (col_5.w * a2_4);
  col_5.w = (((col_5.w * xlv_COLOR.w) * 0.8) + (mult_2 * 3.0));
  col_5.w = ((float(
    ((col_5.w * 2.0) >= 0.1)
  ) * col_5.w) * alphaMult_3);
  tmpvar_1 = col_5;
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