//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Glow 11/GlowObjects" {
Properties {
_GlowStrength ("Glow Strength", Float) = 1
_GlowColor ("Glow Color", Color) = (1,1,1,1)
}
SubShader {
 Tags { "RenderEffect" = "Glow11" "RenderType" = "Glow11" }
 Pass {
  Name "OPAQUEGLOW"
  Tags { "RenderEffect" = "Glow11" "RenderType" = "Glow11" }
  GpuProgramID 62616
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_3.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_3.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_3.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * tmpvar_1.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * tmpvar_1.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * tmpvar_1.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
uniform lowp vec4 _Color;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
uniform lowp vec4 _Color;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
uniform lowp vec4 _Color;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_3.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_3.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _GlowTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_3.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_3.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_3.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_3.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * tmpvar_1.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * tmpvar_1.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * tmpvar_1.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_3.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_3.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_3.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * _GlowColor);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1 = (tmpvar_1 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_1 = (tmpvar_1 * tmpvar_2.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
}
}
}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderEffect" = "Glow11Transparent" "RenderType" = "Glow11Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderEffect" = "Glow11Transparent" "RenderType" = "Glow11Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 94282
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2.xyz = (tmpvar_2 * _GlowStrength).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2.xyz = (tmpvar_2 * _GlowStrength).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2.xyz = (tmpvar_2 * _GlowStrength).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * _GlowColor).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * _GlowColor).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * _GlowColor).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * xlv_COLOR).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * xlv_COLOR).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * xlv_COLOR).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * xlv_COLOR.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * xlv_COLOR.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * xlv_COLOR.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_2.xyz = (tmpvar_2 * tmpvar_5.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_2.xyz = (tmpvar_2 * tmpvar_5.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_2.xyz = (tmpvar_2 * tmpvar_5.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * tmpvar_2.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * tmpvar_2.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * tmpvar_2.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_4.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_4.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_4.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_4;
  tmpvar_4 = tmpvar_3.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_4;
  tmpvar_4 = tmpvar_3.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_4;
  tmpvar_4 = tmpvar_3.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_1.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_1.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_1.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_4;
  tmpvar_4 = tmpvar_3.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_4;
  tmpvar_4 = tmpvar_3.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_4;
  tmpvar_4 = tmpvar_3.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (xlv_COLOR * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (xlv_COLOR * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (xlv_COLOR * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
}
}
}
SubShader {
 Tags { "QUEUE" = "AlphaTest" "RenderEffect" = "Glow11TransparentCutout" "RenderType" = "Glow11TransparentCutout" }
 Pass {
  Tags { "QUEUE" = "AlphaTest" "RenderEffect" = "Glow11TransparentCutout" "RenderType" = "Glow11TransparentCutout" }
  GpuProgramID 186325
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2.xyz = (tmpvar_2 * _GlowStrength).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2.xyz = (tmpvar_2 * _GlowStrength).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2.xyz = (tmpvar_2 * _GlowStrength).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * _GlowColor).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * _GlowColor).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * _GlowColor).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * xlv_COLOR).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * xlv_COLOR).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * xlv_COLOR).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * xlv_COLOR.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * xlv_COLOR.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * xlv_COLOR.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_2.xyz = (tmpvar_2 * tmpvar_5.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_2.xyz = (tmpvar_2 * tmpvar_5.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_2.xyz = (tmpvar_2 * tmpvar_5.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * tmpvar_2.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * tmpvar_2.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp float alpha_1;
  highp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = tmpvar_2.w;
  alpha_1 = tmpvar_4;
  tmpvar_2 = (tmpvar_2 * _GlowStrength);
  tmpvar_2.xyz = (tmpvar_2 * tmpvar_2.w).xyz;
  tmpvar_2.w = alpha_1;
  gl_FragData[0] = tmpvar_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _Color;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_4.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_4.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_4.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_4;
  tmpvar_4 = tmpvar_3.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_4;
  tmpvar_4 = tmpvar_3.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _GlowTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _GlowTex_ST.xy) + _GlowTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _GlowTex;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_GlowTex, xlv_TEXCOORD1);
  tmpvar_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_4;
  tmpvar_4 = tmpvar_3.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_1.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_1.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_1.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_4;
  tmpvar_4 = tmpvar_3.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_4;
  tmpvar_4 = tmpvar_3.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_4;
  tmpvar_4 = tmpvar_3.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (tmpvar_1 * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _GlowColor;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (tmpvar_1 * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (xlv_COLOR * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (xlv_COLOR * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1.xyz = (xlv_COLOR * _GlowStrength).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
uniform lowp vec4 _GlowColor;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * _GlowColor).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * xlv_COLOR.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Illum_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Illum_ST.xy) + _Illum_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Illum;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  lowp float tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Illum, xlv_TEXCOORD2);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_3.w).xyz;
  tmpvar_1.w = tmpvar_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _GlowStrength;
varying highp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp float tmpvar_3;
  tmpvar_3 = tmpvar_2.w;
  tmpvar_1 = (xlv_COLOR * _GlowStrength);
  tmpvar_1.xyz = (tmpvar_1 * tmpvar_2.w).xyz;
  tmpvar_1.w = tmpvar_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINTEX" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_MAINCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_MAINCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_GLOWTEX" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_ILLUMTEX" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_ILLUMTEX" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_GLOWCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "NO_MULTIPLY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_GLOWCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_VERT_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_MULTIPLY_ILLUMTEX_ALPHA" "GLOW11_GLOW_VERTEXCOLOR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW11_GLOW_VERTEXCOLOR" "GLOW11_MULTIPLY_MAINTEX_ALPHA" }
