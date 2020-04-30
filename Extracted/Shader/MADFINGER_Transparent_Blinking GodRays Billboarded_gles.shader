//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Transparent/Blinking GodRays Billboarded" {
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
_VerticalBillboarding ("Vertical billboarding amount", Range(0, 1)) = 1
_ViewerOffset ("Viewer offset", Float) = 0
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
  GpuProgramID 1187
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
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
uniform 	float _VerticalBillboarding;
uniform 	float _ViewerOffset;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat1.z = 0.0;
    u_xlat2.xy = (-in_COLOR0.xy) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat2.xy * in_TEXCOORD1.xy;
    u_xlat2.xyz = u_xlat1.xyz + in_POSITION0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat2.xyz);
    u_xlat0.w = u_xlat0.y * _VerticalBillboarding;
    u_xlat6 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat3.xyz = u_xlat0.zxw / vec3(u_xlat6);
    u_xlatb13 = 0.999000013<abs(u_xlat3.z);
    u_xlat4.xyz = (bool(u_xlatb13)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat5.xyz = u_xlat3.zxy * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.zxy * u_xlat3.xyz + (-u_xlat5.xyz);
    u_xlat13 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat4.xyz = vec3(u_xlat13) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat3.xyz * u_xlat4.yzx;
    u_xlat3.xyz = u_xlat3.zxy * u_xlat4.zxy + (-u_xlat5.xyz);
    u_xlat7.xyz = u_xlat1.yyy * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_NORMAL0.yyy;
    u_xlat3.xyz = u_xlat4.xyz * in_NORMAL0.xxx + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.xxx + u_xlat7.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + u_xlat2.xyz;
    u_xlat19 = u_xlat6 + (-_SizeGrowStartDist);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = u_xlat19 / _SizeGrowEndDist;
    u_xlat19 = min(u_xlat19, 1.0);
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * _MaxGrowSize;
    u_xlat19 = u_xlat19 * in_COLOR0.w;
    u_xlat1.xyz = u_xlat3.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat0.xzw = vec3(_ViewerOffset) * u_xlat0.xwz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.wwww + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = u_xlat6 + (-_FadeOutDistFar);
    u_xlat6 = u_xlat6 / _FadeOutDistNear;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.y = u_xlat6 * u_xlat6;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * 0.200000003;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat0 = u_xlat0.xxxx * _Color;
    u_xlat0 = u_xlat0 * vec4(vec4(_Multiplier, _Multiplier, _Multiplier, _Multiplier));
    u_xlat1.x = _BlinkingTimeOffsScale * in_COLOR0.z + _Time.y;
    u_xlat7.x = _TimeOffDuration + _TimeOnDuration;
    u_xlat13 = u_xlat1.x / u_xlat7.x;
    u_xlatb19 = u_xlat13>=(-u_xlat13);
    u_xlat13 = fract(abs(u_xlat13));
    u_xlat13 = (u_xlatb19) ? u_xlat13 : (-u_xlat13);
    u_xlat2.xy = vec2(_TimeOnDuration) * vec2(0.25, 0.75);
    u_xlat7.z = u_xlat13 * u_xlat7.x + (-u_xlat2.y);
    u_xlat7.x = u_xlat7.x * u_xlat13;
    u_xlat13 = float(1.0) / u_xlat2.x;
    u_xlat7.xz = vec2(u_xlat13) * u_xlat7.xz;
    u_xlat7.xz = clamp(u_xlat7.xz, 0.0, 1.0);
    u_xlat13 = u_xlat7.z * -2.0 + 3.0;
    u_xlat19 = u_xlat7.z * u_xlat7.z;
    u_xlat13 = (-u_xlat13) * u_xlat19 + 1.0;
    u_xlat19 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat19;
    u_xlat7.x = u_xlat13 * u_xlat7.x;
    u_xlat13 = 6.28318548 / _TimeOnDuration;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
    u_xlat13 = u_xlat1.x * 0.636600018 + 56.7271996;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat13 = cos(u_xlat13);
    u_xlat13 = u_xlat13 * 0.5 + 0.5;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
    u_xlat1.x = _NoiseAmount * u_xlat1.x + (-_NoiseAmount);
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlatb13 = _NoiseAmount<0.00999999978;
    u_xlat1.x = (u_xlatb13) ? u_xlat7.x : u_xlat1.x;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
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
uniform 	float _VerticalBillboarding;
uniform 	float _ViewerOffset;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat1.z = 0.0;
    u_xlat2.xy = (-in_COLOR0.xy) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat2.xy * in_TEXCOORD1.xy;
    u_xlat2.xyz = u_xlat1.xyz + in_POSITION0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat2.xyz);
    u_xlat0.w = u_xlat0.y * _VerticalBillboarding;
    u_xlat6 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat3.xyz = u_xlat0.zxw / vec3(u_xlat6);
    u_xlatb13 = 0.999000013<abs(u_xlat3.z);
    u_xlat4.xyz = (bool(u_xlatb13)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat5.xyz = u_xlat3.zxy * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.zxy * u_xlat3.xyz + (-u_xlat5.xyz);
    u_xlat13 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat4.xyz = vec3(u_xlat13) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat3.xyz * u_xlat4.yzx;
    u_xlat3.xyz = u_xlat3.zxy * u_xlat4.zxy + (-u_xlat5.xyz);
    u_xlat7.xyz = u_xlat1.yyy * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_NORMAL0.yyy;
    u_xlat3.xyz = u_xlat4.xyz * in_NORMAL0.xxx + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.xxx + u_xlat7.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + u_xlat2.xyz;
    u_xlat19 = u_xlat6 + (-_SizeGrowStartDist);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = u_xlat19 / _SizeGrowEndDist;
    u_xlat19 = min(u_xlat19, 1.0);
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * _MaxGrowSize;
    u_xlat19 = u_xlat19 * in_COLOR0.w;
    u_xlat1.xyz = u_xlat3.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat0.xzw = vec3(_ViewerOffset) * u_xlat0.xwz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.wwww + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = u_xlat6 + (-_FadeOutDistFar);
    u_xlat6 = u_xlat6 / _FadeOutDistNear;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.y = u_xlat6 * u_xlat6;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * 0.200000003;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat0 = u_xlat0.xxxx * _Color;
    u_xlat0 = u_xlat0 * vec4(vec4(_Multiplier, _Multiplier, _Multiplier, _Multiplier));
    u_xlat1.x = _BlinkingTimeOffsScale * in_COLOR0.z + _Time.y;
    u_xlat7.x = _TimeOffDuration + _TimeOnDuration;
    u_xlat13 = u_xlat1.x / u_xlat7.x;
    u_xlatb19 = u_xlat13>=(-u_xlat13);
    u_xlat13 = fract(abs(u_xlat13));
    u_xlat13 = (u_xlatb19) ? u_xlat13 : (-u_xlat13);
    u_xlat2.xy = vec2(_TimeOnDuration) * vec2(0.25, 0.75);
    u_xlat7.z = u_xlat13 * u_xlat7.x + (-u_xlat2.y);
    u_xlat7.x = u_xlat7.x * u_xlat13;
    u_xlat13 = float(1.0) / u_xlat2.x;
    u_xlat7.xz = vec2(u_xlat13) * u_xlat7.xz;
    u_xlat7.xz = clamp(u_xlat7.xz, 0.0, 1.0);
    u_xlat13 = u_xlat7.z * -2.0 + 3.0;
    u_xlat19 = u_xlat7.z * u_xlat7.z;
    u_xlat13 = (-u_xlat13) * u_xlat19 + 1.0;
    u_xlat19 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat19;
    u_xlat7.x = u_xlat13 * u_xlat7.x;
    u_xlat13 = 6.28318548 / _TimeOnDuration;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
    u_xlat13 = u_xlat1.x * 0.636600018 + 56.7271996;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat13 = cos(u_xlat13);
    u_xlat13 = u_xlat13 * 0.5 + 0.5;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
    u_xlat1.x = _NoiseAmount * u_xlat1.x + (-_NoiseAmount);
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlatb13 = _NoiseAmount<0.00999999978;
    u_xlat1.x = (u_xlatb13) ? u_xlat7.x : u_xlat1.x;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
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
uniform 	float _VerticalBillboarding;
uniform 	float _ViewerOffset;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat1.z = 0.0;
    u_xlat2.xy = (-in_COLOR0.xy) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat2.xy * in_TEXCOORD1.xy;
    u_xlat2.xyz = u_xlat1.xyz + in_POSITION0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat2.xyz);
    u_xlat0.w = u_xlat0.y * _VerticalBillboarding;
    u_xlat6 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat3.xyz = u_xlat0.zxw / vec3(u_xlat6);
    u_xlatb13 = 0.999000013<abs(u_xlat3.z);
    u_xlat4.xyz = (bool(u_xlatb13)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat5.xyz = u_xlat3.zxy * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.zxy * u_xlat3.xyz + (-u_xlat5.xyz);
    u_xlat13 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat4.xyz = vec3(u_xlat13) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat3.xyz * u_xlat4.yzx;
    u_xlat3.xyz = u_xlat3.zxy * u_xlat4.zxy + (-u_xlat5.xyz);
    u_xlat7.xyz = u_xlat1.yyy * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_NORMAL0.yyy;
    u_xlat3.xyz = u_xlat4.xyz * in_NORMAL0.xxx + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.xxx + u_xlat7.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + u_xlat2.xyz;
    u_xlat19 = u_xlat6 + (-_SizeGrowStartDist);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = u_xlat19 / _SizeGrowEndDist;
    u_xlat19 = min(u_xlat19, 1.0);
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * _MaxGrowSize;
    u_xlat19 = u_xlat19 * in_COLOR0.w;
    u_xlat1.xyz = u_xlat3.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat0.xzw = vec3(_ViewerOffset) * u_xlat0.xwz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.wwww + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = u_xlat6 + (-_FadeOutDistFar);
    u_xlat6 = u_xlat6 / _FadeOutDistNear;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.y = u_xlat6 * u_xlat6;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * 0.200000003;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat0 = u_xlat0.xxxx * _Color;
    u_xlat0 = u_xlat0 * vec4(vec4(_Multiplier, _Multiplier, _Multiplier, _Multiplier));
    u_xlat1.x = _BlinkingTimeOffsScale * in_COLOR0.z + _Time.y;
    u_xlat7.x = _TimeOffDuration + _TimeOnDuration;
    u_xlat13 = u_xlat1.x / u_xlat7.x;
    u_xlatb19 = u_xlat13>=(-u_xlat13);
    u_xlat13 = fract(abs(u_xlat13));
    u_xlat13 = (u_xlatb19) ? u_xlat13 : (-u_xlat13);
    u_xlat2.xy = vec2(_TimeOnDuration) * vec2(0.25, 0.75);
    u_xlat7.z = u_xlat13 * u_xlat7.x + (-u_xlat2.y);
    u_xlat7.x = u_xlat7.x * u_xlat13;
    u_xlat13 = float(1.0) / u_xlat2.x;
    u_xlat7.xz = vec2(u_xlat13) * u_xlat7.xz;
    u_xlat7.xz = clamp(u_xlat7.xz, 0.0, 1.0);
    u_xlat13 = u_xlat7.z * -2.0 + 3.0;
    u_xlat19 = u_xlat7.z * u_xlat7.z;
    u_xlat13 = (-u_xlat13) * u_xlat19 + 1.0;
    u_xlat19 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat19;
    u_xlat7.x = u_xlat13 * u_xlat7.x;
    u_xlat13 = 6.28318548 / _TimeOnDuration;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
    u_xlat13 = u_xlat1.x * 0.636600018 + 56.7271996;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat13 = cos(u_xlat13);
    u_xlat13 = u_xlat13 * 0.5 + 0.5;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
    u_xlat1.x = _NoiseAmount * u_xlat1.x + (-_NoiseAmount);
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlatb13 = _NoiseAmount<0.00999999978;
    u_xlat1.x = (u_xlatb13) ? u_xlat7.x : u_xlat1.x;
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