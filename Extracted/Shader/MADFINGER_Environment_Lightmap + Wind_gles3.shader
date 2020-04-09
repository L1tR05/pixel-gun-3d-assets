//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Environment/Lightmap + Wind" {
Properties {
_MainTex ("Base (RGB) Gloss (A)", 2D) = "white" { }
_Wind ("Wind params", Vector) = (1,1,1,1)
_WindEdgeFlutter ("Wind edge fultter factor", Float) = 0.5
_WindEdgeFlutterFreqScale ("Wind edge fultter freq scale", Float) = 0.5
}
SubShader {
 LOD 100
 Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 58031
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Wind;
uniform 	vec4 _MainTex_ST;
uniform 	float _WindEdgeFlutter;
uniform 	float _WindEdgeFlutterFreqScale;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].w;
    u_xlat0.y = hlslcc_mtx4x4unity_ObjectToWorld[1].w;
    u_xlat0.z = hlslcc_mtx4x4unity_ObjectToWorld[2].w;
    u_xlat0.y = dot(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat8 = u_xlat0.y + _WindEdgeFlutter;
    u_xlat0.x = dot(in_POSITION0.xyz, vec3(u_xlat8));
    u_xlat0 = _Time.yyyy * vec4(vec4(_WindEdgeFlutterFreqScale, _WindEdgeFlutterFreqScale, _WindEdgeFlutterFreqScale, _WindEdgeFlutterFreqScale)) + u_xlat0.xxyy;
    u_xlat0 = u_xlat0 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1 = abs(u_xlat0) * abs(u_xlat0);
    u_xlat0 = -abs(u_xlat0) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0.xyz = u_xlat0.ywy + u_xlat0.xzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * _Wind.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _Wind.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _Wind.zzz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_COLOR0.www;
    u_xlat12 = _WindEdgeFlutter * 0.100000001;
    u_xlat3.xz = vec2(u_xlat12) * in_NORMAL0.xz;
    u_xlat3.y = in_COLOR0.w * 0.300000012;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat12 = in_COLOR0.w * _Wind.w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + in_POSITION0.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2.xyz = in_COLOR0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Wind;
uniform 	vec4 _MainTex_ST;
uniform 	float _WindEdgeFlutter;
uniform 	float _WindEdgeFlutterFreqScale;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].w;
    u_xlat0.y = hlslcc_mtx4x4unity_ObjectToWorld[1].w;
    u_xlat0.z = hlslcc_mtx4x4unity_ObjectToWorld[2].w;
    u_xlat0.y = dot(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat8 = u_xlat0.y + _WindEdgeFlutter;
    u_xlat0.x = dot(in_POSITION0.xyz, vec3(u_xlat8));
    u_xlat0 = _Time.yyyy * vec4(vec4(_WindEdgeFlutterFreqScale, _WindEdgeFlutterFreqScale, _WindEdgeFlutterFreqScale, _WindEdgeFlutterFreqScale)) + u_xlat0.xxyy;
    u_xlat0 = u_xlat0 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1 = abs(u_xlat0) * abs(u_xlat0);
    u_xlat0 = -abs(u_xlat0) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0.xyz = u_xlat0.ywy + u_xlat0.xzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * _Wind.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _Wind.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _Wind.zzz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_COLOR0.www;
    u_xlat12 = _WindEdgeFlutter * 0.100000001;
    u_xlat3.xz = vec2(u_xlat12) * in_NORMAL0.xz;
    u_xlat3.y = in_COLOR0.w * 0.300000012;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat12 = in_COLOR0.w * _Wind.w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + in_POSITION0.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2.xyz = in_COLOR0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Wind;
uniform 	vec4 _MainTex_ST;
uniform 	float _WindEdgeFlutter;
uniform 	float _WindEdgeFlutterFreqScale;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].w;
    u_xlat0.y = hlslcc_mtx4x4unity_ObjectToWorld[1].w;
    u_xlat0.z = hlslcc_mtx4x4unity_ObjectToWorld[2].w;
    u_xlat0.y = dot(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat8 = u_xlat0.y + _WindEdgeFlutter;
    u_xlat0.x = dot(in_POSITION0.xyz, vec3(u_xlat8));
    u_xlat0 = _Time.yyyy * vec4(vec4(_WindEdgeFlutterFreqScale, _WindEdgeFlutterFreqScale, _WindEdgeFlutterFreqScale, _WindEdgeFlutterFreqScale)) + u_xlat0.xxyy;
    u_xlat0 = u_xlat0 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1 = abs(u_xlat0) * abs(u_xlat0);
    u_xlat0 = -abs(u_xlat0) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0.xyz = u_xlat0.ywy + u_xlat0.xzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * _Wind.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _Wind.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _Wind.zzz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_COLOR0.www;
    u_xlat12 = _WindEdgeFlutter * 0.100000001;
    u_xlat3.xz = vec2(u_xlat12) * in_NORMAL0.xz;
    u_xlat3.y = in_COLOR0.w * 0.300000012;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat12 = in_COLOR0.w * _Wind.w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + in_POSITION0.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2.xyz = in_COLOR0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
}
}
}
}