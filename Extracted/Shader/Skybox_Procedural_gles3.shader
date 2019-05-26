//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Skybox/Procedural" {
Properties {
_SunTint ("Sun Tint", Color) = (1,1,1,1)
_SunStrength ("Sun Strength", Float) = 1
_Color ("Atmosphere Tint", Color) = (0.5,0.5,0.5,1)
_GroundColor ("Ground", Color) = (0.369,0.349,0.341,1)
_HdrExposure ("HDR Exposure", Float) = 1.3
}
SubShader {
 Tags { "PreviewType" = "Skybox" "QUEUE" = "Background" "RenderType" = "Background" }
 Pass {
  Tags { "PreviewType" = "Skybox" "QUEUE" = "Background" "RenderType" = "Background" }
  ZWrite Off
  Cull Off
  GpuProgramID 16313
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec3 _Color;
in highp vec4 in_POSITION0;
out mediump vec3 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec2 u_xlat13;
float u_xlat14;
float u_xlat23;
float u_xlat24;
float u_xlat31;
int u_xlati31;
float u_xlat32;
bool u_xlatb32;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
void main()
{
    u_xlat16_0.xyz = log2(_Color.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.454544991, 0.454544991, 0.454544991);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(-1.29999995, -1.29999995, -1.29999995) + vec3(2.0, 2.0, 2.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.649999976, 0.569999993, 0.474999994);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = vec3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat2 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat31 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(u_xlat2.y>=0.0);
#else
    u_xlatb32 = u_xlat2.y>=0.0;
#endif
    if(u_xlatb32){
        u_xlat32 = u_xlat2.y * u_xlat2.y + 0.0506249666;
        u_xlat32 = sqrt(u_xlat32);
        u_xlat32 = (-u_xlat0.y) * u_xlat31 + u_xlat32;
        u_xlat31 = (-u_xlat0.y) * u_xlat31 + 1.0;
        u_xlat3.x = u_xlat31 * 5.25 + -6.80000019;
        u_xlat3.x = u_xlat31 * u_xlat3.x + 3.82999992;
        u_xlat3.x = u_xlat31 * u_xlat3.x + 0.458999991;
        u_xlat31 = u_xlat31 * u_xlat3.x + -0.00286999997;
        u_xlat31 = u_xlat31 * 1.44269502;
        u_xlat31 = exp2(u_xlat31);
        u_xlat31 = u_xlat31 * 0.246031836;
        u_xlat3.xy = vec2(u_xlat32) * vec2(0.5, 20.0);
        u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xxx;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat32 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat32 = sqrt(u_xlat32);
        u_xlat23 = (-u_xlat32) + 1.0;
        u_xlat23 = u_xlat23 * 230.831207;
        u_xlat23 = exp2(u_xlat23);
        u_xlat33 = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat33 = u_xlat33 / u_xlat32;
        u_xlat34 = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat32 = u_xlat34 / u_xlat32;
        u_xlat33 = (-u_xlat33) + 1.0;
        u_xlat34 = u_xlat33 * 5.25 + -6.80000019;
        u_xlat34 = u_xlat33 * u_xlat34 + 3.82999992;
        u_xlat34 = u_xlat33 * u_xlat34 + 0.458999991;
        u_xlat33 = u_xlat33 * u_xlat34 + -0.00286999997;
        u_xlat33 = u_xlat33 * 1.44269502;
        u_xlat33 = exp2(u_xlat33);
        u_xlat32 = (-u_xlat32) + 1.0;
        u_xlat34 = u_xlat32 * 5.25 + -6.80000019;
        u_xlat34 = u_xlat32 * u_xlat34 + 3.82999992;
        u_xlat34 = u_xlat32 * u_xlat34 + 0.458999991;
        u_xlat32 = u_xlat32 * u_xlat34 + -0.00286999997;
        u_xlat32 = u_xlat32 * 1.44269502;
        u_xlat32 = exp2(u_xlat32);
        u_xlat32 = u_xlat32 * 0.25;
        u_xlat32 = u_xlat33 * 0.25 + (-u_xlat32);
        u_xlat32 = u_xlat23 * u_xlat32 + u_xlat31;
        u_xlat5.xyz = u_xlat1.xyz * vec3(0.0314159282, 0.0314159282, 0.0314159282) + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat6.xyz = (-vec3(u_xlat32)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat32 = u_xlat3.y * u_xlat23;
        u_xlat3.xzw = u_xlat2.xyz * u_xlat3.xxx + u_xlat4.xyz;
        u_xlat4.x = dot(u_xlat3.xzw, u_xlat3.xzw);
        u_xlat4.x = sqrt(u_xlat4.x);
        u_xlat14 = (-u_xlat4.x) + 1.0;
        u_xlat14 = u_xlat14 * 230.831207;
        u_xlat14 = exp2(u_xlat14);
        u_xlat24 = dot(_WorldSpaceLightPos0.xyz, u_xlat3.xzw);
        u_xlat24 = u_xlat24 / u_xlat4.x;
        u_xlat3.x = dot(u_xlat2.xyz, u_xlat3.xzw);
        u_xlat3.x = u_xlat3.x / u_xlat4.x;
        u_xlat23 = (-u_xlat24) + 1.0;
        u_xlat33 = u_xlat23 * 5.25 + -6.80000019;
        u_xlat33 = u_xlat23 * u_xlat33 + 3.82999992;
        u_xlat33 = u_xlat23 * u_xlat33 + 0.458999991;
        u_xlat23 = u_xlat23 * u_xlat33 + -0.00286999997;
        u_xlat23 = u_xlat23 * 1.44269502;
        u_xlat23 = exp2(u_xlat23);
        u_xlat3.x = (-u_xlat3.x) + 1.0;
        u_xlat33 = u_xlat3.x * 5.25 + -6.80000019;
        u_xlat33 = u_xlat3.x * u_xlat33 + 3.82999992;
        u_xlat33 = u_xlat3.x * u_xlat33 + 0.458999991;
        u_xlat3.x = u_xlat3.x * u_xlat33 + -0.00286999997;
        u_xlat3.x = u_xlat3.x * 1.44269502;
        u_xlat3.x = exp2(u_xlat3.x);
        u_xlat3.x = u_xlat3.x * 0.25;
        u_xlat3.x = u_xlat23 * 0.25 + (-u_xlat3.x);
        u_xlat31 = u_xlat14 * u_xlat3.x + u_xlat31;
        u_xlat3.xzw = u_xlat5.xyz * (-vec3(u_xlat31));
        u_xlat3.xzw = u_xlat3.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat3.xzw = exp2(u_xlat3.xzw);
        u_xlat31 = u_xlat3.y * u_xlat14;
        u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xzw;
        u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat32) + u_xlat3.xyz;
        u_xlat4.xyz = u_xlat1.xyz * u_xlat3.xyz;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007);
        u_xlat3.xyz = u_xlat3.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996);
        vs_TEXCOORD1.xyz = u_xlat4.xyz;
        vs_TEXCOORD2.xyz = u_xlat3.xyz;
    } else {
        u_xlat31 = min(u_xlat2.y, -9.99999975e-06);
        u_xlat31 = -9.99999975e-05 / u_xlat31;
        u_xlat3.xyz = vec3(u_xlat31) * u_xlat2.xyz + vec3(0.0, 1.00010002, 0.0);
        u_xlat32 = dot((-u_xlat2.xyz), u_xlat3.xyz);
        u_xlat3.x = dot(_WorldSpaceLightPos0.xyz, u_xlat3.xyz);
        u_xlat32 = (-u_xlat32) + 1.0;
        u_xlat13.x = u_xlat32 * 5.25 + -6.80000019;
        u_xlat13.x = u_xlat32 * u_xlat13.x + 3.82999992;
        u_xlat13.x = u_xlat32 * u_xlat13.x + 0.458999991;
        u_xlat32 = u_xlat32 * u_xlat13.x + -0.00286999997;
        u_xlat32 = u_xlat32 * 1.44269502;
        u_xlat32 = exp2(u_xlat32);
        u_xlat3.x = (-u_xlat3.x) + 1.0;
        u_xlat13.x = u_xlat3.x * 5.25 + -6.80000019;
        u_xlat13.x = u_xlat3.x * u_xlat13.x + 3.82999992;
        u_xlat13.x = u_xlat3.x * u_xlat13.x + 0.458999991;
        u_xlat3.x = u_xlat3.x * u_xlat13.x + -0.00286999997;
        u_xlat3.x = u_xlat3.x * 1.44269502;
        u_xlat3.x = exp2(u_xlat3.x);
        u_xlat13.xy = vec2(u_xlat32) * vec2(0.25, 0.249900013);
        u_xlat32 = u_xlat3.x * 0.25 + u_xlat13.x;
        u_xlat3.xy = vec2(u_xlat31) * vec2(0.5, 20.0);
        u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xxx;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat5.xyz = u_xlat1.xyz * vec3(0.0314159282, 0.0314159282, 0.0314159282) + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat6.xyz = u_xlat4.xyz;
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat8.x = float(0.0);
        u_xlat8.y = float(0.0);
        u_xlat8.z = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
        {
            u_xlat33 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat33 = sqrt(u_xlat33);
            u_xlat33 = (-u_xlat33) + 1.0;
            u_xlat33 = u_xlat33 * 230.831207;
            u_xlat33 = exp2(u_xlat33);
            u_xlat34 = u_xlat33 * u_xlat32 + (-u_xlat13.y);
            u_xlat9.xyz = u_xlat5.xyz * (-vec3(u_xlat34));
            u_xlat9.xyz = u_xlat9.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
            u_xlat8.xyz = exp2(u_xlat9.xyz);
            u_xlat33 = u_xlat3.y * u_xlat33;
            u_xlat7.xyz = u_xlat8.xyz * vec3(u_xlat33) + u_xlat7.xyz;
            u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xxx + u_xlat6.xyz;
        }
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007) + vec3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat1.xyz = u_xlat1.xyz * u_xlat7.xyz;
        u_xlat3.xyz = min(u_xlat8.xyz, vec3(1.0, 1.0, 1.0));
        vs_TEXCOORD1.xyz = u_xlat1.xyz;
        vs_TEXCOORD2.xyz = u_xlat3.xyz;
    //ENDIF
    }
    vs_TEXCOORD0.xyz = (-u_xlat2.xyz);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump float _HdrExposure;
