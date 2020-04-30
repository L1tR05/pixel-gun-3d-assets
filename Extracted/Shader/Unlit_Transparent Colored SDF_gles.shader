//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Transparent Colored SDF" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" { }
_Color ("Color", Color) = (1,1,1,1)
_Base ("InRange", Range(0, 1)) = 0.6
_Smooth ("Smooth", Range(0, 1)) = 0.5
_Outline ("OutRange", Range(0, 1)) = 0.6
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 50486
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Base;
uniform 	float _Smooth;
uniform 	float _Outline;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_1;
vec2 u_xlat4;
bool u_xlatb4;
void main()
{
    u_xlat0.xy = vec2(vec2(_Smooth, _Smooth)) + vec2(_Base, _Outline);
    u_xlat4.xy = (-vec2(vec2(_Smooth, _Smooth))) + vec2(_Base, _Outline);
    u_xlat0.xy = (-u_xlat4.xy) + u_xlat0.xy;
    u_xlat0.xy = vec2(1.0, 1.0) / u_xlat0.xy;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat4.xy = (-u_xlat4.xy) + vec2(u_xlat10_1);
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xy;
    u_xlatb4 = _Outline<_Base;
    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat4.x + u_xlat0.y;
    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0.xyz = vs_COLOR0.xyz * _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Base;
uniform 	float _Smooth;
uniform 	float _Outline;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_1;
vec2 u_xlat4;
bool u_xlatb4;
void main()
{
    u_xlat0.xy = vec2(vec2(_Smooth, _Smooth)) + vec2(_Base, _Outline);
    u_xlat4.xy = (-vec2(vec2(_Smooth, _Smooth))) + vec2(_Base, _Outline);
    u_xlat0.xy = (-u_xlat4.xy) + u_xlat0.xy;
    u_xlat0.xy = vec2(1.0, 1.0) / u_xlat0.xy;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat4.xy = (-u_xlat4.xy) + vec2(u_xlat10_1);
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xy;
    u_xlatb4 = _Outline<_Base;
    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat4.x + u_xlat0.y;
    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0.xyz = vs_COLOR0.xyz * _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Base;
uniform 	float _Smooth;
uniform 	float _Outline;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_1;
vec2 u_xlat4;
bool u_xlatb4;
void main()
{
    u_xlat0.xy = vec2(vec2(_Smooth, _Smooth)) + vec2(_Base, _Outline);
    u_xlat4.xy = (-vec2(vec2(_Smooth, _Smooth))) + vec2(_Base, _Outline);
    u_xlat0.xy = (-u_xlat4.xy) + u_xlat0.xy;
    u_xlat0.xy = vec2(1.0, 1.0) / u_xlat0.xy;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat4.xy = (-u_xlat4.xy) + vec2(u_xlat10_1);
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xy;
    u_xlatb4 = _Outline<_Base;
    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat4.x + u_xlat0.y;
    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0.xyz = vs_COLOR0.xyz * _Color.xyz;
    return;
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