""
}
}
}
}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 235329
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
varying lowp vec4 xlv_COLOR0;
void main ()
{
  gl_FragData[0] = xlv_COLOR0;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
varying lowp vec4 xlv_COLOR0;
void main ()
{
  gl_FragData[0] = xlv_COLOR0;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
varying lowp vec4 xlv_COLOR0;
void main ()
{
  gl_FragData[0] = xlv_COLOR0;
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
SubShader {
 Tags { "RenderType" = "TreeOpaque" }
 Pass {
  Tags { "RenderType" = "TreeOpaque" }
  GpuProgramID 300865
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
varying lowp vec4 xlv_COLOR0;
void main ()
{
  gl_FragData[0] = xlv_COLOR0;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
varying lowp vec4 xlv_COLOR0;
void main ()
{
  gl_FragData[0] = xlv_COLOR0;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
varying lowp vec4 xlv_COLOR0;
void main ()
{
  gl_FragData[0] = xlv_COLOR0;
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
SubShader {
 Tags { "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 Pass {
  Tags { "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
  Cull Off
  GpuProgramID 357754
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (vec4(0.0, 0.0, 0.0, 1.1), 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = vec3(0.0, 0.0, 0.0);
  col_1.w = texture2D (_MainTex, xlv_TEXCOORD0).w;
  if ((col_1.w <= _Cutoff)) {
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
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (vec4(0.0, 0.0, 0.0, 1.1), 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = vec3(0.0, 0.0, 0.0);
  col_1.w = texture2D (_MainTex, xlv_TEXCOORD0).w;
  if ((col_1.w <= _Cutoff)) {
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
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (vec4(0.0, 0.0, 0.0, 1.1), 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = vec3(0.0, 0.0, 0.0);
  col_1.w = texture2D (_MainTex, xlv_TEXCOORD0).w;
  if ((col_1.w <= _Cutoff)) {
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
SubShader {
 Tags { "QUEUE" = "AlphaTest" "RenderType" = "TreeTransparentCutout" }
 Pass {
  Tags { "QUEUE" = "AlphaTest" "RenderType" = "TreeTransparentCutout" }
  Cull Off
  GpuProgramID 423290
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (vec4(0.0, 0.0, 0.0, 1.1), 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = vec3(0.0, 0.0, 0.0);
  col_1.w = texture2D (_MainTex, xlv_TEXCOORD0).w;
  if ((col_1.w <= _Cutoff)) {
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
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (vec4(0.0, 0.0, 0.0, 1.1), 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = vec3(0.0, 0.0, 0.0);
  col_1.w = texture2D (_MainTex, xlv_TEXCOORD0).w;
  if ((col_1.w <= _Cutoff)) {
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
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (vec4(0.0, 0.0, 0.0, 1.1), 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = vec3(0.0, 0.0, 0.0);
  col_1.w = texture2D (_MainTex, xlv_TEXCOORD0).w;
  if ((col_1.w <= _Cutoff)) {
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
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  GpuProgramID 483280
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (vec4(0.0, 0.0, 0.0, 1.1), 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = vec3(0.0, 0.0, 0.0);
  col_1.w = texture2D (_MainTex, xlv_TEXCOORD0).w;
  gl_FragData[0] = col_1;
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
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (vec4(0.0, 0.0, 0.0, 1.1), 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = vec3(0.0, 0.0, 0.0);
  col_1.w = texture2D (_MainTex, xlv_TEXCOORD0).w;
  gl_FragData[0] = col_1;
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
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = clamp (vec4(0.0, 0.0, 0.0, 1.1), 0.0, 1.0);
  tmpvar_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  xlv_COLOR0 = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = vec3(0.0, 0.0, 0.0);
  col_1.w = texture2D (_MainTex, xlv_TEXCOORD0).w;
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