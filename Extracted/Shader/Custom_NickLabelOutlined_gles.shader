//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/NickLabelOutlined" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "white" { }
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Cull Off
  Offset -1, -1
  GpuProgramID 16941
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _MainTex_ST;
varying mediump vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = ((_glesVertex.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 col_1;
  mediump vec2 uv_2;
  uv_2 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, uv_2);
  col_1 = tmpvar_3;
  mediump float tmpvar_4;
  tmpvar_4 = clamp (((col_1.w - 0.1) / 0.9), 0.0, 1.0);
  col_1.xyz = (xlv_COLOR * (tmpvar_4 * (tmpvar_4 * 
    (3.0 - (2.0 * tmpvar_4))
  ))).xyz;
  mediump vec2 tmpvar_5;
  tmpvar_5 = (uv_2 + vec2(0.003, 0.003));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_5);
  mediump vec2 tmpvar_7;
  tmpvar_7 = (uv_2 - vec2(0.003, 0.003));
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, tmpvar_7);
  mediump vec2 tmpvar_9;
  tmpvar_9.x = (uv_2.x + 0.003);
  tmpvar_9.y = (uv_2.y - 0.003);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
  mediump vec2 tmpvar_11;
  tmpvar_11.x = (uv_2.x - 0.003);
  tmpvar_11.y = (uv_2.y + 0.003);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, tmpvar_11);
  mediump float tmpvar_13;
  tmpvar_13 = clamp (((
    (((tmpvar_6.w + tmpvar_8.w) + ((tmpvar_10.w + tmpvar_12.w) + col_1.w)) * xlv_COLOR.w)
   - 0.3) / 0.3), 0.0, 1.0);
  col_1.w = (tmpvar_13 * (tmpvar_13 * (3.0 - 
    (2.0 * tmpvar_13)
  )));
  if ((col_1.w < 0.5)) {
    discard;
  };
  gl_FragData[0] = col_1;
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
uniform mediump vec4 _MainTex_ST;
varying mediump vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = ((_glesVertex.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 col_1;
  mediump vec2 uv_2;
  uv_2 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, uv_2);
  col_1 = tmpvar_3;
  mediump float tmpvar_4;
  tmpvar_4 = clamp (((col_1.w - 0.1) / 0.9), 0.0, 1.0);
  col_1.xyz = (xlv_COLOR * (tmpvar_4 * (tmpvar_4 * 
    (3.0 - (2.0 * tmpvar_4))
  ))).xyz;
  mediump vec2 tmpvar_5;
  tmpvar_5 = (uv_2 + vec2(0.003, 0.003));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_5);
  mediump vec2 tmpvar_7;
  tmpvar_7 = (uv_2 - vec2(0.003, 0.003));
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, tmpvar_7);
  mediump vec2 tmpvar_9;
  tmpvar_9.x = (uv_2.x + 0.003);
  tmpvar_9.y = (uv_2.y - 0.003);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
  mediump vec2 tmpvar_11;
  tmpvar_11.x = (uv_2.x - 0.003);
  tmpvar_11.y = (uv_2.y + 0.003);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, tmpvar_11);
  mediump float tmpvar_13;
  tmpvar_13 = clamp (((
    (((tmpvar_6.w + tmpvar_8.w) + ((tmpvar_10.w + tmpvar_12.w) + col_1.w)) * xlv_COLOR.w)
   - 0.3) / 0.3), 0.0, 1.0);
  col_1.w = (tmpvar_13 * (tmpvar_13 * (3.0 - 
    (2.0 * tmpvar_13)
  )));
  if ((col_1.w < 0.5)) {
    discard;
  };
  gl_FragData[0] = col_1;
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
uniform mediump vec4 _MainTex_ST;
varying mediump vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = ((_glesVertex.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 col_1;
  mediump vec2 uv_2;
  uv_2 = xlv_TEXCOORD0;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, uv_2);
  col_1 = tmpvar_3;
  mediump float tmpvar_4;
  tmpvar_4 = clamp (((col_1.w - 0.1) / 0.9), 0.0, 1.0);
  col_1.xyz = (xlv_COLOR * (tmpvar_4 * (tmpvar_4 * 
    (3.0 - (2.0 * tmpvar_4))
  ))).xyz;
  mediump vec2 tmpvar_5;
  tmpvar_5 = (uv_2 + vec2(0.003, 0.003));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, tmpvar_5);
  mediump vec2 tmpvar_7;
  tmpvar_7 = (uv_2 - vec2(0.003, 0.003));
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, tmpvar_7);
  mediump vec2 tmpvar_9;
  tmpvar_9.x = (uv_2.x + 0.003);
  tmpvar_9.y = (uv_2.y - 0.003);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
  mediump vec2 tmpvar_11;
  tmpvar_11.x = (uv_2.x - 0.003);
  tmpvar_11.y = (uv_2.y + 0.003);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, tmpvar_11);
  mediump float tmpvar_13;
  tmpvar_13 = clamp (((
    (((tmpvar_6.w + tmpvar_8.w) + ((tmpvar_10.w + tmpvar_12.w) + col_1.w)) * xlv_COLOR.w)
   - 0.3) / 0.3), 0.0, 1.0);
  col_1.w = (tmpvar_13 * (tmpvar_13 * (3.0 - 
    (2.0 * tmpvar_13)
  )));
  if ((col_1.w < 0.5)) {
    discard;
  };
  gl_FragData[0] = col_1;
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