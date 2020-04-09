//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Cubic/KillingSphere" {
Properties {
_MainTex ("Grid", 2D) = "white" { }
_MainTex2 ("Wawes", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
_RotationSpeed ("RotSpeed", Range(0, 11)) = 0.01
_Scale ("Scale", Float) = 1
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent-100" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent-100" "RenderType" = "Transparent" }
  ZTest Less
  ZWrite Off
  GpuProgramID 63942
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	float _Scale;
uniform 	float _RotationSpeed;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp float vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = 0.0;
    u_xlat4.x = _Time.x * _RotationSpeed;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat4.x / _Scale;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(_Scale);
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
    u_xlat4.xy = u_xlat1.xx + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xx + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(_Scale);
    vs_TEXCOORD1.xy = u_xlat4.xy * vec2(_Scale);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = (-u_xlat1.xy) + _WorldSpaceCameraPos.xz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 9.99999975e-05;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD4 = u_xlat1.x * -0.800000012 + 1.0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _MainTex2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_2 = texture(_MainTex2, vs_TEXCOORD1.xy).w;
    u_xlat16_4 = texture(_MainTex2, vs_TEXCOORD2.xy).w;
    u_xlat16_1 = u_xlat16_2 * u_xlat16_4 + u_xlat16_0;
    SV_Target0.xyz = vec3(u_xlat16_2) * vec3(u_xlat16_4) + _Color.xyz;
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD4;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	float _Scale;
uniform 	float _RotationSpeed;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp float vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = 0.0;
    u_xlat4.x = _Time.x * _RotationSpeed;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat4.x / _Scale;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(_Scale);
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
    u_xlat4.xy = u_xlat1.xx + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xx + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(_Scale);
    vs_TEXCOORD1.xy = u_xlat4.xy * vec2(_Scale);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = (-u_xlat1.xy) + _WorldSpaceCameraPos.xz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 9.99999975e-05;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD4 = u_xlat1.x * -0.800000012 + 1.0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _MainTex2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_2 = texture(_MainTex2, vs_TEXCOORD1.xy).w;
    u_xlat16_4 = texture(_MainTex2, vs_TEXCOORD2.xy).w;
    u_xlat16_1 = u_xlat16_2 * u_xlat16_4 + u_xlat16_0;
    SV_Target0.xyz = vec3(u_xlat16_2) * vec3(u_xlat16_4) + _Color.xyz;
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD4;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	float _Scale;
uniform 	float _RotationSpeed;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp float vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = 0.0;
    u_xlat4.x = _Time.x * _RotationSpeed;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat4.x / _Scale;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(_Scale);
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
    u_xlat4.xy = u_xlat1.xx + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xx + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(_Scale);
    vs_TEXCOORD1.xy = u_xlat4.xy * vec2(_Scale);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = (-u_xlat1.xy) + _WorldSpaceCameraPos.xz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 9.99999975e-05;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD4 = u_xlat1.x * -0.800000012 + 1.0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _MainTex2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_2 = texture(_MainTex2, vs_TEXCOORD1.xy).w;
    u_xlat16_4 = texture(_MainTex2, vs_TEXCOORD2.xy).w;
    u_xlat16_1 = u_xlat16_2 * u_xlat16_4 + u_xlat16_0;
    SV_Target0.xyz = vec3(u_xlat16_2) * vec3(u_xlat16_4) + _Color.xyz;
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD4;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	float _Scale;
uniform 	float _RotationSpeed;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp float vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = 0.0;
    u_xlat4.x = _Time.x * _RotationSpeed;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat4.x / _Scale;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(_Scale);
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
    u_xlat4.xy = u_xlat1.xx + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xx + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(_Scale);
    vs_TEXCOORD1.xy = u_xlat4.xy * vec2(_Scale);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = (-u_xlat1.xy) + _WorldSpaceCameraPos.xz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 9.99999975e-05;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD4 = u_xlat1.x * -0.800000012 + 1.0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _MainTex2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_2 = texture(_MainTex2, vs_TEXCOORD1.xy).w;
    u_xlat16_4 = texture(_MainTex2, vs_TEXCOORD2.xy).w;
    u_xlat16_1 = u_xlat16_2 * u_xlat16_4 + u_xlat16_0;
    SV_Target0.xyz = vec3(u_xlat16_2) * vec3(u_xlat16_4) + _Color.xyz;
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD4;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	float _Scale;
uniform 	float _RotationSpeed;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp float vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = 0.0;
    u_xlat4.x = _Time.x * _RotationSpeed;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat4.x / _Scale;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(_Scale);
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
    u_xlat4.xy = u_xlat1.xx + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xx + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(_Scale);
    vs_TEXCOORD1.xy = u_xlat4.xy * vec2(_Scale);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = (-u_xlat1.xy) + _WorldSpaceCameraPos.xz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 9.99999975e-05;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD4 = u_xlat1.x * -0.800000012 + 1.0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _MainTex2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_2 = texture(_MainTex2, vs_TEXCOORD1.xy).w;
    u_xlat16_4 = texture(_MainTex2, vs_TEXCOORD2.xy).w;
    u_xlat16_1 = u_xlat16_2 * u_xlat16_4 + u_xlat16_0;
    SV_Target0.xyz = vec3(u_xlat16_2) * vec3(u_xlat16_4) + _Color.xyz;
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD4;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	float _Scale;
uniform 	float _RotationSpeed;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp float vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = 0.0;
    u_xlat4.x = _Time.x * _RotationSpeed;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat4.x / _Scale;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(_Scale);
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
    u_xlat4.xy = u_xlat1.xx + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xx + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(_Scale);
    vs_TEXCOORD1.xy = u_xlat4.xy * vec2(_Scale);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = (-u_xlat1.xy) + _WorldSpaceCameraPos.xz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 9.99999975e-05;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD4 = u_xlat1.x * -0.800000012 + 1.0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _MainTex2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_2 = texture(_MainTex2, vs_TEXCOORD1.xy).w;
    u_xlat16_4 = texture(_MainTex2, vs_TEXCOORD2.xy).w;
    u_xlat16_1 = u_xlat16_2 * u_xlat16_4 + u_xlat16_0;
    SV_Target0.xyz = vec3(u_xlat16_2) * vec3(u_xlat16_4) + _Color.xyz;
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD4;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	float _Scale;
uniform 	float _RotationSpeed;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp float vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = 0.0;
    u_xlat4.x = _Time.x * _RotationSpeed;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat4.x / _Scale;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(_Scale);
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
    u_xlat4.xy = u_xlat1.xx + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xx + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(_Scale);
    vs_TEXCOORD1.xy = u_xlat4.xy * vec2(_Scale);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = (-u_xlat1.xy) + _WorldSpaceCameraPos.xz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 9.99999975e-05;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD4 = u_xlat1.x * -0.800000012 + 1.0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _MainTex2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_2 = texture(_MainTex2, vs_TEXCOORD1.xy).w;
    u_xlat16_4 = texture(_MainTex2, vs_TEXCOORD2.xy).w;
    u_xlat16_1 = u_xlat16_2 * u_xlat16_4 + u_xlat16_0;
    SV_Target0.xyz = vec3(u_xlat16_2) * vec3(u_xlat16_4) + _Color.xyz;
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD4;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	float _Scale;
uniform 	float _RotationSpeed;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp float vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = 0.0;
    u_xlat4.x = _Time.x * _RotationSpeed;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat4.x / _Scale;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(_Scale);
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
    u_xlat4.xy = u_xlat1.xx + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xx + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(_Scale);
    vs_TEXCOORD1.xy = u_xlat4.xy * vec2(_Scale);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = (-u_xlat1.xy) + _WorldSpaceCameraPos.xz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 9.99999975e-05;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD4 = u_xlat1.x * -0.800000012 + 1.0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _MainTex2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_2 = texture(_MainTex2, vs_TEXCOORD1.xy).w;
    u_xlat16_4 = texture(_MainTex2, vs_TEXCOORD2.xy).w;
    u_xlat16_1 = u_xlat16_2 * u_xlat16_4 + u_xlat16_0;
    SV_Target0.xyz = vec3(u_xlat16_2) * vec3(u_xlat16_4) + _Color.xyz;
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD4;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	float _Scale;
uniform 	float _RotationSpeed;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp float vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = 0.0;
    u_xlat4.x = _Time.x * _RotationSpeed;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat4.x / _Scale;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(_Scale);
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
    u_xlat4.xy = u_xlat1.xx + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xx + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(_Scale);
    vs_TEXCOORD1.xy = u_xlat4.xy * vec2(_Scale);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = (-u_xlat1.xy) + _WorldSpaceCameraPos.xz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 9.99999975e-05;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD4 = u_xlat1.x * -0.800000012 + 1.0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _MainTex2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_2 = texture(_MainTex2, vs_TEXCOORD1.xy).w;
    u_xlat16_4 = texture(_MainTex2, vs_TEXCOORD2.xy).w;
    u_xlat16_1 = u_xlat16_2 * u_xlat16_4 + u_xlat16_0;
    SV_Target0.xyz = vec3(u_xlat16_2) * vec3(u_xlat16_4) + _Color.xyz;
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD4;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	float _Scale;
uniform 	float _RotationSpeed;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp float vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = 0.0;
    u_xlat4.x = _Time.x * _RotationSpeed;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat4.x / _Scale;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(_Scale);
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
    u_xlat4.xy = u_xlat1.xx + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xx + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(_Scale);
    vs_TEXCOORD1.xy = u_xlat4.xy * vec2(_Scale);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = (-u_xlat1.xy) + _WorldSpaceCameraPos.xz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 9.99999975e-05;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD4 = u_xlat1.x * -0.800000012 + 1.0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _MainTex2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_2 = texture(_MainTex2, vs_TEXCOORD1.xy).w;
    u_xlat16_4 = texture(_MainTex2, vs_TEXCOORD2.xy).w;
    u_xlat16_1 = u_xlat16_2 * u_xlat16_4 + u_xlat16_0;
    SV_Target0.xyz = vec3(u_xlat16_2) * vec3(u_xlat16_4) + _Color.xyz;
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD4;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	float _Scale;
uniform 	float _RotationSpeed;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp float vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = 0.0;
    u_xlat4.x = _Time.x * _RotationSpeed;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat4.x / _Scale;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(_Scale);
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
    u_xlat4.xy = u_xlat1.xx + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xx + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(_Scale);
    vs_TEXCOORD1.xy = u_xlat4.xy * vec2(_Scale);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = (-u_xlat1.xy) + _WorldSpaceCameraPos.xz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 9.99999975e-05;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD4 = u_xlat1.x * -0.800000012 + 1.0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _MainTex2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_2 = texture(_MainTex2, vs_TEXCOORD1.xy).w;
    u_xlat16_4 = texture(_MainTex2, vs_TEXCOORD2.xy).w;
    u_xlat16_1 = u_xlat16_2 * u_xlat16_4 + u_xlat16_0;
    SV_Target0.xyz = vec3(u_xlat16_2) * vec3(u_xlat16_4) + _Color.xyz;
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD4;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	float _Scale;
uniform 	float _RotationSpeed;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp float vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = 0.0;
    u_xlat4.x = _Time.x * _RotationSpeed;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat4.x / _Scale;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(_Scale);
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
    u_xlat4.xy = u_xlat1.xx + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xx + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(_Scale);
    vs_TEXCOORD1.xy = u_xlat4.xy * vec2(_Scale);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = (-u_xlat1.xy) + _WorldSpaceCameraPos.xz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 9.99999975e-05;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD4 = u_xlat1.x * -0.800000012 + 1.0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _MainTex2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_2 = texture(_MainTex2, vs_TEXCOORD1.xy).w;
    u_xlat16_4 = texture(_MainTex2, vs_TEXCOORD2.xy).w;
    u_xlat16_1 = u_xlat16_2 * u_xlat16_4 + u_xlat16_0;
    SV_Target0.xyz = vec3(u_xlat16_2) * vec3(u_xlat16_4) + _Color.xyz;
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD4;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
}
}
}
}