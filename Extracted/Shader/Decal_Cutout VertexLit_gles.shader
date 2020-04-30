//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Decal/Cutout VertexLit" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Vertex" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
  AlphaToMask On
  Offset -1, -1
  GpuProgramID 137536
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_2.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_2.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_2.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = u_xlat32 * 0.5;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat31;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = u_xlat32 * 0.5;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat31;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = u_xlat32 * 0.5;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat31;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat32;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat31 = max(u_xlat31, 0.0);
        u_xlat16_38 = u_xlat31 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_38 = u_xlat16_38 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
        u_xlat16_37 = u_xlat16_37 * u_xlat16_38;
        u_xlat16_37 = u_xlat16_37 * 0.5;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat32;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat31 = max(u_xlat31, 0.0);
        u_xlat16_38 = u_xlat31 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_38 = u_xlat16_38 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
        u_xlat16_37 = u_xlat16_37 * u_xlat16_38;
        u_xlat16_37 = u_xlat16_37 * 0.5;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat32;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat31 = max(u_xlat31, 0.0);
        u_xlat16_38 = u_xlat31 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_38 = u_xlat16_38 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
        u_xlat16_37 = u_xlat16_37 * u_xlat16_38;
        u_xlat16_37 = u_xlat16_37 * 0.5;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_2.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_2.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_2.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = u_xlat32 * 0.5;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat31;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = u_xlat32 * 0.5;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat31;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = u_xlat32 * 0.5;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat31;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat32;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat31 = max(u_xlat31, 0.0);
        u_xlat16_38 = u_xlat31 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_38 = u_xlat16_38 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
        u_xlat16_37 = u_xlat16_37 * u_xlat16_38;
        u_xlat16_37 = u_xlat16_37 * 0.5;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat32;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat31 = max(u_xlat31, 0.0);
        u_xlat16_38 = u_xlat31 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_38 = u_xlat16_38 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
        u_xlat16_37 = u_xlat16_37 * u_xlat16_38;
        u_xlat16_37 = u_xlat16_37 * 0.5;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat32;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat31 = max(u_xlat31, 0.0);
        u_xlat16_38 = u_xlat31 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_38 = u_xlat16_38 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
        u_xlat16_37 = u_xlat16_37 * u_xlat16_38;
        u_xlat16_37 = u_xlat16_37 * 0.5;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "VertexLM" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
  AlphaToMask On
  Offset -1, -1
  GpuProgramID 207310
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD1;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_1.x = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb9 = _Cutoff>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
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
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD1;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_1.x = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb9 = _Cutoff>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
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
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD1;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_1.x = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb9 = _Cutoff>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD1;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_1.x = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb9 = _Cutoff>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD1;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_1.x = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb9 = _Cutoff>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD1;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_1.x = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb9 = _Cutoff>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
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
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "VertexLMRGBM" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
  AlphaToMask On
  Offset -1, -1
  GpuProgramID 325390
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD1;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb9 = _Cutoff>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat16_1 = texture2D(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(4.0, 4.0, 4.0);
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
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD1;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb9 = _Cutoff>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat16_1 = texture2D(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(4.0, 4.0, 4.0);
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
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD1;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb9 = _Cutoff>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat16_1 = texture2D(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(4.0, 4.0, 4.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD1;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD3 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb9 = _Cutoff>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat16_1 = texture2D(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(4.0, 4.0, 4.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD3) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD1;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD3 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb9 = _Cutoff>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat16_1 = texture2D(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(4.0, 4.0, 4.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD3) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD1;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD3 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * vs_COLOR0.w;
    u_xlatb9 = _Cutoff>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * -1))!=0){discard;}
    u_xlat16_1 = texture2D(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(4.0, 4.0, 4.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD3) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "Caster"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "SHADOWSUPPORT" = "true" }
  ZTest Less
  Cull Off
  Offset 1, 1
  GpuProgramID 59697
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0 = u_xlat16_1<0.0;
    if(((int(u_xlatb0) * -1))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0 = u_xlat16_1<0.0;
    if(((int(u_xlatb0) * -1))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0 = u_xlat16_1<0.0;
    if(((int(u_xlatb0) * -1))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0 = u_xlat16_1<0.0;
    if(((int(u_xlatb0) * -1))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0 = u_xlat16_1<0.0;
    if(((int(u_xlatb0) * -1))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0 = u_xlat16_1<0.0;
    if(((int(u_xlatb0) * -1))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
 Pass {
  Name "ShadowCollector"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCOLLECTOR" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
  ZTest Less
  Offset -1, -1
  GpuProgramID 103161
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat0.x);
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mediump vec4 _LightShadowData;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump float u_xlat16_3;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD5.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0.x = u_xlat16_1<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD4.wwww, _LightSplitsNear);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlatb1 = lessThan(vs_TEXCOORD4.wwww, _LightSplitsFar);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat0.z;
    u_xlat16_3 = (-_LightShadowData.x) + 1.0;
    u_xlat16_3 = (u_xlatb0.x) ? 0.0 : u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 + _LightShadowData.x;
    u_xlat0.x = vs_TEXCOORD4.w * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = (-vs_TEXCOORD4.w) * _ProjectionParams.w + 1.0;
    u_xlat2.xy = u_xlat2.xx * vec2(1.0, 255.0);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
    u_xlat0.w = u_xlat2.y;
    u_xlat0.y = 1.0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat0.x);
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mediump vec4 _LightShadowData;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump float u_xlat16_3;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD5.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0.x = u_xlat16_1<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD4.wwww, _LightSplitsNear);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlatb1 = lessThan(vs_TEXCOORD4.wwww, _LightSplitsFar);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat0.z;
    u_xlat16_3 = (-_LightShadowData.x) + 1.0;
    u_xlat16_3 = (u_xlatb0.x) ? 0.0 : u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 + _LightShadowData.x;
    u_xlat0.x = vs_TEXCOORD4.w * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = (-vs_TEXCOORD4.w) * _ProjectionParams.w + 1.0;
    u_xlat2.xy = u_xlat2.xx * vec2(1.0, 255.0);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
    u_xlat0.w = u_xlat2.y;
    u_xlat0.y = 1.0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat0.x);
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mediump vec4 _LightShadowData;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump float u_xlat16_3;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD5.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0.x = u_xlat16_1<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD4.wwww, _LightSplitsNear);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlatb1 = lessThan(vs_TEXCOORD4.wwww, _LightSplitsFar);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat0.z;
    u_xlat16_3 = (-_LightShadowData.x) + 1.0;
    u_xlat16_3 = (u_xlatb0.x) ? 0.0 : u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 + _LightShadowData.x;
    u_xlat0.x = vs_TEXCOORD4.w * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = (-vs_TEXCOORD4.w) * _ProjectionParams.w + 1.0;
    u_xlat2.xy = u_xlat2.xx * vec2(1.0, 255.0);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
    u_xlat0.w = u_xlat2.y;
    u_xlat0.y = 1.0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat0.x);
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD5.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0.x = u_xlat16_1<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat0.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb0 = lessThan(u_xlat0, unity_ShadowSplitSqRadii);
    u_xlat2.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat2.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat2.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat3.xyz = u_xlat2.xyz + u_xlat0.yzw;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat3.xxx * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat3.yyy + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat0.z;
    u_xlat16_1 = (-_LightShadowData.x) + 1.0;
    u_xlat16_1 = (u_xlatb0.x) ? 0.0 : u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 + _LightShadowData.x;
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat16_1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = (-vs_TEXCOORD4.w) * _ProjectionParams.w + 1.0;
    u_xlat2.xy = u_xlat2.xx * vec2(1.0, 255.0);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
    u_xlat0.w = u_xlat2.y;
    u_xlat0.y = 1.0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat0.x);
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD5.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0.x = u_xlat16_1<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat0.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb0 = lessThan(u_xlat0, unity_ShadowSplitSqRadii);
    u_xlat2.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat2.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat2.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat3.xyz = u_xlat2.xyz + u_xlat0.yzw;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat3.xxx * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat3.yyy + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat0.z;
    u_xlat16_1 = (-_LightShadowData.x) + 1.0;
    u_xlat16_1 = (u_xlatb0.x) ? 0.0 : u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 + _LightShadowData.x;
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat16_1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = (-vs_TEXCOORD4.w) * _ProjectionParams.w + 1.0;
    u_xlat2.xy = u_xlat2.xx * vec2(1.0, 255.0);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
    u_xlat0.w = u_xlat2.y;
    u_xlat0.y = 1.0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat0.x);
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD5.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0.x = u_xlat16_1<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat0.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb0 = lessThan(u_xlat0, unity_ShadowSplitSqRadii);
    u_xlat2.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat2.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat2.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat3.xyz = u_xlat2.xyz + u_xlat0.yzw;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat3.xxx * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat3.yyy + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat0.z;
    u_xlat16_1 = (-_LightShadowData.x) + 1.0;
    u_xlat16_1 = (u_xlatb0.x) ? 0.0 : u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 + _LightShadowData.x;
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat16_1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = (-vs_TEXCOORD4.w) * _ProjectionParams.w + 1.0;
    u_xlat2.xy = u_xlat2.xx * vec2(1.0, 255.0);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
    u_xlat0.w = u_xlat2.y;
    u_xlat0.y = 1.0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat0.x);
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mediump vec4 _LightShadowData;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump float u_xlat16_3;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD5.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0.x = u_xlat16_1<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD4.wwww, _LightSplitsNear);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlatb1 = lessThan(vs_TEXCOORD4.wwww, _LightSplitsFar);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat0.z;
    u_xlat16_3 = (-_LightShadowData.x) + 1.0;
    u_xlat16_3 = (u_xlatb0.x) ? 0.0 : u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 + _LightShadowData.x;
    u_xlat0.x = vs_TEXCOORD4.w * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = (-vs_TEXCOORD4.w) * _ProjectionParams.w + 1.0;
    u_xlat2.xy = u_xlat2.xx * vec2(1.0, 255.0);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
    u_xlat0.w = u_xlat2.y;
    u_xlat0.y = 1.0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat0.x);
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mediump vec4 _LightShadowData;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump float u_xlat16_3;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD5.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0.x = u_xlat16_1<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD4.wwww, _LightSplitsNear);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlatb1 = lessThan(vs_TEXCOORD4.wwww, _LightSplitsFar);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat0.z;
    u_xlat16_3 = (-_LightShadowData.x) + 1.0;
    u_xlat16_3 = (u_xlatb0.x) ? 0.0 : u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 + _LightShadowData.x;
    u_xlat0.x = vs_TEXCOORD4.w * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = (-vs_TEXCOORD4.w) * _ProjectionParams.w + 1.0;
    u_xlat2.xy = u_xlat2.xx * vec2(1.0, 255.0);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
    u_xlat0.w = u_xlat2.y;
    u_xlat0.y = 1.0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat0.x);
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mediump vec4 _LightShadowData;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump float u_xlat16_3;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD5.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0.x = u_xlat16_1<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD4.wwww, _LightSplitsNear);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlatb1 = lessThan(vs_TEXCOORD4.wwww, _LightSplitsFar);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat0.z;
    u_xlat16_3 = (-_LightShadowData.x) + 1.0;
    u_xlat16_3 = (u_xlatb0.x) ? 0.0 : u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 + _LightShadowData.x;
    u_xlat0.x = vs_TEXCOORD4.w * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = (-vs_TEXCOORD4.w) * _ProjectionParams.w + 1.0;
    u_xlat2.xy = u_xlat2.xx * vec2(1.0, 255.0);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
    u_xlat0.w = u_xlat2.y;
    u_xlat0.y = 1.0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat0.x);
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD5.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0.x = u_xlat16_1<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat0.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb0 = lessThan(u_xlat0, unity_ShadowSplitSqRadii);
    u_xlat2.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat2.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat2.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat3.xyz = u_xlat2.xyz + u_xlat0.yzw;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat3.xxx * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat3.yyy + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat0.z;
    u_xlat16_1 = (-_LightShadowData.x) + 1.0;
    u_xlat16_1 = (u_xlatb0.x) ? 0.0 : u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 + _LightShadowData.x;
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat16_1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = (-vs_TEXCOORD4.w) * _ProjectionParams.w + 1.0;
    u_xlat2.xy = u_xlat2.xx * vec2(1.0, 255.0);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
    u_xlat0.w = u_xlat2.y;
    u_xlat0.y = 1.0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat0.x);
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD5.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0.x = u_xlat16_1<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat0.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb0 = lessThan(u_xlat0, unity_ShadowSplitSqRadii);
    u_xlat2.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat2.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat2.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat3.xyz = u_xlat2.xyz + u_xlat0.yzw;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat3.xxx * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat3.yyy + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat0.z;
    u_xlat16_1 = (-_LightShadowData.x) + 1.0;
    u_xlat16_1 = (u_xlatb0.x) ? 0.0 : u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 + _LightShadowData.x;
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat16_1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = (-vs_TEXCOORD4.w) * _ProjectionParams.w + 1.0;
    u_xlat2.xy = u_xlat2.xx * vec2(1.0, 255.0);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
    u_xlat0.w = u_xlat2.y;
    u_xlat0.y = 1.0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat0.x);
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD5.xy).w;
    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
    u_xlatb0.x = u_xlat16_1<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat0.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb0 = lessThan(u_xlat0, unity_ShadowSplitSqRadii);
    u_xlat2.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat2.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat2.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat3.xyz = u_xlat2.xyz + u_xlat0.yzw;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat3.xxx * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat3.yyy + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat0.z;
    u_xlat16_1 = (-_LightShadowData.x) + 1.0;
    u_xlat16_1 = (u_xlatb0.x) ? 0.0 : u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 + _LightShadowData.x;
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat16_1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = (-vs_TEXCOORD4.w) * _ProjectionParams.w + 1.0;
    u_xlat2.xy = u_xlat2.xx * vec2(1.0, 255.0);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
    u_xlat0.w = u_xlat2.y;
    u_xlat0.y = 1.0;
    SV_Target0 = u_xlat0;
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
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
}
}
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "RenderType" = "TransparentCutout" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "RenderType" = "TransparentCutout" }
  AlphaToMask On
  Offset -1, -1
  GpuProgramID 334144
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_2.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_2.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_2.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = u_xlat32 * 0.5;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat31;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = u_xlat32 * 0.5;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat31;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = u_xlat32 * 0.5;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat31;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat32;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat31 = max(u_xlat31, 0.0);
        u_xlat16_38 = u_xlat31 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_38 = u_xlat16_38 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
        u_xlat16_37 = u_xlat16_37 * u_xlat16_38;
        u_xlat16_37 = u_xlat16_37 * 0.5;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat32;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat31 = max(u_xlat31, 0.0);
        u_xlat16_38 = u_xlat31 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_38 = u_xlat16_38 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
        u_xlat16_37 = u_xlat16_37 * u_xlat16_38;
        u_xlat16_37 = u_xlat16_37 * 0.5;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat32;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat31 = max(u_xlat31, 0.0);
        u_xlat16_38 = u_xlat31 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_38 = u_xlat16_38 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
        u_xlat16_37 = u_xlat16_37 * u_xlat16_38;
        u_xlat16_37 = u_xlat16_37 * 0.5;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_2.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_2.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_2.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = u_xlat32 * 0.5;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat31;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = u_xlat32 * 0.5;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat31;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = u_xlat32 * 0.5;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat31;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat32;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat31 = max(u_xlat31, 0.0);
        u_xlat16_38 = u_xlat31 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_38 = u_xlat16_38 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
        u_xlat16_37 = u_xlat16_37 * u_xlat16_38;
        u_xlat16_37 = u_xlat16_37 * 0.5;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat32;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat31 = max(u_xlat31, 0.0);
        u_xlat16_38 = u_xlat31 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_38 = u_xlat16_38 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
        u_xlat16_37 = u_xlat16_37 * u_xlat16_38;
        u_xlat16_37 = u_xlat16_37 * 0.5;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb13;
float u_xlat30;
int u_xlati30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat32 = unity_LightAtten[u_xlati_loop_1].z * u_xlat31 + 1.0;
        u_xlat32 = float(1.0) / u_xlat32;
        u_xlatb3 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat31;
        u_xlatb3 = u_xlatb13 && u_xlatb3;
        u_xlat16_37 = (u_xlatb3) ? 0.0 : u_xlat32;
        u_xlat31 = max(u_xlat31, 9.99999997e-07);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
        u_xlat31 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat31 = max(u_xlat31, 0.0);
        u_xlat16_38 = u_xlat31 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_38 = u_xlat16_38 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
        u_xlat16_37 = u_xlat16_37 * u_xlat16_38;
        u_xlat16_37 = u_xlat16_37 * 0.5;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_38 = max(u_xlat16_38, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_38) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_37) * u_xlat16_9.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = _Cutoff>=u_xlat16_0.w;
    if(((int(u_xlatb1) * -1))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
}
}
}
}