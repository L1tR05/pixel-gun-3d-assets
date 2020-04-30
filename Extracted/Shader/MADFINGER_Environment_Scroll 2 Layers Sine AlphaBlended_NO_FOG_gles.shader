//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Environment/Scroll 2 Layers Sine AlphaBlended_NO_FOG" {
Properties {
_MainTex ("Base layer (RGB)", 2D) = "white" { }
_DetailTex ("2nd layer (RGB)", 2D) = "white" { }
_ScrollX ("Base layer Scroll speed X", Float) = 1
_ScrollY ("Base layer Scroll speed Y", Float) = 0
_Scroll2X ("2nd layer Scroll speed X", Float) = 1
_Scroll2Y ("2nd layer Scroll speed Y", Float) = 0
_SineAmplX ("Base layer sine amplitude X", Float) = 0.5
_SineAmplY ("Base layer sine amplitude Y", Float) = 0.5
_SineFreqX ("Base layer sine freq X", Float) = 10
_SineFreqY ("Base layer sine freq Y", Float) = 10
_SineAmplX2 ("2nd layer sine amplitude X", Float) = 0.5
_SineAmplY2 ("2nd layer sine amplitude Y", Float) = 0.5
_SineFreqX2 ("2nd layer sine freq X", Float) = 10
_SineFreqY2 ("2nd layer sine freq Y", Float) = 10
_Color ("Color", Color) = (1,1,1,1)
_MMultiplier ("Layer Multiplier", Float) = 2
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 18332
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _Scroll2X;
uniform 	float _Scroll2Y;
uniform 	float _MMultiplier;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
uniform 	float _SineAmplX2;
uniform 	float _SineAmplY2;
uniform 	float _SineFreqX2;
uniform 	float _SineFreqY2;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = _Time.x * _SineFreqX;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = _Time.xyxy * vec4(_ScrollX, _ScrollY, _Scroll2X, _Scroll2Y);
    u_xlat1 = fract(u_xlat1);
    u_xlat2.xy = u_xlat2.xy + u_xlat1.xy;
    vs_TEXCOORD0.x = u_xlat0.x * _SineAmplX + u_xlat2.x;
    u_xlat0.xy = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
    u_xlat0.xy = u_xlat1.zw + u_xlat0.xy;
    u_xlat6 = _Time.x * _SineFreqY2;
    u_xlat6 = sin(u_xlat6);
    vs_TEXCOORD0.w = u_xlat6 * _SineAmplY2 + u_xlat0.y;
    u_xlat2.xz = _Time.xx * vec2(_SineFreqY, _SineFreqX2);
    u_xlat2.xz = sin(u_xlat2.xz);
    vs_TEXCOORD0.y = u_xlat2.x * _SineAmplY + u_xlat2.y;
    vs_TEXCOORD0.z = u_xlat2.z * _SineAmplX2 + u_xlat0.x;
    u_xlat0 = vec4(_MMultiplier) * _Color;
    u_xlat0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DetailTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD0.zw);
    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
    SV_Target0 = u_xlat16_0 * vs_TEXCOORD1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _Scroll2X;
uniform 	float _Scroll2Y;
uniform 	float _MMultiplier;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
uniform 	float _SineAmplX2;
uniform 	float _SineAmplY2;
uniform 	float _SineFreqX2;
uniform 	float _SineFreqY2;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = _Time.x * _SineFreqX;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = _Time.xyxy * vec4(_ScrollX, _ScrollY, _Scroll2X, _Scroll2Y);
    u_xlat1 = fract(u_xlat1);
    u_xlat2.xy = u_xlat2.xy + u_xlat1.xy;
    vs_TEXCOORD0.x = u_xlat0.x * _SineAmplX + u_xlat2.x;
    u_xlat0.xy = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
    u_xlat0.xy = u_xlat1.zw + u_xlat0.xy;
    u_xlat6 = _Time.x * _SineFreqY2;
    u_xlat6 = sin(u_xlat6);
    vs_TEXCOORD0.w = u_xlat6 * _SineAmplY2 + u_xlat0.y;
    u_xlat2.xz = _Time.xx * vec2(_SineFreqY, _SineFreqX2);
    u_xlat2.xz = sin(u_xlat2.xz);
    vs_TEXCOORD0.y = u_xlat2.x * _SineAmplY + u_xlat2.y;
    vs_TEXCOORD0.z = u_xlat2.z * _SineAmplX2 + u_xlat0.x;
    u_xlat0 = vec4(_MMultiplier) * _Color;
    u_xlat0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DetailTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD0.zw);
    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
    SV_Target0 = u_xlat16_0 * vs_TEXCOORD1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _Scroll2X;
uniform 	float _Scroll2Y;
uniform 	float _MMultiplier;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
uniform 	float _SineAmplX2;
uniform 	float _SineAmplY2;
uniform 	float _SineFreqX2;
uniform 	float _SineFreqY2;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = _Time.x * _SineFreqX;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = _Time.xyxy * vec4(_ScrollX, _ScrollY, _Scroll2X, _Scroll2Y);
    u_xlat1 = fract(u_xlat1);
    u_xlat2.xy = u_xlat2.xy + u_xlat1.xy;
    vs_TEXCOORD0.x = u_xlat0.x * _SineAmplX + u_xlat2.x;
    u_xlat0.xy = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
    u_xlat0.xy = u_xlat1.zw + u_xlat0.xy;
    u_xlat6 = _Time.x * _SineFreqY2;
    u_xlat6 = sin(u_xlat6);
    vs_TEXCOORD0.w = u_xlat6 * _SineAmplY2 + u_xlat0.y;
    u_xlat2.xz = _Time.xx * vec2(_SineFreqY, _SineFreqX2);
    u_xlat2.xz = sin(u_xlat2.xz);
    vs_TEXCOORD0.y = u_xlat2.x * _SineAmplY + u_xlat2.y;
    vs_TEXCOORD0.z = u_xlat2.z * _SineAmplX2 + u_xlat0.x;
    u_xlat0 = vec4(_MMultiplier) * _Color;
    u_xlat0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DetailTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD0.zw);
    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
    SV_Target0 = u_xlat16_0 * vs_TEXCOORD1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _Scroll2X;
