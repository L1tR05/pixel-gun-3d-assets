//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Optimized/MultiShader" {
Properties {
_MainTex ("BaseWithAlpha (RGB)", 2D) = "white" { }
_SelfIllum ("SelfIllumWhiteBlack (RGB)", 2D) = "black" { }
_Color ("Color", Color) = (1,1,1,1)
_CutOut ("Cutout", Range(0, 1)) = 0.2
[Header(Shader Properties)] [Toggle(COLOR_ENABLE)] _ColorEnable ("Color tint", Float) = 0
[Toggle(LIGHTING_ENABLE)] _LightingEnable ("Lighting", Float) = 1
[Toggle(ALPHATEST_ENABLE)] _AlphatestEnable ("Alpha test", Float) = 0
[KeywordEnum(Off, Tex, Alpha)] _Emission ("Emission", Float) = 0
[MaterialToggle] _ZWriteEnable ("ZWrite", Float) = 1
[Enum(UnityEngine.Rendering.CullMode)] _CullMode ("Cull Mode", Float) = 2
_SrcBlend ("SrcBlend", Float) = 5
_DstBlend ("DstBlend", Float) = 10
}
SubShader {
 LOD 150
 Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Pass {
  LOD 150
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZWrite Off
  Cull Off
  GpuProgramID 59950
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = u_xlat16_0.w<_CutOut;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = u_xlat16_0.w<_CutOut;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = u_xlat16_0.w<_CutOut;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat1.xyz + (-unity_FogColor.xyz);
    u_xlat1.xyz = vec3(u_xlat0) * u_xlat2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat1.xyz + (-unity_FogColor.xyz);
    u_xlat1.xyz = vec3(u_xlat0) * u_xlat2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat1.xyz + (-unity_FogColor.xyz);
    u_xlat1.xyz = vec3(u_xlat0) * u_xlat2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.x = vs_TEXCOORD1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat16_2 = u_xlat10_1.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_2;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.x = vs_TEXCOORD1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat16_2 = u_xlat10_1.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_2;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.x = vs_TEXCOORD1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat16_2 = u_xlat10_1.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_2;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.x = vs_TEXCOORD1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat16_2 = u_xlat16_1.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_2;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.x = vs_TEXCOORD1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat16_2 = u_xlat16_1.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_2;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.x = vs_TEXCOORD1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat16_2 = u_xlat16_1.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_2;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump float u_xlat16_1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb6 = u_xlat16_1<_CutOut;
    if(((int(u_xlatb6) * -1))!=0){discard;}
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump float u_xlat16_1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb6 = u_xlat16_1<_CutOut;
    if(((int(u_xlatb6) * -1))!=0){discard;}
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump float u_xlat16_1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb6 = u_xlat16_1<_CutOut;
    if(((int(u_xlatb6) * -1))!=0){discard;}
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz + (-unity_FogColor.xyz);
    u_xlat3 = vs_TEXCOORD1;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz + (-unity_FogColor.xyz);
    u_xlat3 = vs_TEXCOORD1;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz + (-unity_FogColor.xyz);
    u_xlat3 = vs_TEXCOORD1;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz + (-unity_FogColor.xyz);
    u_xlat3 = vs_TEXCOORD1;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz + (-unity_FogColor.xyz);
    u_xlat3 = vs_TEXCOORD1;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz + (-unity_FogColor.xyz);
    u_xlat3 = vs_TEXCOORD1;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat3 = vs_TEXCOORD1;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat3 = vs_TEXCOORD1;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat3 = vs_TEXCOORD1;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_2 = u_xlat16_1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_2 = u_xlat16_1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_2 = u_xlat16_1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0 * vs_COLOR0;
    u_xlatb9 = u_xlat16_1.w<_CutOut;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat10_2.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * u_xlat10_0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0 * vs_COLOR0;
    u_xlatb9 = u_xlat16_1.w<_CutOut;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat10_2.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * u_xlat10_0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0 * vs_COLOR0;
    u_xlatb9 = u_xlat16_1.w<_CutOut;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat10_2.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * u_xlat10_0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz + u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz + u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz + u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat1.xyz + u_xlat1.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat1.xyz + u_xlat1.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat1.xyz + u_xlat1.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_1 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_1 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_1 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_2 = u_xlat16_1 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_2 = u_xlat16_1 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_2 = u_xlat16_1 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0 * vs_COLOR0;
    u_xlatb9 = u_xlat16_1.w<_CutOut;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat10_2.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * u_xlat10_0.xyz + u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0 * vs_COLOR0;
    u_xlatb9 = u_xlat16_1.w<_CutOut;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat10_2.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * u_xlat10_0.xyz + u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0 * vs_COLOR0;
    u_xlatb9 = u_xlat16_1.w<_CutOut;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat10_2.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * u_xlat10_0.xyz + u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SelfIllum;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_SelfIllum, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD1;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.www * u_xlat10_0.xyz + u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.www * u_xlat10_0.xyz + u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.www * u_xlat10_0.xyz + u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_0.www;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_0.www;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_0.www;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = vs_COLOR0.w;
    u_xlatb1 = u_xlat16_0<_CutOut;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_2.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = vs_COLOR0.w;
    u_xlatb1 = u_xlat16_0<_CutOut;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_2.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = vs_COLOR0.w;
    u_xlatb1 = u_xlat16_0<_CutOut;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_2.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.www * u_xlat10_0.xyz + u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.www * u_xlat10_0.xyz + u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.www * u_xlat10_0.xyz + u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_0.www;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_0.www;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_0.www;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat10_0.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat10_0.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat10_0.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
float u_xlat15;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
    u_xlat16_1.w = 1.0;
    u_xlat16_2 = u_xlat16_1 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD1;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat3.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
float u_xlat15;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
    u_xlat16_1.w = 1.0;
    u_xlat16_2 = u_xlat16_1 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD1;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat3.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
float u_xlat15;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
    u_xlat16_1.w = 1.0;
    u_xlat16_2 = u_xlat16_1 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD1;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat3.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = vs_COLOR0.w;
    u_xlatb1 = u_xlat16_0<_CutOut;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.www;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + u_xlat16_2.xyz;
    u_xlat1.x = vs_TEXCOORD1;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = vs_COLOR0.w;
    u_xlatb1 = u_xlat16_0<_CutOut;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.www;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + u_xlat16_2.xyz;
    u_xlat1.x = vs_TEXCOORD1;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = vs_COLOR0.w;
    u_xlatb1 = u_xlat16_0<_CutOut;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.www;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + u_xlat16_2.xyz;
    u_xlat1.x = vs_TEXCOORD1;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat10_0.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat10_0.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat10_0.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat11 = vs_TEXCOORD1;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat11) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat11 = vs_TEXCOORD1;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat11) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    vs_COLOR0 = vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat11 = vs_TEXCOORD1;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat11) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.www;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_0.www;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat11 = vs_TEXCOORD1;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat11) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_0.www;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat11 = vs_TEXCOORD1;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat11) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SelfIllum_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _SelfIllum_ST.xy + _SelfIllum_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    vs_COLOR0.w = 1.0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_0.www;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat11 = vs_TEXCOORD1;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat11) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_OFF" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_TEX" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" "ALPHATEST_ENABLE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "_EMISSION_ALPHA" "COLOR_ENABLE" "LIGHTING_ENABLE" "IS_OPAQUE" }
""
}
}
}
}
CustomEditor "MultiShaderGUI"
}