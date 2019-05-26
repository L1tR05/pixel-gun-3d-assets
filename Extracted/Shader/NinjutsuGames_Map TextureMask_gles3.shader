//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "NinjutsuGames/Map TextureMask" {
Properties {
_Color ("_Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB)", 2D) = "white" { }
_Circle ("Circle", 2D) = "white" { }
_CirclesOfst ("Circles Offset", Vector) = (0,0,0,0)
_CirclesScl ("Circles Scale", Vector) = (0,0,0,0)
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  Offset -1, -1
  GpuProgramID 22775
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 hlslcc_mtx4x4_Matrix[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
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
    u_xlat0.xy = in_TEXCOORD0.yy * hlslcc_mtx4x4_Matrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4_Matrix[0].xy * in_TEXCOORD0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4_Matrix[2].xy * in_TEXCOORD0.zz + u_xlat0.xy;
    vs_TEXCOORD0.xy = hlslcc_mtx4x4_Matrix[3].xy * in_TEXCOORD0.ww + u_xlat0.xy;
    vs_COLOR0 = _Color;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _Color;
uniform 	vec4 _CirclesScl;
uniform 	vec4 _CirclesOfst;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Circle;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
float u_xlat4;
lowp float u_xlat10_4;
float u_xlat8;
mediump float u_xlat16_8;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy + _CirclesOfst;
    u_xlat0 = u_xlat0 / _CirclesScl.xxyy;
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / _CirclesScl.xxyy;
    u_xlat1 = (-u_xlat1) + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat10_0 = texture(_Circle, u_xlat0.xy).w;
    u_xlat10_4 = texture(_Circle, u_xlat0.zw).w;
    u_xlat16_0 = u_xlat10_0 + -0.189999998;
    u_xlat16_0 = u_xlat16_0 * 99.9999466;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_0 * -2.0 + 3.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_0;
    u_xlat16_0 = (-u_xlat16_8) * u_xlat16_0 + 1.0;
    u_xlat1.xyz = (-vec3(u_xlat16_0));
    u_xlat2.xyz = vec3(u_xlat16_0) * vec3(0.0, 1.0, 0.5);
    u_xlat1.w = -0.0;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat10_3 * _Color;
    u_xlat2.w = u_xlat3.w;
    u_xlat1 = u_xlat1 + u_xlat2.xxyw;
    u_xlat3.w = u_xlat2.z;
    u_xlat1 = u_xlat1 + u_xlat3;
    u_xlat0.x = (-_CirclesScl.z) + 0.790000021;
    u_xlat0.x = (-u_xlat0.x) + u_xlat10_4;
    u_xlat0.y = u_xlat10_4 + -0.879999995;
    u_xlat0.xy = u_xlat0.xy * vec2(100.000099, 100.000099);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat8 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8;
    u_xlat8 = u_xlat0.y * -2.0 + 3.0;
    u_xlat4 = u_xlat0.y * u_xlat0.y;
    u_xlat0.x = u_xlat8 * u_xlat4 + (-u_xlat0.x);
    u_xlat0 = (-u_xlat0.xxxx) + u_xlat1;
    SV_Target0 = u_xlat0;
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
uniform 	mediump vec4 _Color;
uniform 	vec4 hlslcc_mtx4x4_Matrix[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
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
    u_xlat0.xy = in_TEXCOORD0.yy * hlslcc_mtx4x4_Matrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4_Matrix[0].xy * in_TEXCOORD0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4_Matrix[2].xy * in_TEXCOORD0.zz + u_xlat0.xy;
    vs_TEXCOORD0.xy = hlslcc_mtx4x4_Matrix[3].xy * in_TEXCOORD0.ww + u_xlat0.xy;
    vs_COLOR0 = _Color;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _Color;
uniform 	vec4 _CirclesScl;
uniform 	vec4 _CirclesOfst;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Circle;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
float u_xlat4;
lowp float u_xlat10_4;
float u_xlat8;
mediump float u_xlat16_8;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy + _CirclesOfst;
    u_xlat0 = u_xlat0 / _CirclesScl.xxyy;
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / _CirclesScl.xxyy;
    u_xlat1 = (-u_xlat1) + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat10_0 = texture(_Circle, u_xlat0.xy).w;
    u_xlat10_4 = texture(_Circle, u_xlat0.zw).w;
    u_xlat16_0 = u_xlat10_0 + -0.189999998;
    u_xlat16_0 = u_xlat16_0 * 99.9999466;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_0 * -2.0 + 3.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_0;
    u_xlat16_0 = (-u_xlat16_8) * u_xlat16_0 + 1.0;
    u_xlat1.xyz = (-vec3(u_xlat16_0));
    u_xlat2.xyz = vec3(u_xlat16_0) * vec3(0.0, 1.0, 0.5);
    u_xlat1.w = -0.0;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat10_3 * _Color;
    u_xlat2.w = u_xlat3.w;
    u_xlat1 = u_xlat1 + u_xlat2.xxyw;
    u_xlat3.w = u_xlat2.z;
    u_xlat1 = u_xlat1 + u_xlat3;
    u_xlat0.x = (-_CirclesScl.z) + 0.790000021;
    u_xlat0.x = (-u_xlat0.x) + u_xlat10_4;
    u_xlat0.y = u_xlat10_4 + -0.879999995;
    u_xlat0.xy = u_xlat0.xy * vec2(100.000099, 100.000099);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat8 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8;
    u_xlat8 = u_xlat0.y * -2.0 + 3.0;
    u_xlat4 = u_xlat0.y * u_xlat0.y;
    u_xlat0.x = u_xlat8 * u_xlat4 + (-u_xlat0.x);
    u_xlat0 = (-u_xlat0.xxxx) + u_xlat1;
    SV_Target0 = u_xlat0;
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
uniform 	mediump vec4 _Color;
uniform 	vec4 hlslcc_mtx4x4_Matrix[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
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
    u_xlat0.xy = in_TEXCOORD0.yy * hlslcc_mtx4x4_Matrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4_Matrix[0].xy * in_TEXCOORD0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4_Matrix[2].xy * in_TEXCOORD0.zz + u_xlat0.xy;
    vs_TEXCOORD0.xy = hlslcc_mtx4x4_Matrix[3].xy * in_TEXCOORD0.ww + u_xlat0.xy;
    vs_COLOR0 = _Color;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _Color;
uniform 	vec4 _CirclesScl;
uniform 	vec4 _CirclesOfst;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Circle;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
float u_xlat4;
lowp float u_xlat10_4;
float u_xlat8;
mediump float u_xlat16_8;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy + _CirclesOfst;
    u_xlat0 = u_xlat0 / _CirclesScl.xxyy;
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / _CirclesScl.xxyy;
    u_xlat1 = (-u_xlat1) + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat10_0 = texture(_Circle, u_xlat0.xy).w;
    u_xlat10_4 = texture(_Circle, u_xlat0.zw).w;
    u_xlat16_0 = u_xlat10_0 + -0.189999998;
    u_xlat16_0 = u_xlat16_0 * 99.9999466;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_0 * -2.0 + 3.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_0;
    u_xlat16_0 = (-u_xlat16_8) * u_xlat16_0 + 1.0;
    u_xlat1.xyz = (-vec3(u_xlat16_0));
    u_xlat2.xyz = vec3(u_xlat16_0) * vec3(0.0, 1.0, 0.5);
    u_xlat1.w = -0.0;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat10_3 * _Color;
    u_xlat2.w = u_xlat3.w;
    u_xlat1 = u_xlat1 + u_xlat2.xxyw;
    u_xlat3.w = u_xlat2.z;
    u_xlat1 = u_xlat1 + u_xlat3;
    u_xlat0.x = (-_CirclesScl.z) + 0.790000021;
    u_xlat0.x = (-u_xlat0.x) + u_xlat10_4;
    u_xlat0.y = u_xlat10_4 + -0.879999995;
    u_xlat0.xy = u_xlat0.xy * vec2(100.000099, 100.000099);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat8 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8;
    u_xlat8 = u_xlat0.y * -2.0 + 3.0;
    u_xlat4 = u_xlat0.y * u_xlat0.y;
    u_xlat0.x = u_xlat8 * u_xlat4 + (-u_xlat0.x);
    u_xlat0 = (-u_xlat0.xxxx) + u_xlat1;
    SV_Target0 = u_xlat0;
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