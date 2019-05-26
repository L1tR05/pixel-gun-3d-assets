//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "ImageEffect/Blur" {
Properties {
_MainTex ("Texture", 2D) = "black" { }
_Multiplyer ("Mult", Float) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 64648
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
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Multiplyer;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float Yes_2;
  lowp float K_3;
  lowp vec2 newUv1_4;
  lowp vec4 col_5;
  lowp vec2 uv_6;
  uv_6 = xlv_TEXCOORD0;
  col_5 = texture2D (_MainTex, uv_6);
  newUv1_4 = uv_6;
  K_3 = 1.0;
  Yes_2 = 0.0;
  for (highp int x_1 = -8; x_1 < 8; x_1++) {
    for (highp int y_7 = -8; y_7 < 8; y_7++) {
      Yes_2 = float(((y_7 + x_1) < 8));
      K_3 = (K_3 + Yes_2);
      highp vec2 tmpvar_8;
      tmpvar_8.x = (0.0015 * float(x_1));
      tmpvar_8.y = (0.0015 * float(y_7));
      newUv1_4 = (uv_6 + (tmpvar_8 * _Multiplyer));
      col_5 = (col_5 + (texture2D (_MainTex, newUv1_4) * Yes_2));
    };
  };
  col_5 = (col_5 * (1.0/(K_3)));
  gl_FragData[0] = col_5;
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
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Multiplyer;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float Yes_2;
  lowp float K_3;
  lowp vec2 newUv1_4;
  lowp vec4 col_5;
  lowp vec2 uv_6;
  uv_6 = xlv_TEXCOORD0;
  col_5 = texture2D (_MainTex, uv_6);
  newUv1_4 = uv_6;
  K_3 = 1.0;
  Yes_2 = 0.0;
  for (highp int x_1 = -8; x_1 < 8; x_1++) {
    for (highp int y_7 = -8; y_7 < 8; y_7++) {
      Yes_2 = float(((y_7 + x_1) < 8));
      K_3 = (K_3 + Yes_2);
      highp vec2 tmpvar_8;
      tmpvar_8.x = (0.0015 * float(x_1));
      tmpvar_8.y = (0.0015 * float(y_7));
      newUv1_4 = (uv_6 + (tmpvar_8 * _Multiplyer));
      col_5 = (col_5 + (texture2D (_MainTex, newUv1_4) * Yes_2));
    };
  };
  col_5 = (col_5 * (1.0/(K_3)));
  gl_FragData[0] = col_5;
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
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Multiplyer;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float Yes_2;
  lowp float K_3;
  lowp vec2 newUv1_4;
  lowp vec4 col_5;
  lowp vec2 uv_6;
  uv_6 = xlv_TEXCOORD0;
  col_5 = texture2D (_MainTex, uv_6);
  newUv1_4 = uv_6;
  K_3 = 1.0;
  Yes_2 = 0.0;
  for (highp int x_1 = -8; x_1 < 8; x_1++) {
    for (highp int y_7 = -8; y_7 < 8; y_7++) {
      Yes_2 = float(((y_7 + x_1) < 8));
      K_3 = (K_3 + Yes_2);
      highp vec2 tmpvar_8;
      tmpvar_8.x = (0.0015 * float(x_1));
      tmpvar_8.y = (0.0015 * float(y_7));
      newUv1_4 = (uv_6 + (tmpvar_8 * _Multiplyer));
      col_5 = (col_5 + (texture2D (_MainTex, newUv1_4) * Yes_2));
    };
  };
  col_5 = (col_5 * (1.0/(K_3)));
  gl_FragData[0] = col_5;
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