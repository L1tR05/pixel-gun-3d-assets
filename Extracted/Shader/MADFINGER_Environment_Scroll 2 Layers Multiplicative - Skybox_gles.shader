//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Environment/Scroll 2 Layers Multiplicative - Skybox" {
Properties {
_MainTex ("Base layer (RGB)", 2D) = "white" { }
_DetailTex ("2nd layer (RGB)", 2D) = "white" { }
_ScrollX ("Base layer Scroll speed X", Float) = 1
_ScrollY ("Base layer Scroll speed Y", Float) = 0
_Scroll2X ("2nd layer Scroll speed X", Float) = 1
_Scroll2Y ("2nd layer Scroll speed Y", Float) = 0
_AMultiplier ("Layer Multiplier", Float) = 0.5
_Color ("Color", Color) = (1,1,1,1)
}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Geometry+10" "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "Geometry+10" "RenderType" = "Opaque" }
  ZWrite Off
  GpuProgramID 7393
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _Scroll2X;
uniform 	float _Scroll2Y;
uniform 	float _AMultiplier;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = _Time.xyxy * vec4(_ScrollX, _ScrollY, _Scroll2X, _Scroll2Y);
    u_xlat1 = fract(u_xlat1);
    vs_TEXCOORD0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.zw + u_xlat0.xy;
    vs_TEXCOORD2 = vec4(_AMultiplier);
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
uniform lowp sampler2D _DetailTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
    u_xlat16_0 = u_xlat16_0 * vs_TEXCOORD2;
    SV_Target0 = u_xlat16_0 * _Color;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _Scroll2X;
uniform 	float _Scroll2Y;
uniform 	float _AMultiplier;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = _Time.xyxy * vec4(_ScrollX, _ScrollY, _Scroll2X, _Scroll2Y);
    u_xlat1 = fract(u_xlat1);
    vs_TEXCOORD0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.zw + u_xlat0.xy;
    vs_TEXCOORD2 = vec4(_AMultiplier);
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
uniform lowp sampler2D _DetailTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
    u_xlat16_0 = u_xlat16_0 * vs_TEXCOORD2;
    SV_Target0 = u_xlat16_0 * _Color;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _Scroll2X;
uniform 	float _Scroll2Y;
uniform 	float _AMultiplier;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = _Time.xyxy * vec4(_ScrollX, _ScrollY, _Scroll2X, _Scroll2Y);
    u_xlat1 = fract(u_xlat1);
    vs_TEXCOORD0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.zw + u_xlat0.xy;
    vs_TEXCOORD2 = vec4(_AMultiplier);
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
uniform lowp sampler2D _DetailTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
    u_xlat16_0 = u_xlat16_0 * vs_TEXCOORD2;
    SV_Target0 = u_xlat16_0 * _Color;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _Scroll2X;
uniform 	float _Scroll2Y;
uniform 	float _AMultiplier;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = _Time.xyxy * vec4(_ScrollX, _ScrollY, _Scroll2X, _Scroll2Y);
    u_xlat1 = fract(u_xlat1);
    vs_TEXCOORD0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.zw + u_xlat0.xy;
    vs_TEXCOORD2 = vec4(_AMultiplier);
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
uniform lowp sampler2D _DetailTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
    u_xlat16_0 = u_xlat16_0 * vs_TEXCOORD2;
    SV_Target0 = u_xlat16_0 * _Color;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _Scroll2X;
uniform 	float _Scroll2Y;
uniform 	float _AMultiplier;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = _Time.xyxy * vec4(_ScrollX, _ScrollY, _Scroll2X, _Scroll2Y);
    u_xlat1 = fract(u_xlat1);
    vs_TEXCOORD0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.zw + u_xlat0.xy;
    vs_TEXCOORD2 = vec4(_AMultiplier);
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
uniform lowp sampler2D _DetailTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
    u_xlat16_0 = u_xlat16_0 * vs_TEXCOORD2;
    SV_Target0 = u_xlat16_0 * _Color;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _Scroll2X;
uniform 	float _Scroll2Y;
uniform 	float _AMultiplier;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = _Time.xyxy * vec4(_ScrollX, _ScrollY, _Scroll2X, _Scroll2Y);
    u_xlat1 = fract(u_xlat1);
    vs_TEXCOORD0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.zw + u_xlat0.xy;
    vs_TEXCOORD2 = vec4(_AMultiplier);
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
uniform lowp sampler2D _DetailTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
    u_xlat16_0 = u_xlat16_0 * vs_TEXCOORD2;
    SV_Target0 = u_xlat16_0 * _Color;
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
}
}
}
}