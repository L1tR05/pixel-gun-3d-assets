//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ColorCorrectionCurvesSimple" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
_RgbTex ("_RgbTex (RGB)", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 49242
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump float _Saturation;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _RgbTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.y = float(0.125);
    u_xlat0.w = float(0.375);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy).zxyw;
    u_xlat0.xz = u_xlat1.yz;
    u_xlat16_2.xyz = texture(_RgbTex, u_xlat0.zw).xyz;
    u_xlat16_0.xyz = texture(_RgbTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0, 1.0, 0.0);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat1.y = 0.625;
    u_xlat16_0.xyz = texture(_RgbTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.0, 0.0, 1.0) + u_xlat16_3.xyz;
    u_xlat16_15 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.xyz = (-vec3(u_xlat16_15)) + u_xlat16_3.xyz;
    SV_Target0.xyz = vec3(_Saturation) * u_xlat16_3.xyz + vec3(u_xlat16_15);
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump float _Saturation;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _RgbTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.y = float(0.125);
    u_xlat0.w = float(0.375);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy).zxyw;
    u_xlat0.xz = u_xlat1.yz;
    u_xlat16_2.xyz = texture(_RgbTex, u_xlat0.zw).xyz;
    u_xlat16_0.xyz = texture(_RgbTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0, 1.0, 0.0);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat1.y = 0.625;
    u_xlat16_0.xyz = texture(_RgbTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.0, 0.0, 1.0) + u_xlat16_3.xyz;
    u_xlat16_15 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.xyz = (-vec3(u_xlat16_15)) + u_xlat16_3.xyz;
    SV_Target0.xyz = vec3(_Saturation) * u_xlat16_3.xyz + vec3(u_xlat16_15);
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump float _Saturation;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _RgbTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.y = float(0.125);
    u_xlat0.w = float(0.375);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy).zxyw;
    u_xlat0.xz = u_xlat1.yz;
    u_xlat16_2.xyz = texture(_RgbTex, u_xlat0.zw).xyz;
    u_xlat16_0.xyz = texture(_RgbTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0, 1.0, 0.0);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat1.y = 0.625;
    u_xlat16_0.xyz = texture(_RgbTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.0, 0.0, 1.0) + u_xlat16_3.xyz;
    u_xlat16_15 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.xyz = (-vec3(u_xlat16_15)) + u_xlat16_3.xyz;
    SV_Target0.xyz = vec3(_Saturation) * u_xlat16_3.xyz + vec3(u_xlat16_15);
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