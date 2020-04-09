//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Cubic/Splatmap-NoLM-Triplanar" {
Properties {
_Control ("Texture", 2D) = "white" { }
_Splat3 ("Layer 3 (A)", 2D) = "white" { }
_Splat2 ("Layer 2 (B)", 2D) = "white" { }
_Splat1 ("Layer 1 (G)", 2D) = "white" { }
_Splat0 ("Layer 0 (R)", 2D) = "white" { }
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry-100" "RenderType" = "Opaque" }
  GpuProgramID 61092
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_7;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xy = u_xlat1.xz;
    vs_TEXCOORD4.xy = u_xlat1.zy;
    vs_TEXCOORD5.xy = u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(1.39999998, 1.39999998, 1.39999998);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    u_xlat16_3 = dot(u_xlat1.xyz, vec3(-0.200000003, 0.800000012, 0.800000012));
    u_xlat16_7 = max(u_xlat1.x, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_7) * vec4(0.400000006, 0.400000006, 0.0, 0.0);
    u_xlat16_3 = max(u_xlat16_3, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_3) * vec4(0.800000012, 0.800000012, 1.0, 1.0) + u_xlat16_0;
    vs_COLOR1 = u_xlat16_0;
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
uniform lowp sampler2D _Control;
uniform lowp sampler2D _Splat3;
uniform lowp sampler2D _Splat0;
uniform lowp sampler2D _Splat1;
uniform lowp sampler2D _Splat2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
float u_xlat15;
void main()
{
    u_xlat10_0.xyz = texture2D(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_6 = (-u_xlat16_1) + 1.0;
    u_xlat10_0 = texture2D(_Control, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.y * u_xlat16_6 + u_xlat16_1;
    u_xlat2.xy = fract(vs_TEXCOORD2.xy);
    u_xlat10_3.xyz = texture2D(_Splat1, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.yyy * u_xlat10_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat0, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Splat3, u_xlat2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.zzz * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat2.xy = fract(vs_TEXCOORD4.xy);
    u_xlat10_2.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat3.xy = fract(vs_TEXCOORD5.xy);
    u_xlat10_3.xyz = texture2D(_Splat2, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.yyy * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat15 = vs_TEXCOORD6.y * vs_TEXCOORD6.y;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR1.xyz;
    u_xlat0.w = vs_COLOR1.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_7;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xy = u_xlat1.xz;
    vs_TEXCOORD4.xy = u_xlat1.zy;
    vs_TEXCOORD5.xy = u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(1.39999998, 1.39999998, 1.39999998);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    u_xlat16_3 = dot(u_xlat1.xyz, vec3(-0.200000003, 0.800000012, 0.800000012));
    u_xlat16_7 = max(u_xlat1.x, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_7) * vec4(0.400000006, 0.400000006, 0.0, 0.0);
    u_xlat16_3 = max(u_xlat16_3, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_3) * vec4(0.800000012, 0.800000012, 1.0, 1.0) + u_xlat16_0;
    vs_COLOR1 = u_xlat16_0;
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
uniform lowp sampler2D _Control;
uniform lowp sampler2D _Splat3;
uniform lowp sampler2D _Splat0;
uniform lowp sampler2D _Splat1;
uniform lowp sampler2D _Splat2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
float u_xlat15;
void main()
{
    u_xlat10_0.xyz = texture2D(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_6 = (-u_xlat16_1) + 1.0;
    u_xlat10_0 = texture2D(_Control, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.y * u_xlat16_6 + u_xlat16_1;
    u_xlat2.xy = fract(vs_TEXCOORD2.xy);
    u_xlat10_3.xyz = texture2D(_Splat1, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.yyy * u_xlat10_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat0, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Splat3, u_xlat2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.zzz * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat2.xy = fract(vs_TEXCOORD4.xy);
    u_xlat10_2.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat3.xy = fract(vs_TEXCOORD5.xy);
    u_xlat10_3.xyz = texture2D(_Splat2, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.yyy * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat15 = vs_TEXCOORD6.y * vs_TEXCOORD6.y;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR1.xyz;
    u_xlat0.w = vs_COLOR1.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_7;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xy = u_xlat1.xz;
    vs_TEXCOORD4.xy = u_xlat1.zy;
    vs_TEXCOORD5.xy = u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(1.39999998, 1.39999998, 1.39999998);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    u_xlat16_3 = dot(u_xlat1.xyz, vec3(-0.200000003, 0.800000012, 0.800000012));
    u_xlat16_7 = max(u_xlat1.x, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_7) * vec4(0.400000006, 0.400000006, 0.0, 0.0);
    u_xlat16_3 = max(u_xlat16_3, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_3) * vec4(0.800000012, 0.800000012, 1.0, 1.0) + u_xlat16_0;
    vs_COLOR1 = u_xlat16_0;
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
uniform lowp sampler2D _Control;
uniform lowp sampler2D _Splat3;
uniform lowp sampler2D _Splat0;
uniform lowp sampler2D _Splat1;
uniform lowp sampler2D _Splat2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
float u_xlat15;
void main()
{
    u_xlat10_0.xyz = texture2D(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_6 = (-u_xlat16_1) + 1.0;
    u_xlat10_0 = texture2D(_Control, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.y * u_xlat16_6 + u_xlat16_1;
    u_xlat2.xy = fract(vs_TEXCOORD2.xy);
    u_xlat10_3.xyz = texture2D(_Splat1, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.yyy * u_xlat10_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat0, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Splat3, u_xlat2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.zzz * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat2.xy = fract(vs_TEXCOORD4.xy);
    u_xlat10_2.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat3.xy = fract(vs_TEXCOORD5.xy);
    u_xlat10_3.xyz = texture2D(_Splat2, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.yyy * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat15 = vs_TEXCOORD6.y * vs_TEXCOORD6.y;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR1.xyz;
    u_xlat0.w = vs_COLOR1.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_7;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].zyxy * in_POSITION0.wwww + u_xlat0.zyxy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD3 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = u_xlat0.zx;
    phase0_Output0_2 = u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(1.39999998, 1.39999998, 1.39999998);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD6.xyz = u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat0.xyz, vec3(-0.200000003, 0.800000012, 0.800000012));
    u_xlat16_7 = max(u_xlat0.x, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_7) * vec4(0.400000006, 0.400000006, 0.0, 0.0);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.300000012);
    u_xlat16_0 = u_xlat16_3.xxxx * vec4(0.800000012, 0.800000012, 1.0, 1.0) + u_xlat16_0;
    vs_COLOR1 = u_xlat16_0;
vs_TEXCOORD4 = phase0_Output0_2.xy;
vs_TEXCOORD5 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _Control;
uniform lowp sampler2D _Splat3;
uniform lowp sampler2D _Splat0;
uniform lowp sampler2D _Splat1;
uniform lowp sampler2D _Splat2;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
highp vec4 phase0_Input0_2;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
float u_xlat15;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD4, vs_TEXCOORD5);
    u_xlat10_0.xyz = texture2D(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_6 = (-u_xlat16_1) + 1.0;
    u_xlat10_0 = texture2D(_Control, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.y * u_xlat16_6 + u_xlat16_1;
    u_xlat2.xy = fract(vs_TEXCOORD2.xy);
    u_xlat10_3.xyz = texture2D(_Splat1, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.yyy * u_xlat10_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat0, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Splat3, u_xlat2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.zzz * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat1 = fract(phase0_Input0_2);
    u_xlat10_2.xyz = texture2D(_Splat2, u_xlat1.xy).xyz;
    u_xlat10_3.xyz = texture2D(_Splat2, u_xlat1.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.yyy * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat15 = vs_TEXCOORD6.y * vs_TEXCOORD6.y;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + unity_FogColor.xyz;
    u_xlat0.w = vs_COLOR1.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_7;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].zyxy * in_POSITION0.wwww + u_xlat0.zyxy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD3 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = u_xlat0.zx;
    phase0_Output0_2 = u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(1.39999998, 1.39999998, 1.39999998);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD6.xyz = u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat0.xyz, vec3(-0.200000003, 0.800000012, 0.800000012));
    u_xlat16_7 = max(u_xlat0.x, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_7) * vec4(0.400000006, 0.400000006, 0.0, 0.0);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.300000012);
    u_xlat16_0 = u_xlat16_3.xxxx * vec4(0.800000012, 0.800000012, 1.0, 1.0) + u_xlat16_0;
    vs_COLOR1 = u_xlat16_0;
vs_TEXCOORD4 = phase0_Output0_2.xy;
vs_TEXCOORD5 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _Control;
uniform lowp sampler2D _Splat3;
uniform lowp sampler2D _Splat0;
uniform lowp sampler2D _Splat1;
uniform lowp sampler2D _Splat2;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
highp vec4 phase0_Input0_2;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
float u_xlat15;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD4, vs_TEXCOORD5);
    u_xlat10_0.xyz = texture2D(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_6 = (-u_xlat16_1) + 1.0;
    u_xlat10_0 = texture2D(_Control, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.y * u_xlat16_6 + u_xlat16_1;
    u_xlat2.xy = fract(vs_TEXCOORD2.xy);
    u_xlat10_3.xyz = texture2D(_Splat1, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.yyy * u_xlat10_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat0, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Splat3, u_xlat2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.zzz * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat1 = fract(phase0_Input0_2);
    u_xlat10_2.xyz = texture2D(_Splat2, u_xlat1.xy).xyz;
    u_xlat10_3.xyz = texture2D(_Splat2, u_xlat1.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.yyy * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat15 = vs_TEXCOORD6.y * vs_TEXCOORD6.y;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + unity_FogColor.xyz;
    u_xlat0.w = vs_COLOR1.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_7;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].zyxy * in_POSITION0.wwww + u_xlat0.zyxy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD3 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = u_xlat0.zx;
    phase0_Output0_2 = u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(1.39999998, 1.39999998, 1.39999998);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD6.xyz = u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat0.xyz, vec3(-0.200000003, 0.800000012, 0.800000012));
    u_xlat16_7 = max(u_xlat0.x, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_7) * vec4(0.400000006, 0.400000006, 0.0, 0.0);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.300000012);
    u_xlat16_0 = u_xlat16_3.xxxx * vec4(0.800000012, 0.800000012, 1.0, 1.0) + u_xlat16_0;
    vs_COLOR1 = u_xlat16_0;
vs_TEXCOORD4 = phase0_Output0_2.xy;
vs_TEXCOORD5 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _Control;
uniform lowp sampler2D _Splat3;
uniform lowp sampler2D _Splat0;
uniform lowp sampler2D _Splat1;
uniform lowp sampler2D _Splat2;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
highp vec4 phase0_Input0_2;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
float u_xlat15;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD4, vs_TEXCOORD5);
    u_xlat10_0.xyz = texture2D(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_6 = (-u_xlat16_1) + 1.0;
    u_xlat10_0 = texture2D(_Control, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.y * u_xlat16_6 + u_xlat16_1;
    u_xlat2.xy = fract(vs_TEXCOORD2.xy);
    u_xlat10_3.xyz = texture2D(_Splat1, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.yyy * u_xlat10_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat0, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Splat3, u_xlat2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.zzz * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat1 = fract(phase0_Input0_2);
    u_xlat10_2.xyz = texture2D(_Splat2, u_xlat1.xy).xyz;
    u_xlat10_3.xyz = texture2D(_Splat2, u_xlat1.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.yyy * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat15 = vs_TEXCOORD6.y * vs_TEXCOORD6.y;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + unity_FogColor.xyz;
    u_xlat0.w = vs_COLOR1.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_7;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xy = u_xlat1.xz;
    vs_TEXCOORD4.xy = u_xlat1.zy;
    vs_TEXCOORD5.xy = u_xlat1.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(1.39999998, 1.39999998, 1.39999998);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    u_xlat16_3 = dot(u_xlat1.xyz, vec3(-0.200000003, 0.800000012, 0.800000012));
    u_xlat16_7 = max(u_xlat1.x, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_7) * vec4(0.400000006, 0.400000006, 0.0, 0.0);
    u_xlat16_3 = max(u_xlat16_3, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_3) * vec4(0.800000012, 0.800000012, 1.0, 1.0) + u_xlat16_0;
    vs_COLOR1 = u_xlat16_0;
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
uniform lowp sampler2D _Control;
uniform lowp sampler2D _Splat3;
uniform lowp sampler2D _Splat0;
uniform lowp sampler2D _Splat1;
uniform lowp sampler2D _Splat2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
float u_xlat15;
void main()
{
    u_xlat10_0.xyz = texture2D(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_6 = (-u_xlat16_1) + 1.0;
    u_xlat10_0 = texture2D(_Control, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.y * u_xlat16_6 + u_xlat16_1;
    u_xlat2.xy = fract(vs_TEXCOORD2.xy);
    u_xlat10_3.xyz = texture2D(_Splat1, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.yyy * u_xlat10_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat0, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Splat3, u_xlat2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.zzz * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat2.xy = fract(vs_TEXCOORD4.xy);
    u_xlat10_2.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat3.xy = fract(vs_TEXCOORD5.xy);
    u_xlat10_3.xyz = texture2D(_Splat2, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.yyy * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat15 = vs_TEXCOORD6.y * vs_TEXCOORD6.y;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR1.xyz;
    u_xlat0.w = vs_COLOR1.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_7;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xy = u_xlat1.xz;
    vs_TEXCOORD4.xy = u_xlat1.zy;
    vs_TEXCOORD5.xy = u_xlat1.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(1.39999998, 1.39999998, 1.39999998);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    u_xlat16_3 = dot(u_xlat1.xyz, vec3(-0.200000003, 0.800000012, 0.800000012));
    u_xlat16_7 = max(u_xlat1.x, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_7) * vec4(0.400000006, 0.400000006, 0.0, 0.0);
    u_xlat16_3 = max(u_xlat16_3, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_3) * vec4(0.800000012, 0.800000012, 1.0, 1.0) + u_xlat16_0;
    vs_COLOR1 = u_xlat16_0;
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
uniform lowp sampler2D _Control;
uniform lowp sampler2D _Splat3;
uniform lowp sampler2D _Splat0;
uniform lowp sampler2D _Splat1;
uniform lowp sampler2D _Splat2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
float u_xlat15;
void main()
{
    u_xlat10_0.xyz = texture2D(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_6 = (-u_xlat16_1) + 1.0;
    u_xlat10_0 = texture2D(_Control, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.y * u_xlat16_6 + u_xlat16_1;
    u_xlat2.xy = fract(vs_TEXCOORD2.xy);
    u_xlat10_3.xyz = texture2D(_Splat1, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.yyy * u_xlat10_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat0, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Splat3, u_xlat2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.zzz * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat2.xy = fract(vs_TEXCOORD4.xy);
    u_xlat10_2.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat3.xy = fract(vs_TEXCOORD5.xy);
    u_xlat10_3.xyz = texture2D(_Splat2, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.yyy * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat15 = vs_TEXCOORD6.y * vs_TEXCOORD6.y;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR1.xyz;
    u_xlat0.w = vs_COLOR1.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_7;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xy = u_xlat1.xz;
    vs_TEXCOORD4.xy = u_xlat1.zy;
    vs_TEXCOORD5.xy = u_xlat1.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(1.39999998, 1.39999998, 1.39999998);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    u_xlat16_3 = dot(u_xlat1.xyz, vec3(-0.200000003, 0.800000012, 0.800000012));
    u_xlat16_7 = max(u_xlat1.x, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_7) * vec4(0.400000006, 0.400000006, 0.0, 0.0);
    u_xlat16_3 = max(u_xlat16_3, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_3) * vec4(0.800000012, 0.800000012, 1.0, 1.0) + u_xlat16_0;
    vs_COLOR1 = u_xlat16_0;
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
uniform lowp sampler2D _Control;
uniform lowp sampler2D _Splat3;
uniform lowp sampler2D _Splat0;
uniform lowp sampler2D _Splat1;
uniform lowp sampler2D _Splat2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
float u_xlat15;
void main()
{
    u_xlat10_0.xyz = texture2D(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_6 = (-u_xlat16_1) + 1.0;
    u_xlat10_0 = texture2D(_Control, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.y * u_xlat16_6 + u_xlat16_1;
    u_xlat2.xy = fract(vs_TEXCOORD2.xy);
    u_xlat10_3.xyz = texture2D(_Splat1, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.yyy * u_xlat10_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat0, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Splat3, u_xlat2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.zzz * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat2.xy = fract(vs_TEXCOORD4.xy);
    u_xlat10_2.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat3.xy = fract(vs_TEXCOORD5.xy);
    u_xlat10_3.xyz = texture2D(_Splat2, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.yyy * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat15 = vs_TEXCOORD6.y * vs_TEXCOORD6.y;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR1.xyz;
    u_xlat0.w = vs_COLOR1.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_7;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].zyxy * in_POSITION0.wwww + u_xlat0.zyxy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD3 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = u_xlat0.zx;
    phase0_Output0_2 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(1.39999998, 1.39999998, 1.39999998);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD6.xyz = u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat0.xyz, vec3(-0.200000003, 0.800000012, 0.800000012));
    u_xlat16_7 = max(u_xlat0.x, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_7) * vec4(0.400000006, 0.400000006, 0.0, 0.0);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.300000012);
    u_xlat16_0 = u_xlat16_3.xxxx * vec4(0.800000012, 0.800000012, 1.0, 1.0) + u_xlat16_0;
    vs_COLOR1 = u_xlat16_0;
vs_TEXCOORD4 = phase0_Output0_2.xy;
vs_TEXCOORD5 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _Control;
uniform lowp sampler2D _Splat3;
uniform lowp sampler2D _Splat0;
uniform lowp sampler2D _Splat1;
uniform lowp sampler2D _Splat2;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
highp vec4 phase0_Input0_2;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
float u_xlat15;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD4, vs_TEXCOORD5);
    u_xlat10_0.xyz = texture2D(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_6 = (-u_xlat16_1) + 1.0;
    u_xlat10_0 = texture2D(_Control, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.y * u_xlat16_6 + u_xlat16_1;
    u_xlat2.xy = fract(vs_TEXCOORD2.xy);
    u_xlat10_3.xyz = texture2D(_Splat1, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.yyy * u_xlat10_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat0, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Splat3, u_xlat2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.zzz * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat1 = fract(phase0_Input0_2);
    u_xlat10_2.xyz = texture2D(_Splat2, u_xlat1.xy).xyz;
    u_xlat10_3.xyz = texture2D(_Splat2, u_xlat1.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.yyy * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat15 = vs_TEXCOORD6.y * vs_TEXCOORD6.y;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + unity_FogColor.xyz;
    u_xlat0.w = vs_COLOR1.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_7;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].zyxy * in_POSITION0.wwww + u_xlat0.zyxy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD3 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = u_xlat0.zx;
    phase0_Output0_2 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(1.39999998, 1.39999998, 1.39999998);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD6.xyz = u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat0.xyz, vec3(-0.200000003, 0.800000012, 0.800000012));
    u_xlat16_7 = max(u_xlat0.x, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_7) * vec4(0.400000006, 0.400000006, 0.0, 0.0);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.300000012);
    u_xlat16_0 = u_xlat16_3.xxxx * vec4(0.800000012, 0.800000012, 1.0, 1.0) + u_xlat16_0;
    vs_COLOR1 = u_xlat16_0;
vs_TEXCOORD4 = phase0_Output0_2.xy;
vs_TEXCOORD5 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _Control;
uniform lowp sampler2D _Splat3;
uniform lowp sampler2D _Splat0;
uniform lowp sampler2D _Splat1;
uniform lowp sampler2D _Splat2;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
highp vec4 phase0_Input0_2;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
float u_xlat15;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD4, vs_TEXCOORD5);
    u_xlat10_0.xyz = texture2D(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_6 = (-u_xlat16_1) + 1.0;
    u_xlat10_0 = texture2D(_Control, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.y * u_xlat16_6 + u_xlat16_1;
    u_xlat2.xy = fract(vs_TEXCOORD2.xy);
    u_xlat10_3.xyz = texture2D(_Splat1, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.yyy * u_xlat10_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat0, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Splat3, u_xlat2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.zzz * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat1 = fract(phase0_Input0_2);
    u_xlat10_2.xyz = texture2D(_Splat2, u_xlat1.xy).xyz;
    u_xlat10_3.xyz = texture2D(_Splat2, u_xlat1.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.yyy * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat15 = vs_TEXCOORD6.y * vs_TEXCOORD6.y;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + unity_FogColor.xyz;
    u_xlat0.w = vs_COLOR1.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_7;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].zyxy * in_POSITION0.wwww + u_xlat0.zyxy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD3 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = u_xlat0.zx;
    phase0_Output0_2 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(1.39999998, 1.39999998, 1.39999998);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD6.xyz = u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat0.xyz, vec3(-0.200000003, 0.800000012, 0.800000012));
    u_xlat16_7 = max(u_xlat0.x, 0.300000012);
    u_xlat16_0 = vec4(u_xlat16_7) * vec4(0.400000006, 0.400000006, 0.0, 0.0);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.300000012);
    u_xlat16_0 = u_xlat16_3.xxxx * vec4(0.800000012, 0.800000012, 1.0, 1.0) + u_xlat16_0;
    vs_COLOR1 = u_xlat16_0;
vs_TEXCOORD4 = phase0_Output0_2.xy;
vs_TEXCOORD5 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _Control;
uniform lowp sampler2D _Splat3;
uniform lowp sampler2D _Splat0;
uniform lowp sampler2D _Splat1;
uniform lowp sampler2D _Splat2;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD4;
highp vec4 phase0_Input0_2;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
float u_xlat15;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD4, vs_TEXCOORD5);
    u_xlat10_0.xyz = texture2D(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_6 = (-u_xlat16_1) + 1.0;
    u_xlat10_0 = texture2D(_Control, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0.y * u_xlat16_6 + u_xlat16_1;
    u_xlat2.xy = fract(vs_TEXCOORD2.xy);
    u_xlat10_3.xyz = texture2D(_Splat1, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.yyy * u_xlat10_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat0, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat10_4.xyz = texture2D(_Splat2, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Splat3, u_xlat2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.zzz * u_xlat10_4.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat1 = fract(phase0_Input0_2);
    u_xlat10_2.xyz = texture2D(_Splat2, u_xlat1.xy).xyz;
    u_xlat10_3.xyz = texture2D(_Splat2, u_xlat1.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.yyy * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat15 = vs_TEXCOORD6.y * vs_TEXCOORD6.y;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + unity_FogColor.xyz;
    u_xlat0.w = vs_COLOR1.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
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
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
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
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
}
}
}
}