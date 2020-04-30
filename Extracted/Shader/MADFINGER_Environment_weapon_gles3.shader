//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Environment/weapon" {
Properties {
_MainTex ("Base (RGB) Gloss (A)", 2D) = "white" { }
_Shininess ("Shininess", Range(0.01, 1)) = 0.078125
_SHLightingScale ("LightProbe influence scale", Float) = 1
}
SubShader {
 LOD 100
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
  GpuProgramID 64282
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Shininess;
uniform 	float _SHLightingScale;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_3.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat21 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(_SHLightingScale);
    vs_TEXCOORD2.xyz = u_xlat5.xyz;
    u_xlat21 = dot((-u_xlat0.xyz), (-u_xlat0.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * (-u_xlat0.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat1.xyz * (-vec3(u_xlat21)) + u_xlat0.xyz;
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat7 = _Shininess * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.www * vs_TEXCOORD1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_TEXCOORD2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Shininess;
uniform 	float _SHLightingScale;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_3.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat21 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(_SHLightingScale);
    vs_TEXCOORD2.xyz = u_xlat5.xyz;
    u_xlat21 = dot((-u_xlat0.xyz), (-u_xlat0.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * (-u_xlat0.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat1.xyz * (-vec3(u_xlat21)) + u_xlat0.xyz;
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat7 = _Shininess * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.www * vs_TEXCOORD1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_TEXCOORD2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Shininess;
uniform 	float _SHLightingScale;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_3.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat21 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(_SHLightingScale);
    vs_TEXCOORD2.xyz = u_xlat5.xyz;
    u_xlat21 = dot((-u_xlat0.xyz), (-u_xlat0.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * (-u_xlat0.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat1.xyz * (-vec3(u_xlat21)) + u_xlat0.xyz;
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat7 = _Shininess * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.www * vs_TEXCOORD1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_TEXCOORD2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Shininess;
uniform 	float _SHLightingScale;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_3.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat21 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(_SHLightingScale);
    vs_TEXCOORD2.xyz = u_xlat5.xyz;
    u_xlat21 = dot((-u_xlat0.xyz), (-u_xlat0.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * (-u_xlat0.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat1.xyz * (-vec3(u_xlat21)) + u_xlat0.xyz;
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat7 = _Shininess * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.www * vs_TEXCOORD1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_TEXCOORD2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Shininess;
uniform 	float _SHLightingScale;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_3.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat21 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(_SHLightingScale);
    vs_TEXCOORD2.xyz = u_xlat5.xyz;
    u_xlat21 = dot((-u_xlat0.xyz), (-u_xlat0.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * (-u_xlat0.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat1.xyz * (-vec3(u_xlat21)) + u_xlat0.xyz;
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat7 = _Shininess * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.www * vs_TEXCOORD1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_TEXCOORD2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Shininess;
uniform 	float _SHLightingScale;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_3.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat21 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(_SHLightingScale);
    vs_TEXCOORD2.xyz = u_xlat5.xyz;
    u_xlat21 = dot((-u_xlat0.xyz), (-u_xlat0.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * (-u_xlat0.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat1.xyz * (-vec3(u_xlat21)) + u_xlat0.xyz;
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat7 = _Shininess * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.www * vs_TEXCOORD1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_TEXCOORD2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
}
}
}
}