//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/TrailShader" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
_BulletSpeed ("BulletSpeed", Float) = 2
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Offset -1, -1
  GpuProgramID 9493
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _Color;
uniform 	float _BulletSpeed;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_8;
float u_xlat10;
mediump float u_xlat16_10;
bool u_xlatb10;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x * 5.0;
    u_xlat0.z = u_xlat0.x / vs_COLOR0.w;
    u_xlat0.yw = vs_TEXCOORD0.yy;
    u_xlat16_10 = texture(_MainTex, u_xlat0.zw).w;
    u_xlat15 = fract(_Time.x);
    u_xlat15 = u_xlat15 + vs_TEXCOORD0.x;
    u_xlat15 = u_xlat15 / vs_COLOR0.x;
    u_xlat0.x = u_xlat15 * 0.5;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat16_10 * u_xlat16_1.w;
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0.w;
    u_xlat5.x = (-vs_TEXCOORD0.x) + 0.00999999978;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat5.x * -100.0 + 1.0;
    u_xlat16_3 = vs_COLOR0.x * 0.5;
    u_xlat16_8 = (-vs_COLOR0.w) * 0.99000001 + 1.0;
    u_xlat5.x = u_xlat16_8 * _BulletSpeed + u_xlat16_3;
    u_xlat5.x = u_xlat5.x + (-vs_TEXCOORD0.x);
    u_xlat4.y = u_xlat5.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.y = min(max(u_xlat4.y, 0.0), 1.0);
#else
    u_xlat4.y = clamp(u_xlat4.y, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat2.x * u_xlat4.y;
    u_xlat4.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = u_xlat16_8 * _BulletSpeed + (-vs_COLOR0.x);
    u_xlat10 = u_xlat16_8 * _BulletSpeed;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10<vs_TEXCOORD0.x);
#else
    u_xlatb10 = u_xlat10<vs_TEXCOORD0.x;
#endif
    u_xlat5.x = (-u_xlat5.x) + vs_TEXCOORD0.x;
    u_xlat2.y = u_xlat5.x / vs_COLOR0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.y = min(max(u_xlat2.y, 0.0), 1.0);
#else
    u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
#endif
    u_xlat5.xy = (bool(u_xlatb10)) ? u_xlat4.xy : u_xlat2.xy;
    u_xlat15 = u_xlat5.y * 3.0;
    u_xlat0.x = u_xlat16_0 * 0.800000012 + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat0.x>=0.0500000007);
#else
    u_xlatb15 = u_xlat0.x>=0.0500000007;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat15;
    u_xlat2.w = u_xlat5.x * u_xlat0.x;
    u_xlat0.x = u_xlat5.y + u_xlat5.y;
    u_xlat5.x = (-u_xlat5.y) + 1.0;
    u_xlat0.xzw = u_xlat0.xxx * _Color.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat5.xxx + u_xlat0.xzw;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _Color;
uniform 	float _BulletSpeed;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_8;
float u_xlat10;
mediump float u_xlat16_10;
bool u_xlatb10;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x * 5.0;
    u_xlat0.z = u_xlat0.x / vs_COLOR0.w;
    u_xlat0.yw = vs_TEXCOORD0.yy;
    u_xlat16_10 = texture(_MainTex, u_xlat0.zw).w;
    u_xlat15 = fract(_Time.x);
    u_xlat15 = u_xlat15 + vs_TEXCOORD0.x;
    u_xlat15 = u_xlat15 / vs_COLOR0.x;
    u_xlat0.x = u_xlat15 * 0.5;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat16_10 * u_xlat16_1.w;
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0.w;
    u_xlat5.x = (-vs_TEXCOORD0.x) + 0.00999999978;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat5.x * -100.0 + 1.0;
    u_xlat16_3 = vs_COLOR0.x * 0.5;
    u_xlat16_8 = (-vs_COLOR0.w) * 0.99000001 + 1.0;
    u_xlat5.x = u_xlat16_8 * _BulletSpeed + u_xlat16_3;
    u_xlat5.x = u_xlat5.x + (-vs_TEXCOORD0.x);
    u_xlat4.y = u_xlat5.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.y = min(max(u_xlat4.y, 0.0), 1.0);
