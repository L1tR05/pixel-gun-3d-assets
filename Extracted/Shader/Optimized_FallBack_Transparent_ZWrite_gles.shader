//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Optimized/FallBack/Transparent_ZWrite" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_MainTex2 ("Texture", 2D) = "white" { }
_Scale ("Scale", Float) = 1
_OffsetX ("Offset X", Float) = 1
_OffsetY ("Offset Y", Float) = 1
_MaxDIstance ("FadeDist", Float) = 25
_CutOut ("Cutout", Range(0, 1)) = 0.3
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent-100" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent-100" "RenderType" = "Transparent" }
  ZTest Less
  GpuProgramID 24021
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 vertPose_1;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  vertPose_1 = tmpvar_4;
  lowp vec2 tmpvar_5;
  tmpvar_5.x = _OffsetX;
  tmpvar_5.y = _OffsetY;
  tmpvar_2 = (vertPose_1.xz + tmpvar_5);
  tmpvar_2 = (tmpvar_2 / _Scale);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_2;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp float _CutOut;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * texture2D (_MainTex2, xlv_TEXCOORD2));
  lowp float tmpvar_2;
  tmpvar_2 = clamp ((col_1.w - _CutOut), 0.01, 1.0);
  if ((tmpvar_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 vertPose_1;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  vertPose_1 = tmpvar_4;
  lowp vec2 tmpvar_5;
  tmpvar_5.x = _OffsetX;
  tmpvar_5.y = _OffsetY;
  tmpvar_2 = (vertPose_1.xz + tmpvar_5);
  tmpvar_2 = (tmpvar_2 / _Scale);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_2;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp float _CutOut;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * texture2D (_MainTex2, xlv_TEXCOORD2));
  lowp float tmpvar_2;
  tmpvar_2 = clamp ((col_1.w - _CutOut), 0.01, 1.0);
  if ((tmpvar_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 vertPose_1;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  vertPose_1 = tmpvar_4;
  lowp vec2 tmpvar_5;
  tmpvar_5.x = _OffsetX;
  tmpvar_5.y = _OffsetY;
  tmpvar_2 = (vertPose_1.xz + tmpvar_5);
  tmpvar_2 = (tmpvar_2 / _Scale);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_2;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp float _CutOut;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * texture2D (_MainTex2, xlv_TEXCOORD2));
  lowp float tmpvar_2;
  tmpvar_2 = clamp ((col_1.w - _CutOut), 0.01, 1.0);
  if ((tmpvar_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 vertPose_1;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  vertPose_1 = tmpvar_5;
  lowp vec2 tmpvar_6;
  tmpvar_6.x = _OffsetX;
  tmpvar_6.y = _OffsetY;
  tmpvar_2 = (vertPose_1.xz + tmpvar_6);
  tmpvar_2 = (tmpvar_2 / _Scale);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD1 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp float _CutOut;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * texture2D (_MainTex2, xlv_TEXCOORD2));
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(tmpvar_2));
  lowp float tmpvar_3;
  tmpvar_3 = clamp ((col_1.w - _CutOut), 0.01, 1.0);
  if ((tmpvar_3 < 0.0)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 vertPose_1;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  vertPose_1 = tmpvar_5;
  lowp vec2 tmpvar_6;
  tmpvar_6.x = _OffsetX;
  tmpvar_6.y = _OffsetY;
  tmpvar_2 = (vertPose_1.xz + tmpvar_6);
  tmpvar_2 = (tmpvar_2 / _Scale);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD1 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp float _CutOut;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * texture2D (_MainTex2, xlv_TEXCOORD2));
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(tmpvar_2));
  lowp float tmpvar_3;
  tmpvar_3 = clamp ((col_1.w - _CutOut), 0.01, 1.0);
  if ((tmpvar_3 < 0.0)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 vertPose_1;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  vertPose_1 = tmpvar_5;
  lowp vec2 tmpvar_6;
  tmpvar_6.x = _OffsetX;
  tmpvar_6.y = _OffsetY;
  tmpvar_2 = (vertPose_1.xz + tmpvar_6);
  tmpvar_2 = (tmpvar_2 / _Scale);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD1 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp float _CutOut;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * texture2D (_MainTex2, xlv_TEXCOORD2));
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(tmpvar_2));
  lowp float tmpvar_3;
  tmpvar_3 = clamp ((col_1.w - _CutOut), 0.01, 1.0);
  if ((tmpvar_3 < 0.0)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 vertPose_1;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  vertPose_1 = tmpvar_4;
  lowp vec2 tmpvar_5;
  tmpvar_5.x = _OffsetX;
  tmpvar_5.y = _OffsetY;
  tmpvar_2 = (vertPose_1.xz + tmpvar_5);
  tmpvar_2 = (tmpvar_2 / _Scale);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_2;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp float _CutOut;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * texture2D (_MainTex2, xlv_TEXCOORD2));
  lowp float tmpvar_2;
  tmpvar_2 = clamp ((col_1.w - _CutOut), 0.01, 1.0);
  if ((tmpvar_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 vertPose_1;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  vertPose_1 = tmpvar_4;
  lowp vec2 tmpvar_5;
  tmpvar_5.x = _OffsetX;
  tmpvar_5.y = _OffsetY;
  tmpvar_2 = (vertPose_1.xz + tmpvar_5);
  tmpvar_2 = (tmpvar_2 / _Scale);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_2;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp float _CutOut;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * texture2D (_MainTex2, xlv_TEXCOORD2));
  lowp float tmpvar_2;
  tmpvar_2 = clamp ((col_1.w - _CutOut), 0.01, 1.0);
  if ((tmpvar_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 vertPose_1;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  vertPose_1 = tmpvar_4;
  lowp vec2 tmpvar_5;
  tmpvar_5.x = _OffsetX;
  tmpvar_5.y = _OffsetY;
  tmpvar_2 = (vertPose_1.xz + tmpvar_5);
  tmpvar_2 = (tmpvar_2 / _Scale);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_2;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp float _CutOut;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * texture2D (_MainTex2, xlv_TEXCOORD2));
  lowp float tmpvar_2;
  tmpvar_2 = clamp ((col_1.w - _CutOut), 0.01, 1.0);
  if ((tmpvar_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 vertPose_1;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  vertPose_1 = tmpvar_5;
  lowp vec2 tmpvar_6;
  tmpvar_6.x = _OffsetX;
  tmpvar_6.y = _OffsetY;
  tmpvar_2 = (vertPose_1.xz + tmpvar_6);
  tmpvar_2 = (tmpvar_2 / _Scale);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD1 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp float _CutOut;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * texture2D (_MainTex2, xlv_TEXCOORD2));
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(tmpvar_2));
  lowp float tmpvar_3;
  tmpvar_3 = clamp ((col_1.w - _CutOut), 0.01, 1.0);
  if ((tmpvar_3 < 0.0)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 vertPose_1;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  vertPose_1 = tmpvar_5;
  lowp vec2 tmpvar_6;
  tmpvar_6.x = _OffsetX;
  tmpvar_6.y = _OffsetY;
  tmpvar_2 = (vertPose_1.xz + tmpvar_6);
  tmpvar_2 = (tmpvar_2 / _Scale);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD1 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp float _CutOut;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * texture2D (_MainTex2, xlv_TEXCOORD2));
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(tmpvar_2));
  lowp float tmpvar_3;
  tmpvar_3 = clamp ((col_1.w - _CutOut), 0.01, 1.0);
  if ((tmpvar_3 < 0.0)) {
    discard;
  };
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform lowp float _Scale;
uniform lowp float _OffsetX;
uniform lowp float _OffsetY;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 vertPose_1;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  vertPose_1 = tmpvar_5;
  lowp vec2 tmpvar_6;
  tmpvar_6.x = _OffsetX;
  tmpvar_6.y = _OffsetY;
  tmpvar_2 = (vertPose_1.xz + tmpvar_6);
  tmpvar_2 = (tmpvar_2 / _Scale);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_2;
  xlv_TEXCOORD1 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _MainTex2;
uniform lowp float _CutOut;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * texture2D (_MainTex2, xlv_TEXCOORD2));
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(tmpvar_2));
  lowp float tmpvar_3;
  tmpvar_3 = clamp ((col_1.w - _CutOut), 0.01, 1.0);
  if ((tmpvar_3 < 0.0)) {
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
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
}
}
}
}