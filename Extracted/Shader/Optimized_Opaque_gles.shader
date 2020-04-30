//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Optimized/Opaque" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_MainTex2 ("Texture", 2D) = "white" { }
_Scale ("Scale", Float) = 1
_OffsetX ("Offset X", Float) = 1
_OffsetY ("Offset Y", Float) = 1
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZTest Less
  GpuProgramID 65010
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _Scale;
uniform 	mediump float _OffsetX;
uniform 	mediump float _OffsetY;
uniform lowp sampler2D _MainTex2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat16_2.xy = u_xlat1.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_2.xy = u_xlat16_2.xy / vec2(_Scale);
    vs_TEXCOORD2.xy = u_xlat16_2.xy;
    u_xlat1 = texture2DLod(_MainTex2, u_xlat16_2.xy, 0.0);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3 = u_xlat0.x * u_xlat0.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0 = vec4(u_xlat16_3) * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343) + u_xlat1;
    vs_COLOR1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR1;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _Scale;
uniform 	mediump float _OffsetX;
uniform 	mediump float _OffsetY;
uniform lowp sampler2D _MainTex2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat16_2.xy = u_xlat1.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_2.xy = u_xlat16_2.xy / vec2(_Scale);
    vs_TEXCOORD2.xy = u_xlat16_2.xy;
    u_xlat1 = texture2DLod(_MainTex2, u_xlat16_2.xy, 0.0);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3 = u_xlat0.x * u_xlat0.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0 = vec4(u_xlat16_3) * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343) + u_xlat1;
    vs_COLOR1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR1;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _Scale;
uniform 	mediump float _OffsetX;
uniform 	mediump float _OffsetY;
uniform lowp sampler2D _MainTex2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat16_2.xy = u_xlat1.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_2.xy = u_xlat16_2.xy / vec2(_Scale);
    vs_TEXCOORD2.xy = u_xlat16_2.xy;
    u_xlat1 = texture2DLod(_MainTex2, u_xlat16_2.xy, 0.0);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3 = u_xlat0.x * u_xlat0.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0 = vec4(u_xlat16_3) * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343) + u_xlat1;
    vs_COLOR1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR1;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _Scale;
uniform 	mediump float _OffsetX;
uniform 	mediump float _OffsetY;
uniform lowp sampler2D _MainTex2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat16_2.xy = u_xlat1.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_2.xy = u_xlat16_2.xy / vec2(_Scale);
    vs_TEXCOORD2.xy = u_xlat16_2.xy;
    u_xlat1 = texture2DLod(_MainTex2, u_xlat16_2.xy, 0.0);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3 = u_xlat0.x * u_xlat0.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0 = vec4(u_xlat16_3) * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343) + u_xlat1;
    vs_COLOR1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_COLOR1.xyz + (-unity_FogColor.xyz);
    u_xlat1.w = u_xlat10_1.w * vs_COLOR1.w;
    u_xlat1.xyz = vec3(u_xlat0) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _Scale;
uniform 	mediump float _OffsetX;
uniform 	mediump float _OffsetY;
uniform lowp sampler2D _MainTex2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat16_2.xy = u_xlat1.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_2.xy = u_xlat16_2.xy / vec2(_Scale);
    vs_TEXCOORD2.xy = u_xlat16_2.xy;
    u_xlat1 = texture2DLod(_MainTex2, u_xlat16_2.xy, 0.0);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3 = u_xlat0.x * u_xlat0.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0 = vec4(u_xlat16_3) * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343) + u_xlat1;
    vs_COLOR1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_COLOR1.xyz + (-unity_FogColor.xyz);
    u_xlat1.w = u_xlat10_1.w * vs_COLOR1.w;
    u_xlat1.xyz = vec3(u_xlat0) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _Scale;
uniform 	mediump float _OffsetX;
uniform 	mediump float _OffsetY;
uniform lowp sampler2D _MainTex2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat16_2.xy = u_xlat1.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_2.xy = u_xlat16_2.xy / vec2(_Scale);
    vs_TEXCOORD2.xy = u_xlat16_2.xy;
    u_xlat1 = texture2DLod(_MainTex2, u_xlat16_2.xy, 0.0);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3 = u_xlat0.x * u_xlat0.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0 = vec4(u_xlat16_3) * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343) + u_xlat1;
    vs_COLOR1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_COLOR1.xyz + (-unity_FogColor.xyz);
    u_xlat1.w = u_xlat10_1.w * vs_COLOR1.w;
    u_xlat1.xyz = vec3(u_xlat0) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _Scale;