uniform 	mediump vec3 _GroundColor;
uniform 	mediump vec3 _SunTint;
uniform 	mediump float _SunStrength;
in mediump vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_6;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD0.xyz;
    u_xlat1 = dot(_WorldSpaceLightPos0.xyz, u_xlat16_0.xyz);
    u_xlat16_0.x = (-u_xlat1) * -1.98000002 + 1.98010004;
    u_xlat16_3 = u_xlat16_0.x * 100.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3 = min(max(u_xlat16_3, 0.0), 1.0);
#else
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
#endif
    u_xlat16_6 = u_xlat16_3 * -2.0 + 3.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_6;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_3;
    u_xlat16_0.x = max(u_xlat16_0.x, 9.99999975e-05);
    u_xlat16_3 = u_xlat1 * u_xlat1 + 1.0;
    u_xlat16_6 = u_xlat1 * u_xlat1;
    u_xlat16_6 = u_xlat16_6 * 0.75 + 0.75;
    u_xlat16_3 = u_xlat16_3 * 0.0100164423;
    u_xlat16_0.x = u_xlat16_3 / u_xlat16_0.x;
    u_xlat16_0.xyw = u_xlat16_0.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_0.xyw = u_xlat16_0.xyw * _LightColor0.xyz;
    u_xlat16_0.xyw = u_xlat16_0.xyw * _SunTint.xyz;
    u_xlat16_0.xyw = u_xlat16_0.xyw * vec3(vec3(_SunStrength, _SunStrength, _SunStrength));
    u_xlat16_0.xyz = vec3(u_xlat16_6) * vs_TEXCOORD1.xyz + u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vs_TEXCOORD0.y<0.0);
