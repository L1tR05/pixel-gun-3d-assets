//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Unlit/Transparent Masked 3" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" { }
_Mask ("Alpha (A)", 2D) = "white" { }
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
  GpuProgramID 5848
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRange0;
uniform 	vec4 _ClipRange1;
uniform 	vec4 _ClipArgs1;
uniform 	vec4 _ClipRange2;
uniform 	vec4 _ClipArgs2;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.x = in_POSITION0.y * _ClipArgs1.z;
    u_xlat4.x = in_POSITION0.x * _ClipArgs1.w + (-u_xlat0.x);
    u_xlat4.y = dot(in_POSITION0.xy, _ClipArgs1.zw);
    vs_TEXCOORD2.zw = u_xlat4.xy * _ClipRange1.zw + _ClipRange1.xy;
    vs_TEXCOORD2.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
    u_xlat0.x = in_POSITION0.y * _ClipArgs2.z;
    u_xlat0.x = in_POSITION0.x * _ClipArgs2.w + (-u_xlat0.x);
    u_xlat0.y = dot(in_POSITION0.xy, _ClipArgs2.zw);
    vs_TEXCOORD3.xy = u_xlat0.xy * _ClipRange2.zw + _ClipRange2.xy;
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
uniform 	vec4 _ClipArgs0;
uniform 	vec4 _ClipArgs1;
uniform 	vec4 _ClipArgs2;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
void main()
{
    u_xlat0 = -abs(vs_TEXCOORD2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.zw = u_xlat0.zw * _ClipArgs1.xy;
    u_xlat0.xz = min(u_xlat0.yw, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.z, u_xlat0.x);
    u_xlat2.xy = -abs(vs_TEXCOORD3.xy) + vec2(1.0, 1.0);
    u_xlat2.xy = u_xlat2.xy * _ClipArgs2.xy;
    u_xlat2.x = min(u_xlat2.y, u_xlat2.x);
    u_xlat0.x = min(u_xlat2.x, u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat10_2 = texture2D(_Mask, vs_TEXCOORD1.xy).w;
    u_xlat1.w = u_xlat10_2 * u_xlat0.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _ClipRange1;
uniform 	vec4 _ClipArgs1;
uniform 	vec4 _ClipRange2;
uniform 	vec4 _ClipArgs2;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.x = in_POSITION0.y * _ClipArgs1.z;
    u_xlat4.x = in_POSITION0.x * _ClipArgs1.w + (-u_xlat0.x);
    u_xlat4.y = dot(in_POSITION0.xy, _ClipArgs1.zw);
    vs_TEXCOORD2.zw = u_xlat4.xy * _ClipRange1.zw + _ClipRange1.xy;
    vs_TEXCOORD2.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
    u_xlat0.x = in_POSITION0.y * _ClipArgs2.z;
    u_xlat0.x = in_POSITION0.x * _ClipArgs2.w + (-u_xlat0.x);
    u_xlat0.y = dot(in_POSITION0.xy, _ClipArgs2.zw);
    vs_TEXCOORD3.xy = u_xlat0.xy * _ClipRange2.zw + _ClipRange2.xy;
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
uniform 	vec4 _ClipArgs0;
uniform 	vec4 _ClipArgs1;
uniform 	vec4 _ClipArgs2;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
void main()
{
    u_xlat0 = -abs(vs_TEXCOORD2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.zw = u_xlat0.zw * _ClipArgs1.xy;
    u_xlat0.xz = min(u_xlat0.yw, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.z, u_xlat0.x);
    u_xlat2.xy = -abs(vs_TEXCOORD3.xy) + vec2(1.0, 1.0);
    u_xlat2.xy = u_xlat2.xy * _ClipArgs2.xy;
    u_xlat2.x = min(u_xlat2.y, u_xlat2.x);
    u_xlat0.x = min(u_xlat2.x, u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat10_2 = texture2D(_Mask, vs_TEXCOORD1.xy).w;
    u_xlat1.w = u_xlat10_2 * u_xlat0.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _ClipRange1;
uniform 	vec4 _ClipArgs1;
uniform 	vec4 _ClipRange2;
uniform 	vec4 _ClipArgs2;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.x = in_POSITION0.y * _ClipArgs1.z;
    u_xlat4.x = in_POSITION0.x * _ClipArgs1.w + (-u_xlat0.x);
    u_xlat4.y = dot(in_POSITION0.xy, _ClipArgs1.zw);
    vs_TEXCOORD2.zw = u_xlat4.xy * _ClipRange1.zw + _ClipRange1.xy;
    vs_TEXCOORD2.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
    u_xlat0.x = in_POSITION0.y * _ClipArgs2.z;
    u_xlat0.x = in_POSITION0.x * _ClipArgs2.w + (-u_xlat0.x);
    u_xlat0.y = dot(in_POSITION0.xy, _ClipArgs2.zw);
    vs_TEXCOORD3.xy = u_xlat0.xy * _ClipRange2.zw + _ClipRange2.xy;
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
uniform 	vec4 _ClipArgs0;
uniform 	vec4 _ClipArgs1;
uniform 	vec4 _ClipArgs2;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
void main()
{
    u_xlat0 = -abs(vs_TEXCOORD2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.zw = u_xlat0.zw * _ClipArgs1.xy;
    u_xlat0.xz = min(u_xlat0.yw, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.z, u_xlat0.x);
    u_xlat2.xy = -abs(vs_TEXCOORD3.xy) + vec2(1.0, 1.0);
    u_xlat2.xy = u_xlat2.xy * _ClipArgs2.xy;
    u_xlat2.x = min(u_xlat2.y, u_xlat2.x);
    u_xlat0.x = min(u_xlat2.x, u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat10_2 = texture2D(_Mask, vs_TEXCOORD1.xy).w;
    u_xlat1.w = u_xlat10_2 * u_xlat0.x;
    SV_Target0 = u_xlat1;
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