uniform 	mediump float _OffsetX;
uniform 	mediump float _OffsetY;
uniform lowp sampler2D _MainTex2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat16_2.xy = u_xlat1.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_2.xy = u_xlat16_2.xy / vec2(_Scale);
    vs_TEXCOORD2.xy = u_xlat16_2.xy;
    u_xlat1 = texture2DLod(_MainTex2, u_xlat16_2.xy, 0.0);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3 = u_xlat0.x * u_xlat0.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0 = vec4(u_xlat16_3) * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343) + u_xlat1;
    vs_COLOR1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR1;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _Scale;
uniform 	mediump float _OffsetX;
uniform 	mediump float _OffsetY;
uniform lowp sampler2D _MainTex2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat16_2.xy = u_xlat1.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_2.xy = u_xlat16_2.xy / vec2(_Scale);
    vs_TEXCOORD2.xy = u_xlat16_2.xy;
    u_xlat1 = texture2DLod(_MainTex2, u_xlat16_2.xy, 0.0);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3 = u_xlat0.x * u_xlat0.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0 = vec4(u_xlat16_3) * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343) + u_xlat1;
    vs_COLOR1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR1;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _Scale;
uniform 	mediump float _OffsetX;
uniform 	mediump float _OffsetY;
uniform lowp sampler2D _MainTex2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat16_2.xy = u_xlat1.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_2.xy = u_xlat16_2.xy / vec2(_Scale);
    vs_TEXCOORD2.xy = u_xlat16_2.xy;
    u_xlat1 = texture2DLod(_MainTex2, u_xlat16_2.xy, 0.0);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3 = u_xlat0.x * u_xlat0.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0 = vec4(u_xlat16_3) * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343) + u_xlat1;
    vs_COLOR1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR1;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _Scale;
uniform 	mediump float _OffsetX;
uniform 	mediump float _OffsetY;
uniform lowp sampler2D _MainTex2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat16_2.xy = u_xlat1.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_2.xy = u_xlat16_2.xy / vec2(_Scale);
    vs_TEXCOORD2.xy = u_xlat16_2.xy;
    u_xlat1 = texture2DLod(_MainTex2, u_xlat16_2.xy, 0.0);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3 = u_xlat0.x * u_xlat0.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0 = vec4(u_xlat16_3) * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343) + u_xlat1;
    vs_COLOR1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_COLOR1.xyz + (-unity_FogColor.xyz);
    u_xlat1.w = u_xlat10_1.w * vs_COLOR1.w;
    u_xlat1.xyz = vec3(u_xlat0) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _Scale;
uniform 	mediump float _OffsetX;
uniform 	mediump float _OffsetY;
uniform lowp sampler2D _MainTex2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat16_2.xy = u_xlat1.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_2.xy = u_xlat16_2.xy / vec2(_Scale);
    vs_TEXCOORD2.xy = u_xlat16_2.xy;
    u_xlat1 = texture2DLod(_MainTex2, u_xlat16_2.xy, 0.0);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3 = u_xlat0.x * u_xlat0.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0 = vec4(u_xlat16_3) * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343) + u_xlat1;
    vs_COLOR1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_COLOR1.xyz + (-unity_FogColor.xyz);
    u_xlat1.w = u_xlat10_1.w * vs_COLOR1.w;
    u_xlat1.xyz = vec3(u_xlat0) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _Scale;
uniform 	mediump float _OffsetX;
uniform 	mediump float _OffsetY;
uniform lowp sampler2D _MainTex2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat16_2.xy = u_xlat1.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_2.xy = u_xlat16_2.xy / vec2(_Scale);
    vs_TEXCOORD2.xy = u_xlat16_2.xy;
    u_xlat1 = texture2DLod(_MainTex2, u_xlat16_2.xy, 0.0);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3 = u_xlat0.x * u_xlat0.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0 = vec4(u_xlat16_3) * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343) + u_xlat1;
    vs_COLOR1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_COLOR1.xyz + (-unity_FogColor.xyz);
    u_xlat1.w = u_xlat10_1.w * vs_COLOR1.w;
    u_xlat1.xyz = vec3(u_xlat0) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
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
Fallback "Optimized/FallBack/Opaque"
}