#else
    u_xlatb1 = vs_TEXCOORD0.y<0.0;
#endif
    u_xlat16_2.xyz = vec3(_GroundColor.x, _GroundColor.y, _GroundColor.z) * vs_TEXCOORD2.xyz + vs_TEXCOORD1.xyz;
    u_xlat16_0.xyz = (bool(u_xlatb1)) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(_HdrExposure);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec3 _Color;
in highp vec4 in_POSITION0;
out mediump vec3 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec2 u_xlat13;
float u_xlat14;
float u_xlat23;
float u_xlat24;
float u_xlat31;
int u_xlati31;
float u_xlat32;
bool u_xlatb32;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
void main()
{
    u_xlat16_0.xyz = log2(_Color.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.454544991, 0.454544991, 0.454544991);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(-1.29999995, -1.29999995, -1.29999995) + vec3(2.0, 2.0, 2.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.649999976, 0.569999993, 0.474999994);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = vec3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat2 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat31 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(u_xlat2.y>=0.0);
#else
    u_xlatb32 = u_xlat2.y>=0.0;
#endif
    if(u_xlatb32){
        u_xlat32 = u_xlat2.y * u_xlat2.y + 0.0506249666;
        u_xlat32 = sqrt(u_xlat32);
        u_xlat32 = (-u_xlat0.y) * u_xlat31 + u_xlat32;
        u_xlat31 = (-u_xlat0.y) * u_xlat31 + 1.0;
        u_xlat3.x = u_xlat31 * 5.25 + -6.80000019;
        u_xlat3.x = u_xlat31 * u_xlat3.x + 3.82999992;
        u_xlat3.x = u_xlat31 * u_xlat3.x + 0.458999991;
        u_xlat31 = u_xlat31 * u_xlat3.x + -0.00286999997;
        u_xlat31 = u_xlat31 * 1.44269502;
        u_xlat31 = exp2(u_xlat31);
        u_xlat31 = u_xlat31 * 0.246031836;
        u_xlat3.xy = vec2(u_xlat32) * vec2(0.5, 20.0);
        u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xxx;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat32 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat32 = sqrt(u_xlat32);
        u_xlat23 = (-u_xlat32) + 1.0;
        u_xlat23 = u_xlat23 * 230.831207;
        u_xlat23 = exp2(u_xlat23);
        u_xlat33 = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat33 = u_xlat33 / u_xlat32;
        u_xlat34 = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat32 = u_xlat34 / u_xlat32;
        u_xlat33 = (-u_xlat33) + 1.0;
        u_xlat34 = u_xlat33 * 5.25 + -6.80000019;
        u_xlat34 = u_xlat33 * u_xlat34 + 3.82999992;
        u_xlat34 = u_xlat33 * u_xlat34 + 0.458999991;
        u_xlat33 = u_xlat33 * u_xlat34 + -0.00286999997;
        u_xlat33 = u_xlat33 * 1.44269502;
        u_xlat33 = exp2(u_xlat33);
        u_xlat32 = (-u_xlat32) + 1.0;
        u_xlat34 = u_xlat32 * 5.25 + -6.80000019;
        u_xlat34 = u_xlat32 * u_xlat34 + 3.82999992;
        u_xlat34 = u_xlat32 * u_xlat34 + 0.458999991;
        u_xlat32 = u_xlat32 * u_xlat34 + -0.00286999997;
        u_xlat32 = u_xlat32 * 1.44269502;
        u_xlat32 = exp2(u_xlat32);
        u_xlat32 = u_xlat32 * 0.25;
        u_xlat32 = u_xlat33 * 0.25 + (-u_xlat32);
        u_xlat32 = u_xlat23 * u_xlat32 + u_xlat31;
        u_xlat5.xyz = u_xlat1.xyz * vec3(0.0314159282, 0.0314159282, 0.0314159282) + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat6.xyz = (-vec3(u_xlat32)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat32 = u_xlat3.y * u_xlat23;
        u_xlat3.xzw = u_xlat2.xyz * u_xlat3.xxx + u_xlat4.xyz;
        u_xlat4.x = dot(u_xlat3.xzw, u_xlat3.xzw);
        u_xlat4.x = sqrt(u_xlat4.x);
        u_xlat14 = (-u_xlat4.x) + 1.0;
        u_xlat14 = u_xlat14 * 230.831207;
        u_xlat14 = exp2(u_xlat14);
        u_xlat24 = dot(_WorldSpaceLightPos0.xyz, u_xlat3.xzw);
        u_xlat24 = u_xlat24 / u_xlat4.x;
        u_xlat3.x = dot(u_xlat2.xyz, u_xlat3.xzw);
        u_xlat3.x = u_xlat3.x / u_xlat4.x;
        u_xlat23 = (-u_xlat24) + 1.0;
        u_xlat33 = u_xlat23 * 5.25 + -6.80000019;
        u_xlat33 = u_xlat23 * u_xlat33 + 3.82999992;
        u_xlat33 = u_xlat23 * u_xlat33 + 0.458999991;
        u_xlat23 = u_xlat23 * u_xlat33 + -0.00286999997;
        u_xlat23 = u_xlat23 * 1.44269502;
        u_xlat23 = exp2(u_xlat23);
        u_xlat3.x = (-u_xlat3.x) + 1.0;
        u_xlat33 = u_xlat3.x * 5.25 + -6.80000019;
        u_xlat33 = u_xlat3.x * u_xlat33 + 3.82999992;
        u_xlat33 = u_xlat3.x * u_xlat33 + 0.458999991;
        u_xlat3.x = u_xlat3.x * u_xlat33 + -0.00286999997;
        u_xlat3.x = u_xlat3.x * 1.44269502;
        u_xlat3.x = exp2(u_xlat3.x);
        u_xlat3.x = u_xlat3.x * 0.25;
        u_xlat3.x = u_xlat23 * 0.25 + (-u_xlat3.x);
        u_xlat31 = u_xlat14 * u_xlat3.x + u_xlat31;
        u_xlat3.xzw = u_xlat5.xyz * (-vec3(u_xlat31));
        u_xlat3.xzw = u_xlat3.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat3.xzw = exp2(u_xlat3.xzw);
        u_xlat31 = u_xlat3.y * u_xlat14;
        u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xzw;
        u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat32) + u_xlat3.xyz;
        u_xlat4.xyz = u_xlat1.xyz * u_xlat3.xyz;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007);
        u_xlat3.xyz = u_xlat3.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996);
        vs_TEXCOORD1.xyz = u_xlat4.xyz;
        vs_TEXCOORD2.xyz = u_xlat3.xyz;
    } else {
        u_xlat31 = min(u_xlat2.y, -9.99999975e-06);
        u_xlat31 = -9.99999975e-05 / u_xlat31;
        u_xlat3.xyz = vec3(u_xlat31) * u_xlat2.xyz + vec3(0.0, 1.00010002, 0.0);
        u_xlat32 = dot((-u_xlat2.xyz), u_xlat3.xyz);
        u_xlat3.x = dot(_WorldSpaceLightPos0.xyz, u_xlat3.xyz);
        u_xlat32 = (-u_xlat32) + 1.0;
        u_xlat13.x = u_xlat32 * 5.25 + -6.80000019;
        u_xlat13.x = u_xlat32 * u_xlat13.x + 3.82999992;
        u_xlat13.x = u_xlat32 * u_xlat13.x + 0.458999991;
        u_xlat32 = u_xlat32 * u_xlat13.x + -0.00286999997;
        u_xlat32 = u_xlat32 * 1.44269502;
        u_xlat32 = exp2(u_xlat32);
        u_xlat3.x = (-u_xlat3.x) + 1.0;
        u_xlat13.x = u_xlat3.x * 5.25 + -6.80000019;
        u_xlat13.x = u_xlat3.x * u_xlat13.x + 3.82999992;
        u_xlat13.x = u_xlat3.x * u_xlat13.x + 0.458999991;
        u_xlat3.x = u_xlat3.x * u_xlat13.x + -0.00286999997;
        u_xlat3.x = u_xlat3.x * 1.44269502;
        u_xlat3.x = exp2(u_xlat3.x);
        u_xlat13.xy = vec2(u_xlat32) * vec2(0.25, 0.249900013);
        u_xlat32 = u_xlat3.x * 0.25 + u_xlat13.x;
        u_xlat3.xy = vec2(u_xlat31) * vec2(0.5, 20.0);
        u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xxx;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat5.xyz = u_xlat1.xyz * vec3(0.0314159282, 0.0314159282, 0.0314159282) + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat6.xyz = u_xlat4.xyz;
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat8.x = float(0.0);
        u_xlat8.y = float(0.0);
        u_xlat8.z = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
        {
            u_xlat33 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat33 = sqrt(u_xlat33);
            u_xlat33 = (-u_xlat33) + 1.0;
            u_xlat33 = u_xlat33 * 230.831207;
            u_xlat33 = exp2(u_xlat33);
            u_xlat34 = u_xlat33 * u_xlat32 + (-u_xlat13.y);
            u_xlat9.xyz = u_xlat5.xyz * (-vec3(u_xlat34));
            u_xlat9.xyz = u_xlat9.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
            u_xlat8.xyz = exp2(u_xlat9.xyz);
            u_xlat33 = u_xlat3.y * u_xlat33;
            u_xlat7.xyz = u_xlat8.xyz * vec3(u_xlat33) + u_xlat7.xyz;
            u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xxx + u_xlat6.xyz;
        }
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007) + vec3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat1.xyz = u_xlat1.xyz * u_xlat7.xyz;
        u_xlat3.xyz = min(u_xlat8.xyz, vec3(1.0, 1.0, 1.0));
        vs_TEXCOORD1.xyz = u_xlat1.xyz;
        vs_TEXCOORD2.xyz = u_xlat3.xyz;
    //ENDIF
    }
    vs_TEXCOORD0.xyz = (-u_xlat2.xyz);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump float _HdrExposure;
