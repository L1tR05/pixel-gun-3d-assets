//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/FX/Anim texture" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_NumTexTiles ("Num tex tiles", Vector) = (4,4,0,0)
_ReplaySpeed ("Replay speed - FPS", Float) = 4
_Color ("Color", Color) = (1,1,1,1)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 38010
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
uniform highp vec4 _Color;
uniform highp vec4 _NumTexTiles;
uniform highp float _ReplaySpeed;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tile_2;
  lowp vec4 tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = (((_glesColor.w * 60.0) + _Time.y) * _ReplaySpeed);
  highp float tmpvar_5;
  tmpvar_5 = floor(tmpvar_4);
  highp float tmpvar_6;
  tmpvar_6 = (tmpvar_5 + 1.0);
  highp float tmpvar_7;
  tmpvar_7 = (tmpvar_4 - tmpvar_5);
  highp vec2 tmpvar_8;
  tmpvar_8 = (1.0/(_NumTexTiles.xy));
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_5;
  tmpvar_9.y = floor((tmpvar_5 / _NumTexTiles.x));
  tile_2.xy = tmpvar_9;
  highp vec2 tmpvar_10;
  tmpvar_10.x = tmpvar_6;
  tmpvar_10.y = floor((tmpvar_6 / _NumTexTiles.x));
  tile_2.zw = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (tile_2 / _NumTexTiles.xyxy);
  highp vec4 tmpvar_12;
  tmpvar_12 = (fract(abs(tmpvar_11)) * _NumTexTiles.xyxy);
  highp float tmpvar_13;
  if ((tmpvar_11.x >= 0.0)) {
    tmpvar_13 = tmpvar_12.x;
  } else {
    tmpvar_13 = -(tmpvar_12.x);
  };
  highp float tmpvar_14;
  if ((tmpvar_11.y >= 0.0)) {
    tmpvar_14 = tmpvar_12.y;
  } else {
    tmpvar_14 = -(tmpvar_12.y);
  };
  highp float tmpvar_15;
  if ((tmpvar_11.z >= 0.0)) {
    tmpvar_15 = tmpvar_12.z;
  } else {
    tmpvar_15 = -(tmpvar_12.z);
  };
  highp float tmpvar_16;
  if ((tmpvar_11.w >= 0.0)) {
    tmpvar_16 = tmpvar_12.w;
  } else {
    tmpvar_16 = -(tmpvar_12.w);
  };
  highp vec4 tmpvar_17;
  tmpvar_17.x = tmpvar_13;
  tmpvar_17.y = tmpvar_14;
  tmpvar_17.z = tmpvar_15;
  tmpvar_17.w = tmpvar_16;
  tile_2 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.xyz = (_Color.xyz * _glesColor.xyz);
  tmpvar_19.w = tmpvar_7;
  tmpvar_3 = tmpvar_19;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_18));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xyxy + tmpvar_17) * tmpvar_8.xyxy);
  xlv_COLOR = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (mix (texture2D (_MainTex, xlv_TEXCOORD0.xy), texture2D (_MainTex, xlv_TEXCOORD0.zw), xlv_COLOR.wwww) * xlv_COLOR);
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
uniform highp vec4 _Color;
uniform highp vec4 _NumTexTiles;
uniform highp float _ReplaySpeed;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tile_2;
  lowp vec4 tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = (((_glesColor.w * 60.0) + _Time.y) * _ReplaySpeed);
  highp float tmpvar_5;
  tmpvar_5 = floor(tmpvar_4);
  highp float tmpvar_6;
  tmpvar_6 = (tmpvar_5 + 1.0);
  highp float tmpvar_7;
  tmpvar_7 = (tmpvar_4 - tmpvar_5);
  highp vec2 tmpvar_8;
  tmpvar_8 = (1.0/(_NumTexTiles.xy));
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_5;
  tmpvar_9.y = floor((tmpvar_5 / _NumTexTiles.x));
  tile_2.xy = tmpvar_9;
  highp vec2 tmpvar_10;
  tmpvar_10.x = tmpvar_6;
  tmpvar_10.y = floor((tmpvar_6 / _NumTexTiles.x));
  tile_2.zw = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (tile_2 / _NumTexTiles.xyxy);
  highp vec4 tmpvar_12;
  tmpvar_12 = (fract(abs(tmpvar_11)) * _NumTexTiles.xyxy);
  highp float tmpvar_13;
  if ((tmpvar_11.x >= 0.0)) {
    tmpvar_13 = tmpvar_12.x;
  } else {
    tmpvar_13 = -(tmpvar_12.x);
  };
  highp float tmpvar_14;
  if ((tmpvar_11.y >= 0.0)) {
    tmpvar_14 = tmpvar_12.y;
  } else {
    tmpvar_14 = -(tmpvar_12.y);
  };
  highp float tmpvar_15;
  if ((tmpvar_11.z >= 0.0)) {
    tmpvar_15 = tmpvar_12.z;
  } else {
    tmpvar_15 = -(tmpvar_12.z);
  };
  highp float tmpvar_16;
  if ((tmpvar_11.w >= 0.0)) {
    tmpvar_16 = tmpvar_12.w;
  } else {
    tmpvar_16 = -(tmpvar_12.w);
  };
  highp vec4 tmpvar_17;
  tmpvar_17.x = tmpvar_13;
  tmpvar_17.y = tmpvar_14;
  tmpvar_17.z = tmpvar_15;
  tmpvar_17.w = tmpvar_16;
  tile_2 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.xyz = (_Color.xyz * _glesColor.xyz);
  tmpvar_19.w = tmpvar_7;
  tmpvar_3 = tmpvar_19;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_18));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xyxy + tmpvar_17) * tmpvar_8.xyxy);
  xlv_COLOR = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (mix (texture2D (_MainTex, xlv_TEXCOORD0.xy), texture2D (_MainTex, xlv_TEXCOORD0.zw), xlv_COLOR.wwww) * xlv_COLOR);
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
uniform highp vec4 _Color;
uniform highp vec4 _NumTexTiles;
uniform highp float _ReplaySpeed;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tile_2;
  lowp vec4 tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = (((_glesColor.w * 60.0) + _Time.y) * _ReplaySpeed);
  highp float tmpvar_5;
  tmpvar_5 = floor(tmpvar_4);
  highp float tmpvar_6;
  tmpvar_6 = (tmpvar_5 + 1.0);
  highp float tmpvar_7;
  tmpvar_7 = (tmpvar_4 - tmpvar_5);
  highp vec2 tmpvar_8;
  tmpvar_8 = (1.0/(_NumTexTiles.xy));
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_5;
  tmpvar_9.y = floor((tmpvar_5 / _NumTexTiles.x));
  tile_2.xy = tmpvar_9;
  highp vec2 tmpvar_10;
  tmpvar_10.x = tmpvar_6;
  tmpvar_10.y = floor((tmpvar_6 / _NumTexTiles.x));
  tile_2.zw = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (tile_2 / _NumTexTiles.xyxy);
  highp vec4 tmpvar_12;
  tmpvar_12 = (fract(abs(tmpvar_11)) * _NumTexTiles.xyxy);
  highp float tmpvar_13;
  if ((tmpvar_11.x >= 0.0)) {
    tmpvar_13 = tmpvar_12.x;
  } else {
    tmpvar_13 = -(tmpvar_12.x);
  };
  highp float tmpvar_14;
  if ((tmpvar_11.y >= 0.0)) {
    tmpvar_14 = tmpvar_12.y;
  } else {
    tmpvar_14 = -(tmpvar_12.y);
  };
  highp float tmpvar_15;
  if ((tmpvar_11.z >= 0.0)) {
    tmpvar_15 = tmpvar_12.z;
  } else {
    tmpvar_15 = -(tmpvar_12.z);
  };
  highp float tmpvar_16;
  if ((tmpvar_11.w >= 0.0)) {
    tmpvar_16 = tmpvar_12.w;
  } else {
    tmpvar_16 = -(tmpvar_12.w);
  };
  highp vec4 tmpvar_17;
  tmpvar_17.x = tmpvar_13;
  tmpvar_17.y = tmpvar_14;
  tmpvar_17.z = tmpvar_15;
  tmpvar_17.w = tmpvar_16;
  tile_2 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.xyz = (_Color.xyz * _glesColor.xyz);
  tmpvar_19.w = tmpvar_7;
  tmpvar_3 = tmpvar_19;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_18));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xyxy + tmpvar_17) * tmpvar_8.xyxy);
  xlv_COLOR = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (mix (texture2D (_MainTex, xlv_TEXCOORD0.xy), texture2D (_MainTex, xlv_TEXCOORD0.zw), xlv_COLOR.wwww) * xlv_COLOR);
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