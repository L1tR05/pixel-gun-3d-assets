//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Dissolve" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" { }
_DissolveTex ("DissolveTex (RGB))", 2D) = "black" { }
_Color ("Color", Color) = (1,1,1,1)
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 38820
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = texture(_DissolveTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.xy = vs_COLOR0.xx + vec2(0.100000001, 0.200000003);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat0>=u_xlat16_1.x);
#else
    u_xlatb3 = u_xlat0>=u_xlat16_1.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.y>=u_xlat0);
#else
    u_xlatb0 = u_xlat16_1.y>=u_xlat0;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.x = (u_xlatb3) ? -1.0 : -0.0;
    u_xlat16_2.xyz = (bool(u_xlatb3)) ? _Color.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_4.xxx + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = texture(_DissolveTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.xy = vs_COLOR0.xx + vec2(0.100000001, 0.200000003);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat0>=u_xlat16_1.x);
#else
    u_xlatb3 = u_xlat0>=u_xlat16_1.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.y>=u_xlat0);
#else
    u_xlatb0 = u_xlat16_1.y>=u_xlat0;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.x = (u_xlatb3) ? -1.0 : -0.0;
    u_xlat16_2.xyz = (bool(u_xlatb3)) ? _Color.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_4.xxx + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = texture(_DissolveTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.xy = vs_COLOR0.xx + vec2(0.100000001, 0.200000003);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat0>=u_xlat16_1.x);
#else
    u_xlatb3 = u_xlat0>=u_xlat16_1.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.y>=u_xlat0);
#else
    u_xlatb0 = u_xlat16_1.y>=u_xlat0;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.x = (u_xlatb3) ? -1.0 : -0.0;
    u_xlat16_2.xyz = (bool(u_xlatb3)) ? _Color.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_4.xxx + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
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