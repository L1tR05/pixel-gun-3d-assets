//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Transparent Packed" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" { }
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  Offset -1, -1
  GpuProgramID 22707
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat16_0 = vs_COLOR0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_0 = ceil(u_xlat16_0);
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xy = u_xlat16_0.xy * u_xlat10_1.xy;
    u_xlat16_2.x = u_xlat16_2.y + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat10_1.z * u_xlat16_0.z + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat10_1.w * u_xlat16_0.w + u_xlat16_2.x;
    u_xlat16_0 = u_xlat16_0 * vec4(0.50999999, 0.50999999, 0.50999999, 0.50999999) + (-vs_COLOR0);
    u_xlat16_0 = u_xlat16_0 * vec4(-2.04081631, -2.04081631, -2.04081631, -2.04081631);
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    SV_Target0.w = u_xlat16_2.x * u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
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
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat16_0 = vs_COLOR0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_0 = ceil(u_xlat16_0);
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xy = u_xlat16_0.xy * u_xlat10_1.xy;
    u_xlat16_2.x = u_xlat16_2.y + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat10_1.z * u_xlat16_0.z + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat10_1.w * u_xlat16_0.w + u_xlat16_2.x;
    u_xlat16_0 = u_xlat16_0 * vec4(0.50999999, 0.50999999, 0.50999999, 0.50999999) + (-vs_COLOR0);
    u_xlat16_0 = u_xlat16_0 * vec4(-2.04081631, -2.04081631, -2.04081631, -2.04081631);
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    SV_Target0.w = u_xlat16_2.x * u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
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
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat16_0 = vs_COLOR0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_0 = ceil(u_xlat16_0);
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xy = u_xlat16_0.xy * u_xlat10_1.xy;
    u_xlat16_2.x = u_xlat16_2.y + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat10_1.z * u_xlat16_0.z + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat10_1.w * u_xlat16_0.w + u_xlat16_2.x;
    u_xlat16_0 = u_xlat16_0 * vec4(0.50999999, 0.50999999, 0.50999999, 0.50999999) + (-vs_COLOR0);
    u_xlat16_0 = u_xlat16_0 * vec4(-2.04081631, -2.04081631, -2.04081631, -2.04081631);
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    SV_Target0.w = u_xlat16_2.x * u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
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