uniform 	mediump vec3 _GroundColor;
uniform 	mediump vec3 _SunTint;
uniform 	mediump float _SunStrength;
in mediump vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_6;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD0.xyz;
    u_xlat1 = dot(_WorldSpaceLightPos0.xyz, u_xlat16_0.xyz);
    u_xlat16_0.x = (-u_xlat1) * -1.98000002 + 1.98010004;
    u_xlat16_3 = u_xlat16_0.x * 100.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3 = min(max(u_xlat16_3, 0.0), 1.0);
#else
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
#endif
    u_xlat16_6 = u_xlat16_3 * -2.0 + 3.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_6;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_3;
    u_xlat16_0.x = max(u_xlat16_0.x, 9.99999975e-05);
    u_xlat16_3 = u_xlat1 * u_xlat1 + 1.0;
    u_xlat16_6 = u_xlat1 * u_xlat1;
    u_xlat16_6 = u_xlat16_6 * 0.75 + 0.75;
    u_xlat16_3 = u_xlat16_3 * 0.0100164423;
    u_xlat16_0.x = u_xlat16_3 / u_xlat16_0.x;
    u_xlat16_0.xyw = u_xlat16_0.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_0.xyw = u_xlat16_0.xyw * _LightColor0.xyz;
    u_xlat16_0.xyw = u_xlat16_0.xyw * _SunTint.xyz;
    u_xlat16_0.xyw = u_xlat16_0.xyw * vec3(vec3(_SunStrength, _SunStrength, _SunStrength));
    u_xlat16_0.xyz = vec3(u_xlat16_6) * vs_TEXCOORD1.xyz + u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vs_TEXCOORD0.y<0.0);
