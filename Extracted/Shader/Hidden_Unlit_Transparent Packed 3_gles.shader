//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Unlit/Transparent Packed 3" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" { }
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  Offset -1, -1
  GpuProgramID 36959
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _ClipRange0;
uniform highp vec4 _ClipRange1;
uniform highp vec4 _ClipArgs1;
uniform highp vec4 _ClipRange2;
uniform highp vec4 _ClipArgs2;
highp vec4 tmpvar_1;
varying mediump vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1.xy = ((_glesVertex.xy * _ClipRange0.zw) + _ClipRange0.xy);
  highp vec2 ret_3;
  ret_3.x = ((_glesVertex.x * _ClipArgs1.w) - (_glesVertex.y * _ClipArgs1.z));
  ret_3.y = ((_glesVertex.x * _ClipArgs1.z) + (_glesVertex.y * _ClipArgs1.w));
  tmpvar_1.zw = ((ret_3 * _ClipRange1.zw) + _ClipRange1.xy);
  highp vec2 ret_4;
  ret_4.x = ((_glesVertex.x * _ClipArgs2.w) - (_glesVertex.y * _ClipArgs2.z));
  ret_4.y = ((_glesVertex.x * _ClipArgs2.z) + (_glesVertex.y * _ClipArgs2.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = ((ret_4 * _ClipRange2.zw) + _ClipRange2.xy);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp vec4 _ClipArgs0;
uniform highp vec4 _ClipArgs1;
uniform highp vec4 _ClipArgs2;
varying mediump vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec2 factor_1;
  mediump vec4 col_2;
  mediump vec4 mask_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  mask_3 = tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5 = clamp (ceil((xlv_COLOR - 0.5)), 0.0, 1.0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = clamp (((
    (tmpvar_5 * 0.51)
   - xlv_COLOR) / -0.49), 0.0, 1.0);
  col_2.xyz = tmpvar_6.xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = ((vec2(1.0, 1.0) - abs(xlv_TEXCOORD1.xy)) * _ClipArgs0.xy);
  factor_1 = ((vec2(1.0, 1.0) - abs(xlv_TEXCOORD1.zw)) * _ClipArgs1.xy);
  highp float tmpvar_8;
  tmpvar_8 = min (min (tmpvar_7.x, tmpvar_7.y), min (factor_1.x, factor_1.y));
  factor_1 = ((vec2(1.0, 1.0) - abs(xlv_TEXCOORD2)) * _ClipArgs2.xy);
  mask_3 = (mask_3 * tmpvar_5);
  highp float tmpvar_9;
  tmpvar_9 = clamp (min (tmpvar_8, min (factor_1.x, factor_1.y)), 0.0, 1.0);
  col_2.w = (tmpvar_6.w * tmpvar_9);
  col_2.w = (col_2.w * ((mask_3.x + mask_3.y) + (mask_3.z + mask_3.w)));
  gl_FragData[0] = col_2;
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
uniform highp vec4 _ClipRange0;
uniform highp vec4 _ClipRange1;
uniform highp vec4 _ClipArgs1;
uniform highp vec4 _ClipRange2;
uniform highp vec4 _ClipArgs2;
highp vec4 tmpvar_1;
varying mediump vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1.xy = ((_glesVertex.xy * _ClipRange0.zw) + _ClipRange0.xy);
  highp vec2 ret_3;
  ret_3.x = ((_glesVertex.x * _ClipArgs1.w) - (_glesVertex.y * _ClipArgs1.z));
  ret_3.y = ((_glesVertex.x * _ClipArgs1.z) + (_glesVertex.y * _ClipArgs1.w));
  tmpvar_1.zw = ((ret_3 * _ClipRange1.zw) + _ClipRange1.xy);
  highp vec2 ret_4;
  ret_4.x = ((_glesVertex.x * _ClipArgs2.w) - (_glesVertex.y * _ClipArgs2.z));
  ret_4.y = ((_glesVertex.x * _ClipArgs2.z) + (_glesVertex.y * _ClipArgs2.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = ((ret_4 * _ClipRange2.zw) + _ClipRange2.xy);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp vec4 _ClipArgs0;
uniform highp vec4 _ClipArgs1;
uniform highp vec4 _ClipArgs2;
varying mediump vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec2 factor_1;
  mediump vec4 col_2;
  mediump vec4 mask_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  mask_3 = tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5 = clamp (ceil((xlv_COLOR - 0.5)), 0.0, 1.0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = clamp (((
    (tmpvar_5 * 0.51)
   - xlv_COLOR) / -0.49), 0.0, 1.0);
  col_2.xyz = tmpvar_6.xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = ((vec2(1.0, 1.0) - abs(xlv_TEXCOORD1.xy)) * _ClipArgs0.xy);
  factor_1 = ((vec2(1.0, 1.0) - abs(xlv_TEXCOORD1.zw)) * _ClipArgs1.xy);
  highp float tmpvar_8;
  tmpvar_8 = min (min (tmpvar_7.x, tmpvar_7.y), min (factor_1.x, factor_1.y));
  factor_1 = ((vec2(1.0, 1.0) - abs(xlv_TEXCOORD2)) * _ClipArgs2.xy);
  mask_3 = (mask_3 * tmpvar_5);
  highp float tmpvar_9;
  tmpvar_9 = clamp (min (tmpvar_8, min (factor_1.x, factor_1.y)), 0.0, 1.0);
  col_2.w = (tmpvar_6.w * tmpvar_9);
  col_2.w = (col_2.w * ((mask_3.x + mask_3.y) + (mask_3.z + mask_3.w)));
  gl_FragData[0] = col_2;
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
uniform highp vec4 _ClipRange0;
uniform highp vec4 _ClipRange1;
uniform highp vec4 _ClipArgs1;
uniform highp vec4 _ClipRange2;
uniform highp vec4 _ClipArgs2;
highp vec4 tmpvar_1;
varying mediump vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1.xy = ((_glesVertex.xy * _ClipRange0.zw) + _ClipRange0.xy);
  highp vec2 ret_3;
  ret_3.x = ((_glesVertex.x * _ClipArgs1.w) - (_glesVertex.y * _ClipArgs1.z));
  ret_3.y = ((_glesVertex.x * _ClipArgs1.z) + (_glesVertex.y * _ClipArgs1.w));
  tmpvar_1.zw = ((ret_3 * _ClipRange1.zw) + _ClipRange1.xy);
  highp vec2 ret_4;
  ret_4.x = ((_glesVertex.x * _ClipArgs2.w) - (_glesVertex.y * _ClipArgs2.z));
  ret_4.y = ((_glesVertex.x * _ClipArgs2.z) + (_glesVertex.y * _ClipArgs2.w));
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = ((ret_4 * _ClipRange2.zw) + _ClipRange2.xy);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp vec4 _ClipArgs0;
uniform highp vec4 _ClipArgs1;
uniform highp vec4 _ClipArgs2;
varying mediump vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec2 factor_1;
  mediump vec4 col_2;
  mediump vec4 mask_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  mask_3 = tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5 = clamp (ceil((xlv_COLOR - 0.5)), 0.0, 1.0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = clamp (((
    (tmpvar_5 * 0.51)
   - xlv_COLOR) / -0.49), 0.0, 1.0);
  col_2.xyz = tmpvar_6.xyz;
  highp vec2 tmpvar_7;
  tmpvar_7 = ((vec2(1.0, 1.0) - abs(xlv_TEXCOORD1.xy)) * _ClipArgs0.xy);
  factor_1 = ((vec2(1.0, 1.0) - abs(xlv_TEXCOORD1.zw)) * _ClipArgs1.xy);
  highp float tmpvar_8;
  tmpvar_8 = min (min (tmpvar_7.x, tmpvar_7.y), min (factor_1.x, factor_1.y));
  factor_1 = ((vec2(1.0, 1.0) - abs(xlv_TEXCOORD2)) * _ClipArgs2.xy);
  mask_3 = (mask_3 * tmpvar_5);
  highp float tmpvar_9;
  tmpvar_9 = clamp (min (tmpvar_8, min (factor_1.x, factor_1.y)), 0.0, 1.0);
  col_2.w = (tmpvar_6.w * tmpvar_9);
  col_2.w = (col_2.w * ((mask_3.x + mask_3.y) + (mask_3.z + mask_3.w)));
  gl_FragData[0] = col_2;
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