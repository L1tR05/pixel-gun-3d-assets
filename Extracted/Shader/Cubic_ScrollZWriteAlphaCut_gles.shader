//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Cubic/ScrollZWriteAlphaCut" {
Properties {
_MainTex ("Albedo (RGB)", 2D) = "white" { }
_CutOut ("CutOut", Float) = 0.01
_ScrollX ("Base layer Scroll speed X", Float) = 1
_ScrollY ("Base layer Scroll speed Y", Float) = 0
_SineAmplX ("Base layer sine amplitude X", Float) = 0.5
_SineAmplY ("Base layer sine amplitude Y", Float) = 0.5
_SineFreqX ("Base layer sine freq X", Float) = 10
_SineFreqY ("Base layer sine freq Y", Float) = 10
_ColorRili ("Rili Color", Color) = (1,1,1,1)
_Emission ("Emission", Color) = (0,0,0,0)
}
SubShader {
 LOD 150
 Tags { "QUEUE" = "Alphatest+100" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  LOD 150
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Alphatest+100" "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 57833
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_10 = max(u_xlat16_10, 0.0);
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_10 = max(u_xlat16_10, 0.0);
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_10 = max(u_xlat16_10, 0.0);
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat1.xy = sin(u_xlat1.xy);
    u_xlat11.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat11.xy = u_xlat11.xy + u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat11.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat1.xy + u_xlat2.xy;
    vs_TEXCOORD3 = in_COLOR0;
    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_3.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat1.xy = sin(u_xlat1.xy);
    u_xlat11.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat11.xy = u_xlat11.xy + u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat11.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat1.xy + u_xlat2.xy;
    vs_TEXCOORD3 = in_COLOR0;
    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_3.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat1.xy = sin(u_xlat1.xy);
    u_xlat11.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat11.xy = u_xlat11.xy + u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat11.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat1.xy + u_xlat2.xy;
    vs_TEXCOORD3 = in_COLOR0;
    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_3.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_10 = max(u_xlat16_10, 0.0);
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_10 = max(u_xlat16_10, 0.0);
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_10 = max(u_xlat16_10, 0.0);
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat16;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat16.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16.xy = u_xlat16.xy + u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat16.xy;
    u_xlat2.xy = (-u_xlat3.xy) + u_xlat2.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat2.xy + u_xlat3.xy;
    vs_TEXCOORD3 = in_COLOR0;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_3.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat16;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat16.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16.xy = u_xlat16.xy + u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat16.xy;
    u_xlat2.xy = (-u_xlat3.xy) + u_xlat2.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat2.xy + u_xlat3.xy;
    vs_TEXCOORD3 = in_COLOR0;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_3.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat16;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat16.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16.xy = u_xlat16.xy + u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat16.xy;
    u_xlat2.xy = (-u_xlat3.xy) + u_xlat2.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat2.xy + u_xlat3.xy;
    vs_TEXCOORD3 = in_COLOR0;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_3.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_10;
float u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_10 = max(u_xlat16_10, 0.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat11 = vs_TEXCOORD1.w;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat11) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_10;
float u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_10 = max(u_xlat16_10, 0.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat11 = vs_TEXCOORD1.w;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat11) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_10;
float u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_10 = max(u_xlat16_10, 0.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat11 = vs_TEXCOORD1.w;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat11) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat1.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat1.xy = sin(u_xlat1.xy);
    u_xlat11.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat11.xy = u_xlat11.xy + u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat11.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat1.xy + u_xlat2.xy;
    vs_TEXCOORD3 = in_COLOR0;
    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_3.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat1.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat1.xy = sin(u_xlat1.xy);
    u_xlat11.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat11.xy = u_xlat11.xy + u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat11.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat1.xy + u_xlat2.xy;
    vs_TEXCOORD3 = in_COLOR0;
    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_3.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat1.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat1.xy = sin(u_xlat1.xy);
    u_xlat11.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat11.xy = u_xlat11.xy + u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat11.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat1.xy + u_xlat2.xy;
    vs_TEXCOORD3 = in_COLOR0;
    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_3.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_10;
float u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_10 = max(u_xlat16_10, 0.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat11 = vs_TEXCOORD1.w;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat11) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_10;
float u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_10 = max(u_xlat16_10, 0.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat11 = vs_TEXCOORD1.w;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat11) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_10;
float u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_10 = max(u_xlat16_10, 0.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat11 = vs_TEXCOORD1.w;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat11) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat16;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD1.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat16.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16.xy = u_xlat16.xy + u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat16.xy;
    u_xlat2.xy = (-u_xlat3.xy) + u_xlat2.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat2.xy + u_xlat3.xy;
    vs_TEXCOORD3 = in_COLOR0;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_3.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat16;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD1.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat16.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16.xy = u_xlat16.xy + u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat16.xy;
    u_xlat2.xy = (-u_xlat3.xy) + u_xlat2.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat2.xy + u_xlat3.xy;
    vs_TEXCOORD3 = in_COLOR0;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_3.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat16;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD1.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat16.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16.xy = u_xlat16.xy + u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat16.xy;
    u_xlat2.xy = (-u_xlat3.xy) + u_xlat2.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat2.xy + u_xlat3.xy;
    vs_TEXCOORD3 = in_COLOR0;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_3.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat16_0 = u_xlat10_0.w * _ColorRili.w;
    SV_Target0.w = u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + _Emission.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
float u_xlat22;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat22 = vs_TEXCOORD1.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
float u_xlat22;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat22 = vs_TEXCOORD1.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
float u_xlat22;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat22 = vs_TEXCOORD1.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
float u_xlat22;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat22 = vs_TEXCOORD1.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
float u_xlat22;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat22 = vs_TEXCOORD1.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
float u_xlat22;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat22 = vs_TEXCOORD1.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat14 = vs_TEXCOORD1.w;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat16_2.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
float u_xlat22;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat22 = vs_TEXCOORD1.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
float u_xlat22;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat22 = vs_TEXCOORD1.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
uniform 	float _ScrollX;
uniform 	float _ScrollY;
uniform 	float _SineAmplX;
uniform 	float _SineAmplY;
uniform 	float _SineFreqX;
uniform 	float _SineFreqY;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xy = _Time.xx * vec2(_SineFreqX, _SineFreqY);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat4.xy = _Time.xy * vec2(_ScrollX, _ScrollY);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat4.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_SineAmplX, _SineAmplY) + u_xlat4.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat0.xy;
    vs_TEXCOORD2.xy = in_COLOR0.xx * u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _ColorRili;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _CutOut;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_19;
float u_xlat22;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat10_0.w * _ColorRili.w + (-_CutOut);
    u_xlatb2 = u_xlat16_1.x<0.0;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_1.x = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat16_1.x = vs_TEXCOORD0.x * vs_TEXCOORD0.x + (-u_xlat16_1.x);
    u_xlat16_2 = vs_TEXCOORD0.yzzx * vs_TEXCOORD0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _ColorRili.xyz + _Emission.xyz;
    u_xlat0.w = u_xlat10_0.w * _ColorRili.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_19) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + _Emission.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat22 = vs_TEXCOORD1.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
}
}
}
Fallback "Diffuse"
}