#else
    u_xlatb1 = vs_TEXCOORD0.y<0.0;
#endif
    u_xlat16_2.xyz = vec3(_GroundColor.x, _GroundColor.y, _GroundColor.z) * vs_TEXCOORD2.xyz + vs_TEXCOORD1.xyz;
    u_xlat16_0.xyz = (bool(u_xlatb1)) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(_HdrExposure);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec3 _Color;
in highp vec4 in_POSITION0;
out mediump vec3 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec2 u_xlat13;
float u_xlat14;
float u_xlat23;
float u_xlat24;
float u_xlat31;
int u_xlati31;
float u_xlat32;
bool u_xlatb32;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
void main()
{
    u_xlat16_0.xyz = log2(_Color.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.454544991, 0.454544991, 0.454544991);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(-1.29999995, -1.29999995, -1.29999995) + vec3(2.0, 2.0, 2.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.649999976, 0.569999993, 0.474999994);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = vec3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat2 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat31 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(u_xlat2.y>=0.0);
#else
    u_xlatb32 = u_xlat2.y>=0.0;
#endif
    if(u_xlatb32){
        u_xlat32 = u_xlat2.y * u_xlat2.y + 0.0506249666;
        u_xlat32 = sqrt(u_xlat32);
        u_xlat32 = (-u_xlat0.y) * u_xlat31 + u_xlat32;
        u_xlat31 = (-u_xlat0.y) * u_xlat31 + 1.0;
        u_xlat3.x = u_xlat31 * 5.25 + -6.80000019;
        u_xlat3.x = u_xlat31 * u_xlat3.x + 3.82999992;
        u_xlat3.x = u_xlat31 * u_xlat3.x + 0.458999991;
        u_xlat31 = u_xlat31 * u_xlat3.x + -0.00286999997;
        u_xlat31 = u_xlat31 * 1.44269502;
        u_xlat31 = exp2(u_xlat31);
        u_xlat31 = u_xlat31 * 0.246031836;
        u_xlat3.xy = vec2(u_xlat32) * vec2(0.5, 20.0);
        u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xxx;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat32 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat32 = sqrt(u_xlat32);
        u_xlat23 = (-u_xlat32) + 1.0;
        u_xlat23 = u_xlat23 * 230.831207;
        u_xlat23 = exp2(u_xlat23);
        u_xlat33 = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat33 = u_xlat33 / u_xlat32;
        u_xlat34 = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat32 = u_xlat34 / u_xlat32;
        u_xlat33 = (-u_xlat33) + 1.0;
        u_xlat34 = u_xlat33 * 5.25 + -6.80000019;
        u_xlat34 = u_xlat33 * u_xlat34 + 3.82999992;
        u_xlat34 = u_xlat33 * u_xlat34 + 0.458999991;
        u_xlat33 = u_xlat33 * u_xlat34 + -0.00286999997;
        u_xlat33 = u_xlat33 * 1.44269502;
        u_xlat33 = exp2(u_xlat33);
        u_xlat32 = (-u_xlat32) + 1.0;
        u_xlat34 = u_xlat32 * 5.25 + -6.80000019;
        u_xlat34 = u_xlat32 * u_xlat34 + 3.82999992;
        u_xlat34 = u_xlat32 * u_xlat34 + 0.458999991;
        u_xlat32 = u_xlat32 * u_xlat34 + -0.00286999997;
        u_xlat32 = u_xlat32 * 1.44269502;
        u_xlat32 = exp2(u_xlat32);
        u_xlat32 = u_xlat32 * 0.25;
        u_xlat32 = u_xlat33 * 0.25 + (-u_xlat32);
        u_xlat32 = u_xlat23 * u_xlat32 + u_xlat31;
        u_xlat5.xyz = u_xlat1.xyz * vec3(0.0314159282, 0.0314159282, 0.0314159282) + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat6.xyz = (-vec3(u_xlat32)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat32 = u_xlat3.y * u_xlat23;
        u_xlat3.xzw = u_xlat2.xyz * u_xlat3.xxx + u_xlat4.xyz;
        u_xlat4.x = dot(u_xlat3.xzw, u_xlat3.xzw);
        u_xlat4.x = sqrt(u_xlat4.x);
        u_xlat14 = (-u_xlat4.x) + 1.0;
        u_xlat14 = u_xlat14 * 230.831207;
        u_xlat14 = exp2(u_xlat14);
        u_xlat24 = dot(_WorldSpaceLightPos0.xyz, u_xlat3.xzw);
        u_xlat24 = u_xlat24 / u_xlat4.x;
        u_xlat3.x = dot(u_xlat2.xyz, u_xlat3.xzw);
        u_xlat3.x = u_xlat3.x / u_xlat4.x;
        u_xlat23 = (-u_xlat24) + 1.0;
        u_xlat33 = u_xlat23 * 5.25 + -6.80000019;
        u_xlat33 = u_xlat23 * u_xlat33 + 3.82999992;
        u_xlat33 = u_xlat23 * u_xlat33 + 0.458999991;
        u_xlat23 = u_xlat23 * u_xlat33 + -0.00286999997;
        u_xlat23 = u_xlat23 * 1.44269502;
        u_xlat23 = exp2(u_xlat23);
        u_xlat3.x = (-u_xlat3.x) + 1.0;
        u_xlat33 = u_xlat3.x * 5.25 + -6.80000019;
        u_xlat33 = u_xlat3.x * u_xlat33 + 3.82999992;
        u_xlat33 = u_xlat3.x * u_xlat33 + 0.458999991;
        u_xlat3.x = u_xlat3.x * u_xlat33 + -0.00286999997;
        u_xlat3.x = u_xlat3.x * 1.44269502;
        u_xlat3.x = exp2(u_xlat3.x);
        u_xlat3.x = u_xlat3.x * 0.25;
        u_xlat3.x = u_xlat23 * 0.25 + (-u_xlat3.x);
        u_xlat31 = u_xlat14 * u_xlat3.x + u_xlat31;
        u_xlat3.xzw = u_xlat5.xyz * (-vec3(u_xlat31));
        u_xlat3.xzw = u_xlat3.xzw * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat3.xzw = exp2(u_xlat3.xzw);
        u_xlat31 = u_xlat3.y * u_xlat14;
        u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xzw;
        u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat32) + u_xlat3.xyz;
        u_xlat4.xyz = u_xlat1.xyz * u_xlat3.xyz;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007);
        u_xlat3.xyz = u_xlat3.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996);
        vs_TEXCOORD1.xyz = u_xlat4.xyz;
        vs_TEXCOORD2.xyz = u_xlat3.xyz;
    } else {
        u_xlat31 = min(u_xlat2.y, -9.99999975e-06);
        u_xlat31 = -9.99999975e-05 / u_xlat31;
        u_xlat3.xyz = vec3(u_xlat31) * u_xlat2.xyz + vec3(0.0, 1.00010002, 0.0);
        u_xlat32 = dot((-u_xlat2.xyz), u_xlat3.xyz);
        u_xlat3.x = dot(_WorldSpaceLightPos0.xyz, u_xlat3.xyz);
        u_xlat32 = (-u_xlat32) + 1.0;
        u_xlat13.x = u_xlat32 * 5.25 + -6.80000019;
        u_xlat13.x = u_xlat32 * u_xlat13.x + 3.82999992;
        u_xlat13.x = u_xlat32 * u_xlat13.x + 0.458999991;
        u_xlat32 = u_xlat32 * u_xlat13.x + -0.00286999997;
        u_xlat32 = u_xlat32 * 1.44269502;
        u_xlat32 = exp2(u_xlat32);
        u_xlat3.x = (-u_xlat3.x) + 1.0;
        u_xlat13.x = u_xlat3.x * 5.25 + -6.80000019;
        u_xlat13.x = u_xlat3.x * u_xlat13.x + 3.82999992;
        u_xlat13.x = u_xlat3.x * u_xlat13.x + 0.458999991;
        u_xlat3.x = u_xlat3.x * u_xlat13.x + -0.00286999997;
        u_xlat3.x = u_xlat3.x * 1.44269502;
        u_xlat3.x = exp2(u_xlat3.x);
        u_xlat13.xy = vec2(u_xlat32) * vec2(0.25, 0.249900013);
        u_xlat32 = u_xlat3.x * 0.25 + u_xlat13.x;
        u_xlat3.xy = vec2(u_xlat31) * vec2(0.5, 20.0);
        u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xxx;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat5.xyz = u_xlat1.xyz * vec3(0.0314159282, 0.0314159282, 0.0314159282) + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat6.xyz = u_xlat4.xyz;
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat8.x = float(0.0);
        u_xlat8.y = float(0.0);
        u_xlat8.z = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<2 ; u_xlati_loop_1++)
        {
            u_xlat33 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat33 = sqrt(u_xlat33);
            u_xlat33 = (-u_xlat33) + 1.0;
            u_xlat33 = u_xlat33 * 230.831207;
            u_xlat33 = exp2(u_xlat33);
            u_xlat34 = u_xlat33 * u_xlat32 + (-u_xlat13.y);
            u_xlat9.xyz = u_xlat5.xyz * (-vec3(u_xlat34));
            u_xlat9.xyz = u_xlat9.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
            u_xlat8.xyz = exp2(u_xlat9.xyz);
            u_xlat33 = u_xlat3.y * u_xlat33;
            u_xlat7.xyz = u_xlat8.xyz * vec3(u_xlat33) + u_xlat7.xyz;
            u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xxx + u_xlat6.xyz;
        }
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007) + vec3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat1.xyz = u_xlat1.xyz * u_xlat7.xyz;
        u_xlat3.xyz = min(u_xlat8.xyz, vec3(1.0, 1.0, 1.0));
        vs_TEXCOORD1.xyz = u_xlat1.xyz;
        vs_TEXCOORD2.xyz = u_xlat3.xyz;
    //ENDIF
    }
    vs_TEXCOORD0.xyz = (-u_xlat2.xyz);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump float _HdrExposure;