#else
    u_xlat4.y = clamp(u_xlat4.y, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat2.x * u_xlat4.y;
    u_xlat4.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = u_xlat16_8 * _BulletSpeed + (-vs_COLOR0.x);
    u_xlat10 = u_xlat16_8 * _BulletSpeed;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10<vs_TEXCOORD0.x);
#else
    u_xlatb10 = u_xlat10<vs_TEXCOORD0.x;
#endif
    u_xlat5.x = (-u_xlat5.x) + vs_TEXCOORD0.x;
    u_xlat2.y = u_xlat5.x / vs_COLOR0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.y = min(max(u_xlat2.y, 0.0), 1.0);
#else
    u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
#endif
    u_xlat5.xy = (bool(u_xlatb10)) ? u_xlat4.xy : u_xlat2.xy;
    u_xlat15 = u_xlat5.y * 3.0;
    u_xlat0.x = u_xlat16_0 * 0.800000012 + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat0.x>=0.0500000007);
#else
    u_xlatb15 = u_xlat0.x>=0.0500000007;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat15;
    u_xlat2.w = u_xlat5.x * u_xlat0.x;
    u_xlat0.x = u_xlat5.y + u_xlat5.y;
    u_xlat5.x = (-u_xlat5.y) + 1.0;
    u_xlat0.xzw = u_xlat0.xxx * _Color.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat5.xxx + u_xlat0.xzw;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _Color;
uniform 	float _BulletSpeed;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_8;
float u_xlat10;
mediump float u_xlat16_10;
bool u_xlatb10;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x * 5.0;
    u_xlat0.z = u_xlat0.x / vs_COLOR0.w;
    u_xlat0.yw = vs_TEXCOORD0.yy;
    u_xlat16_10 = texture(_MainTex, u_xlat0.zw).w;
    u_xlat15 = fract(_Time.x);
    u_xlat15 = u_xlat15 + vs_TEXCOORD0.x;
    u_xlat15 = u_xlat15 / vs_COLOR0.x;
    u_xlat0.x = u_xlat15 * 0.5;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat16_10 * u_xlat16_1.w;
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0.w;
    u_xlat5.x = (-vs_TEXCOORD0.x) + 0.00999999978;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat5.x * -100.0 + 1.0;
    u_xlat16_3 = vs_COLOR0.x * 0.5;
    u_xlat16_8 = (-vs_COLOR0.w) * 0.99000001 + 1.0;
    u_xlat5.x = u_xlat16_8 * _BulletSpeed + u_xlat16_3;
    u_xlat5.x = u_xlat5.x + (-vs_TEXCOORD0.x);
    u_xlat4.y = u_xlat5.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.y = min(max(u_xlat4.y, 0.0), 1.0);
#else
    u_xlat4.y = clamp(u_xlat4.y, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat2.x * u_xlat4.y;
    u_xlat4.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = u_xlat16_8 * _BulletSpeed + (-vs_COLOR0.x);
    u_xlat10 = u_xlat16_8 * _BulletSpeed;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10<vs_TEXCOORD0.x);
#else
    u_xlatb10 = u_xlat10<vs_TEXCOORD0.x;
#endif
    u_xlat5.x = (-u_xlat5.x) + vs_TEXCOORD0.x;
    u_xlat2.y = u_xlat5.x / vs_COLOR0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.y = min(max(u_xlat2.y, 0.0), 1.0);
#else
    u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
#endif
    u_xlat5.xy = (bool(u_xlatb10)) ? u_xlat4.xy : u_xlat2.xy;
    u_xlat15 = u_xlat5.y * 3.0;
    u_xlat0.x = u_xlat16_0 * 0.800000012 + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat0.x>=0.0500000007);
#else
    u_xlatb15 = u_xlat0.x>=0.0500000007;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat15;
    u_xlat2.w = u_xlat5.x * u_xlat0.x;
    u_xlat0.x = u_xlat5.y + u_xlat5.y;
    u_xlat5.x = (-u_xlat5.y) + 1.0;
    u_xlat0.xzw = u_xlat0.xxx * _Color.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat5.xxx + u_xlat0.xzw;
    SV_Target0 = u_xlat2;
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