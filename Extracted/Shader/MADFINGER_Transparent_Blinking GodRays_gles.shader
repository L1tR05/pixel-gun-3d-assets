//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Transparent/Blinking GodRays" {
Properties {
_MainTex ("Base texture", 2D) = "white" { }
_FadeOutDistNear ("Near fadeout dist", Float) = 10
_FadeOutDistFar ("Far fadeout dist", Float) = 10000
_Multiplier ("Color multiplier", Float) = 1
_Bias ("Bias", Float) = 0
_TimeOnDuration ("ON duration", Float) = 0.5
_TimeOffDuration ("OFF duration", Float) = 0.5
_BlinkingTimeOffsScale ("Blinking time offset scale (seconds)", Float) = 5
_SizeGrowStartDist ("Size grow start dist", Float) = 5
_SizeGrowEndDist ("Size grow end dist", Float) = 50
_MaxGrowSize ("Max grow size", Float) = 2.5
_NoiseAmount ("Noise amount (when zero, pulse wave is used)", Range(0, 0.5)) = 0
_Color ("Color", Color) = (1,1,1,1)
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 22975
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FadeOutDistNear;
uniform 	float _FadeOutDistFar;
uniform 	float _Multiplier;
uniform 	float _Bias;
uniform 	float _TimeOnDuration;
uniform 	float _TimeOffDuration;
uniform 	float _BlinkingTimeOffsScale;
uniform 	float _SizeGrowStartDist;
uniform 	float _SizeGrowEndDist;
uniform 	float _MaxGrowSize;
uniform 	float _NoiseAmount;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
bool u_xlatb10;
void main()
{
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
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat3.x = u_xlat0.x + (-_SizeGrowStartDist);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = u_xlat3.x / _SizeGrowEndDist;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * _MaxGrowSize;
    u_xlat3.x = u_xlat3.x * in_COLOR0.w;
    u_xlat3.xyz = u_xlat3.xxx * in_NORMAL0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat3.x = u_xlat0.x + (-_FadeOutDistFar);
    u_xlat0.x = u_xlat0.x / _FadeOutDistNear;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = u_xlat3.x * 0.200000003;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat0.y = (-u_xlat3.x) + 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * _Color;
    u_xlat0 = u_xlat0 * vec4(vec4(_Multiplier, _Multiplier, _Multiplier, _Multiplier));
    u_xlat1.x = _BlinkingTimeOffsScale * in_COLOR0.z + _Time.y;
    u_xlat4.x = _TimeOffDuration + _TimeOnDuration;
    u_xlat7 = u_xlat1.x / u_xlat4.x;
    u_xlatb10 = u_xlat7>=(-u_xlat7);
    u_xlat7 = fract(abs(u_xlat7));
    u_xlat7 = (u_xlatb10) ? u_xlat7 : (-u_xlat7);
    u_xlat2.xy = vec2(_TimeOnDuration) * vec2(0.25, 0.75);
    u_xlat4.z = u_xlat7 * u_xlat4.x + (-u_xlat2.y);
    u_xlat4.x = u_xlat4.x * u_xlat7;
    u_xlat7 = float(1.0) / u_xlat2.x;
    u_xlat4.xz = vec2(u_xlat7) * u_xlat4.xz;
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
    u_xlat7 = u_xlat4.z * -2.0 + 3.0;
    u_xlat10 = u_xlat4.z * u_xlat4.z;
    u_xlat7 = (-u_xlat7) * u_xlat10 + 1.0;
    u_xlat10 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat10;
    u_xlat4.x = u_xlat7 * u_xlat4.x;
    u_xlat7 = 6.28318548 / _TimeOnDuration;
    u_xlat1.x = u_xlat7 * u_xlat1.x;
    u_xlat7 = u_xlat1.x * 0.636600018 + 56.7271996;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat7 = cos(u_xlat7);
    u_xlat7 = u_xlat7 * 0.5 + 0.5;
    u_xlat1.x = u_xlat7 * u_xlat1.x;
    u_xlat1.x = _NoiseAmount * u_xlat1.x + (-_NoiseAmount);
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlatb7 = _NoiseAmount<0.00999999978;
    u_xlat1.x = (u_xlatb7) ? u_xlat4.x : u_xlat1.x;
    u_xlat1.x = u_xlat1.x + _Bias;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    vs_TEXCOORD1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_TEXCOORD1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FadeOutDistNear;
uniform 	float _FadeOutDistFar;
uniform 	float _Multiplier;
uniform 	float _Bias;
uniform 	float _TimeOnDuration;
uniform 	float _TimeOffDuration;
uniform 	float _BlinkingTimeOffsScale;
uniform 	float _SizeGrowStartDist;
uniform 	float _SizeGrowEndDist;
uniform 	float _MaxGrowSize;
uniform 	float _NoiseAmount;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
bool u_xlatb10;
void main()
{
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
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat3.x = u_xlat0.x + (-_SizeGrowStartDist);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = u_xlat3.x / _SizeGrowEndDist;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * _MaxGrowSize;
    u_xlat3.x = u_xlat3.x * in_COLOR0.w;
    u_xlat3.xyz = u_xlat3.xxx * in_NORMAL0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat3.x = u_xlat0.x + (-_FadeOutDistFar);
    u_xlat0.x = u_xlat0.x / _FadeOutDistNear;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = u_xlat3.x * 0.200000003;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat0.y = (-u_xlat3.x) + 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * _Color;
    u_xlat0 = u_xlat0 * vec4(vec4(_Multiplier, _Multiplier, _Multiplier, _Multiplier));
    u_xlat1.x = _BlinkingTimeOffsScale * in_COLOR0.z + _Time.y;
    u_xlat4.x = _TimeOffDuration + _TimeOnDuration;
    u_xlat7 = u_xlat1.x / u_xlat4.x;
    u_xlatb10 = u_xlat7>=(-u_xlat7);
    u_xlat7 = fract(abs(u_xlat7));
    u_xlat7 = (u_xlatb10) ? u_xlat7 : (-u_xlat7);
    u_xlat2.xy = vec2(_TimeOnDuration) * vec2(0.25, 0.75);
    u_xlat4.z = u_xlat7 * u_xlat4.x + (-u_xlat2.y);
    u_xlat4.x = u_xlat4.x * u_xlat7;
    u_xlat7 = float(1.0) / u_xlat2.x;
    u_xlat4.xz = vec2(u_xlat7) * u_xlat4.xz;
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
    u_xlat7 = u_xlat4.z * -2.0 + 3.0;
    u_xlat10 = u_xlat4.z * u_xlat4.z;
    u_xlat7 = (-u_xlat7) * u_xlat10 + 1.0;
    u_xlat10 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat10;
    u_xlat4.x = u_xlat7 * u_xlat4.x;
    u_xlat7 = 6.28318548 / _TimeOnDuration;
    u_xlat1.x = u_xlat7 * u_xlat1.x;
    u_xlat7 = u_xlat1.x * 0.636600018 + 56.7271996;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat7 = cos(u_xlat7);
    u_xlat7 = u_xlat7 * 0.5 + 0.5;
    u_xlat1.x = u_xlat7 * u_xlat1.x;
    u_xlat1.x = _NoiseAmount * u_xlat1.x + (-_NoiseAmount);
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlatb7 = _NoiseAmount<0.00999999978;
    u_xlat1.x = (u_xlatb7) ? u_xlat4.x : u_xlat1.x;
    u_xlat1.x = u_xlat1.x + _Bias;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    vs_TEXCOORD1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_TEXCOORD1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FadeOutDistNear;
uniform 	float _FadeOutDistFar;
uniform 	float _Multiplier;
uniform 	float _Bias;
uniform 	float _TimeOnDuration;
uniform 	float _TimeOffDuration;
uniform 	float _BlinkingTimeOffsScale;
uniform 	float _SizeGrowStartDist;
uniform 	float _SizeGrowEndDist;
uniform 	float _MaxGrowSize;
uniform 	float _NoiseAmount;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
bool u_xlatb10;
void main()
{
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
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat3.x = u_xlat0.x + (-_SizeGrowStartDist);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = u_xlat3.x / _SizeGrowEndDist;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * _MaxGrowSize;
    u_xlat3.x = u_xlat3.x * in_COLOR0.w;
    u_xlat3.xyz = u_xlat3.xxx * in_NORMAL0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat3.x = u_xlat0.x + (-_FadeOutDistFar);
    u_xlat0.x = u_xlat0.x / _FadeOutDistNear;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = u_xlat3.x * 0.200000003;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat0.y = (-u_xlat3.x) + 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * _Color;
    u_xlat0 = u_xlat0 * vec4(vec4(_Multiplier, _Multiplier, _Multiplier, _Multiplier));
    u_xlat1.x = _BlinkingTimeOffsScale * in_COLOR0.z + _Time.y;
    u_xlat4.x = _TimeOffDuration + _TimeOnDuration;
    u_xlat7 = u_xlat1.x / u_xlat4.x;
    u_xlatb10 = u_xlat7>=(-u_xlat7);
    u_xlat7 = fract(abs(u_xlat7));
    u_xlat7 = (u_xlatb10) ? u_xlat7 : (-u_xlat7);
    u_xlat2.xy = vec2(_TimeOnDuration) * vec2(0.25, 0.75);
    u_xlat4.z = u_xlat7 * u_xlat4.x + (-u_xlat2.y);
    u_xlat4.x = u_xlat4.x * u_xlat7;
    u_xlat7 = float(1.0) / u_xlat2.x;
    u_xlat4.xz = vec2(u_xlat7) * u_xlat4.xz;
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
    u_xlat7 = u_xlat4.z * -2.0 + 3.0;
    u_xlat10 = u_xlat4.z * u_xlat4.z;
    u_xlat7 = (-u_xlat7) * u_xlat10 + 1.0;
    u_xlat10 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat10;
    u_xlat4.x = u_xlat7 * u_xlat4.x;
    u_xlat7 = 6.28318548 / _TimeOnDuration;
    u_xlat1.x = u_xlat7 * u_xlat1.x;
    u_xlat7 = u_xlat1.x * 0.636600018 + 56.7271996;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat7 = cos(u_xlat7);
    u_xlat7 = u_xlat7 * 0.5 + 0.5;
    u_xlat1.x = u_xlat7 * u_xlat1.x;
    u_xlat1.x = _NoiseAmount * u_xlat1.x + (-_NoiseAmount);
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlatb7 = _NoiseAmount<0.00999999978;
    u_xlat1.x = (u_xlatb7) ? u_xlat4.x : u_xlat1.x;
    u_xlat1.x = u_xlat1.x + _Bias;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    vs_TEXCOORD1 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_TEXCOORD1;
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