uniform 	mediump vec3 _GroundColor;
uniform 	mediump vec3 _SunTint;
uniform 	mediump float _SunStrength;
in mediump vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_6;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD0.xyz;
    u_xlat1 = dot(_WorldSpaceLightPos0.xyz, u_xlat16_0.xyz);
    u_xlat16_0.x = (-u_xlat1) * -1.98000002 + 1.98010004;
    u_xlat16_3 = u_xlat16_0.x * 100.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3 = min(max(u_xlat16_3, 0.0), 1.0);
#else
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
#endif
    u_xlat16_6 = u_xlat16_3 * -2.0 + 3.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_6;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_3;
    u_xlat16_0.x = max(u_xlat16_0.x, 9.99999975e-05);
    u_xlat16_3 = u_xlat1 * u_xlat1 + 1.0;
    u_xlat16_6 = u_xlat1 * u_xlat1;
    u_xlat16_6 = u_xlat16_6 * 0.75 + 0.75;
    u_xlat16_3 = u_xlat16_3 * 0.0100164423;
    u_xlat16_0.x = u_xlat16_3 / u_xlat16_0.x;
    u_xlat16_0.xyw = u_xlat16_0.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_0.xyw = u_xlat16_0.xyw * _LightColor0.xyz;
    u_xlat16_0.xyw = u_xlat16_0.xyw * _SunTint.xyz;
    u_xlat16_0.xyw = u_xlat16_0.xyw * vec3(vec3(_SunStrength, _SunStrength, _SunStrength));
    u_xlat16_0.xyz = vec3(u_xlat16_6) * vs_TEXCOORD1.xyz + u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vs_TEXCOORD0.y<0.0);
#else
    u_xlatb1 = vs_TEXCOORD0.y<0.0;
#endif
    u_xlat16_2.xyz = vec3(_GroundColor.x, _GroundColor.y, _GroundColor.z) * vs_TEXCOORD2.xyz + vs_TEXCOORD1.xyz;
    u_xlat16_0.xyz = (bool(u_xlatb1)) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(_HdrExposure);
    SV_Target0.w = 1.0;
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