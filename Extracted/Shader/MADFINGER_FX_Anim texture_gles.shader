//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/FX/Anim texture" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_NumTexTiles ("Num tex tiles", Vector) = (4,4,0,0)
_ReplaySpeed ("Replay speed - FPS", Float) = 4
_Color ("Color", Color) = (1,1,1,1)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 32580
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _NumTexTiles;
uniform 	float _ReplaySpeed;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
float u_xlat3;
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
    u_xlat0.x = in_COLOR0.w * 60.0 + _Time.y;
    u_xlat3 = u_xlat0.x * _ReplaySpeed;
    u_xlat1.x = floor(u_xlat3);
    u_xlat3 = u_xlat1.x + 1.0;
    u_xlat3 = u_xlat3 / _NumTexTiles.x;
    u_xlat1.w = floor(u_xlat3);
    u_xlat3 = u_xlat1.x / _NumTexTiles.x;
    u_xlat1.y = floor(u_xlat3);
    u_xlat1.z = u_xlat1.x + 1.0;
    u_xlat2 = u_xlat1 / _NumTexTiles.xyxy;
    u_xlat0.w = u_xlat0.x * _ReplaySpeed + (-u_xlat1.x);
    u_xlatb1 = greaterThanEqual(u_xlat2, (-u_xlat2));
    u_xlat2 = fract(abs(u_xlat2));
    u_xlat1.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
    u_xlat1.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.y);
    u_xlat1.z = (u_xlatb1.z) ? u_xlat2.z : (-u_xlat2.z);
    u_xlat1.w = (u_xlatb1.w) ? u_xlat2.w : (-u_xlat2.w);
    u_xlat1 = u_xlat1 * _NumTexTiles.xyxy + in_TEXCOORD0.xyxy;
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / _NumTexTiles.xyxy;
    vs_TEXCOORD0 = u_xlat1 * u_xlat2;
    u_xlat0.xyz = in_COLOR0.xyz * _Color.xyz;
    vs_COLOR0 = u_xlat0;
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
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.zw);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 + (-u_xlat10_1);
    u_xlat16_0 = vs_COLOR0.wwww * u_xlat16_0 + u_xlat10_1;
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _NumTexTiles;
uniform 	float _ReplaySpeed;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
float u_xlat3;
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
    u_xlat0.x = in_COLOR0.w * 60.0 + _Time.y;
    u_xlat3 = u_xlat0.x * _ReplaySpeed;
    u_xlat1.x = floor(u_xlat3);
    u_xlat3 = u_xlat1.x + 1.0;
    u_xlat3 = u_xlat3 / _NumTexTiles.x;
    u_xlat1.w = floor(u_xlat3);
    u_xlat3 = u_xlat1.x / _NumTexTiles.x;
    u_xlat1.y = floor(u_xlat3);
    u_xlat1.z = u_xlat1.x + 1.0;
    u_xlat2 = u_xlat1 / _NumTexTiles.xyxy;
    u_xlat0.w = u_xlat0.x * _ReplaySpeed + (-u_xlat1.x);
    u_xlatb1 = greaterThanEqual(u_xlat2, (-u_xlat2));
    u_xlat2 = fract(abs(u_xlat2));
    u_xlat1.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
    u_xlat1.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.y);
    u_xlat1.z = (u_xlatb1.z) ? u_xlat2.z : (-u_xlat2.z);
    u_xlat1.w = (u_xlatb1.w) ? u_xlat2.w : (-u_xlat2.w);
    u_xlat1 = u_xlat1 * _NumTexTiles.xyxy + in_TEXCOORD0.xyxy;
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / _NumTexTiles.xyxy;
    vs_TEXCOORD0 = u_xlat1 * u_xlat2;
    u_xlat0.xyz = in_COLOR0.xyz * _Color.xyz;
    vs_COLOR0 = u_xlat0;
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
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.zw);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 + (-u_xlat10_1);
    u_xlat16_0 = vs_COLOR0.wwww * u_xlat16_0 + u_xlat10_1;
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _NumTexTiles;
uniform 	float _ReplaySpeed;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
float u_xlat3;
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
    u_xlat0.x = in_COLOR0.w * 60.0 + _Time.y;
    u_xlat3 = u_xlat0.x * _ReplaySpeed;
    u_xlat1.x = floor(u_xlat3);
    u_xlat3 = u_xlat1.x + 1.0;
    u_xlat3 = u_xlat3 / _NumTexTiles.x;
    u_xlat1.w = floor(u_xlat3);
    u_xlat3 = u_xlat1.x / _NumTexTiles.x;
    u_xlat1.y = floor(u_xlat3);
    u_xlat1.z = u_xlat1.x + 1.0;
    u_xlat2 = u_xlat1 / _NumTexTiles.xyxy;
    u_xlat0.w = u_xlat0.x * _ReplaySpeed + (-u_xlat1.x);
    u_xlatb1 = greaterThanEqual(u_xlat2, (-u_xlat2));
    u_xlat2 = fract(abs(u_xlat2));
    u_xlat1.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
    u_xlat1.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.y);
    u_xlat1.z = (u_xlatb1.z) ? u_xlat2.z : (-u_xlat2.z);
    u_xlat1.w = (u_xlatb1.w) ? u_xlat2.w : (-u_xlat2.w);
    u_xlat1 = u_xlat1 * _NumTexTiles.xyxy + in_TEXCOORD0.xyxy;
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / _NumTexTiles.xyxy;
    vs_TEXCOORD0 = u_xlat1 * u_xlat2;
    u_xlat0.xyz = in_COLOR0.xyz * _Color.xyz;
    vs_COLOR0 = u_xlat0;
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
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.zw);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 + (-u_xlat10_1);
    u_xlat16_0 = vs_COLOR0.wwww * u_xlat16_0 + u_xlat10_1;
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    SV_Target0 = u_xlat16_0;
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