uniform 	float _Scroll2Y;
uniform 	float _MMultiplier;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
uniform 	float _SineAmplX2;
uniform 	float _SineAmplY2;
uniform 	float _SineFreqX2;
uniform 	float _SineFreqY2;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = _Time.x * _SineFreqX;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = _Time.xyxy * vec4(_ScrollX, _ScrollY, _Scroll2X, _Scroll2Y);
    u_xlat1 = fract(u_xlat1);
    u_xlat2.xy = u_xlat2.xy + u_xlat1.xy;
    vs_TEXCOORD0.x = u_xlat0.x * _SineAmplX + u_xlat2.x;
    u_xlat0.xy = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
    u_xlat0.xy = u_xlat1.zw + u_xlat0.xy;
    u_xlat6 = _Time.x * _SineFreqY2;
    u_xlat6 = sin(u_xlat6);
    vs_TEXCOORD0.w = u_xlat6 * _SineAmplY2 + u_xlat0.y;
    u_xlat2.xz = _Time.xx * vec2(_SineFreqY, _SineFreqX2);
    u_xlat2.xz = sin(u_xlat2.xz);
    vs_TEXCOORD0.y = u_xlat2.x * _SineAmplY + u_xlat2.y;
    vs_TEXCOORD0.z = u_xlat2.z * _SineAmplX2 + u_xlat0.x;
    u_xlat0 = vec4(_MMultiplier) * _Color;
    u_xlat0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DetailTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD0.zw);
    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
    SV_Target0 = u_xlat16_0 * vs_TEXCOORD1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _Scroll2X;
uniform 	float _Scroll2Y;
uniform 	float _MMultiplier;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
uniform 	float _SineAmplX2;
uniform 	float _SineAmplY2;
uniform 	float _SineFreqX2;
uniform 	float _SineFreqY2;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = _Time.x * _SineFreqX;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = _Time.xyxy * vec4(_ScrollX, _ScrollY, _Scroll2X, _Scroll2Y);
    u_xlat1 = fract(u_xlat1);
    u_xlat2.xy = u_xlat2.xy + u_xlat1.xy;
    vs_TEXCOORD0.x = u_xlat0.x * _SineAmplX + u_xlat2.x;
    u_xlat0.xy = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
    u_xlat0.xy = u_xlat1.zw + u_xlat0.xy;
    u_xlat6 = _Time.x * _SineFreqY2;
    u_xlat6 = sin(u_xlat6);
    vs_TEXCOORD0.w = u_xlat6 * _SineAmplY2 + u_xlat0.y;
    u_xlat2.xz = _Time.xx * vec2(_SineFreqY, _SineFreqX2);
    u_xlat2.xz = sin(u_xlat2.xz);
    vs_TEXCOORD0.y = u_xlat2.x * _SineAmplY + u_xlat2.y;
    vs_TEXCOORD0.z = u_xlat2.z * _SineAmplX2 + u_xlat0.x;
    u_xlat0 = vec4(_MMultiplier) * _Color;
    u_xlat0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DetailTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD0.zw);
    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
    SV_Target0 = u_xlat16_0 * vs_TEXCOORD1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _Scroll2X;
uniform 	float _Scroll2Y;
uniform 	float _MMultiplier;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
uniform 	float _SineAmplX2;
uniform 	float _SineAmplY2;
uniform 	float _SineFreqX2;
uniform 	float _SineFreqY2;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = _Time.x * _SineFreqX;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = _Time.xyxy * vec4(_ScrollX, _ScrollY, _Scroll2X, _Scroll2Y);
    u_xlat1 = fract(u_xlat1);
    u_xlat2.xy = u_xlat2.xy + u_xlat1.xy;
    vs_TEXCOORD0.x = u_xlat0.x * _SineAmplX + u_xlat2.x;
    u_xlat0.xy = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
    u_xlat0.xy = u_xlat1.zw + u_xlat0.xy;
    u_xlat6 = _Time.x * _SineFreqY2;
    u_xlat6 = sin(u_xlat6);
    vs_TEXCOORD0.w = u_xlat6 * _SineAmplY2 + u_xlat0.y;
    u_xlat2.xz = _Time.xx * vec2(_SineFreqY, _SineFreqX2);
    u_xlat2.xz = sin(u_xlat2.xz);
    vs_TEXCOORD0.y = u_xlat2.x * _SineAmplY + u_xlat2.y;
    vs_TEXCOORD0.z = u_xlat2.z * _SineAmplX2 + u_xlat0.x;
    u_xlat0 = vec4(_MMultiplier) * _Color;
    u_xlat0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DetailTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD0.zw);
    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
    SV_Target0 = u_xlat16_0 * vs_TEXCOORD1;
    return;
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
}
}
}
}