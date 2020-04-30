//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Transparent Black Colored 1" {
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
  GpuProgramID 35863
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRange0;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
highp  vec4 phase0_Output0_3;
varying highp vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD1.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    phase0_Output0_3 = in_TEXCOORD0.xyxy + vec4(0.0, 0.00800000038, 0.0, -0.00800000038);
vs_TEXCOORD3 = phase0_Output0_3.xy;
vs_TEXCOORD2 = phase0_Output0_3.zw;
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
uniform 	vec2 _ClipArgs0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
mediump float u_xlat16_1;
lowp float u_xlat10_2;
void main()
{
    u_xlat0.xy = -abs(vs_TEXCOORD1.xy) + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat10_2 * 0.699999988;
    u_xlat0.x = u_xlat0.x * u_xlat16_1;
    SV_Target0.w = u_xlat0.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD3.xy).x;
    u_xlat16_1 = u_xlat10_0 + 0.0500000119;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy).x;
    SV_Target0.xyz = (-vec3(u_xlat10_0)) + vec3(u_xlat16_1);
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
uniform 	vec4 _ClipRange0;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
highp  vec4 phase0_Output0_3;
varying highp vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD1.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    phase0_Output0_3 = in_TEXCOORD0.xyxy + vec4(0.0, 0.00800000038, 0.0, -0.00800000038);
vs_TEXCOORD3 = phase0_Output0_3.xy;
vs_TEXCOORD2 = phase0_Output0_3.zw;
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
uniform 	vec2 _ClipArgs0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
mediump float u_xlat16_1;
lowp float u_xlat10_2;
void main()
{
    u_xlat0.xy = -abs(vs_TEXCOORD1.xy) + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat10_2 * 0.699999988;
    u_xlat0.x = u_xlat0.x * u_xlat16_1;
    SV_Target0.w = u_xlat0.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD3.xy).x;
    u_xlat16_1 = u_xlat10_0 + 0.0500000119;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy).x;
    SV_Target0.xyz = (-vec3(u_xlat10_0)) + vec3(u_xlat16_1);
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
uniform 	vec4 _ClipRange0;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
highp  vec4 phase0_Output0_3;
varying highp vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD1.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    phase0_Output0_3 = in_TEXCOORD0.xyxy + vec4(0.0, 0.00800000038, 0.0, -0.00800000038);
vs_TEXCOORD3 = phase0_Output0_3.xy;
vs_TEXCOORD2 = phase0_Output0_3.zw;
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
uniform 	vec2 _ClipArgs0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
mediump float u_xlat16_1;
lowp float u_xlat10_2;
void main()
{
    u_xlat0.xy = -abs(vs_TEXCOORD1.xy) + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat10_2 * 0.699999988;
    u_xlat0.x = u_xlat0.x * u_xlat16_1;
    SV_Target0.w = u_xlat0.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD3.xy).x;
    u_xlat16_1 = u_xlat10_0 + 0.0500000119;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy).x;
    SV_Target0.xyz = (-vec3(u_xlat10_0)) + vec3(u_xlat16_1);
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
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 77046
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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