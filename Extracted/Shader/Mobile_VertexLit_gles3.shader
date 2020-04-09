//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Mobile/VertexLit" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 LOD 80
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 80
  Tags { "LIGHTMODE" = "Vertex" "RenderType" = "Opaque" }
  GpuProgramID 156332
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
int u_xlati15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat0.z = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_3.xyz = glstate_lightmodel_ambient.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_18 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_18 = max(u_xlat16_18, 0.0);
        u_xlat16_4.xyz = vec3(u_xlat16_18) * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0.w = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
int u_xlati15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat0.z = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_3.xyz = glstate_lightmodel_ambient.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_18 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_18 = max(u_xlat16_18, 0.0);
        u_xlat16_4.xyz = vec3(u_xlat16_18) * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0.w = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
int u_xlati15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat0.z = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_3.xyz = glstate_lightmodel_ambient.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_18 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_18 = max(u_xlat16_18, 0.0);
        u_xlat16_4.xyz = vec3(u_xlat16_18) * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0.w = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
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
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[1].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[1].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat16_3.x = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[0].xyz;
    u_xlat18 = float(1.0) / u_xlat20;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb18 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb18)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlati18 = (u_xlatb1) ? 2 : u_xlati18;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[2].xyz;
    u_xlat7.x = float(1.0) / u_xlat10;
    u_xlat7.x = u_xlat7.x * 0.5;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[3].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 3 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[4].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 4 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[5].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 5 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[6].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 6 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat6 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat6 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat16_21 = (u_xlatb0) ? 0.0 : u_xlat6;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
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
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[1].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[1].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat16_3.x = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[0].xyz;
    u_xlat18 = float(1.0) / u_xlat20;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb18 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb18)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlati18 = (u_xlatb1) ? 2 : u_xlati18;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[2].xyz;
    u_xlat7.x = float(1.0) / u_xlat10;
    u_xlat7.x = u_xlat7.x * 0.5;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[3].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 3 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[4].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 4 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[5].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 5 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[6].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 6 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat6 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat6 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat16_21 = (u_xlatb0) ? 0.0 : u_xlat6;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
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
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[1].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[1].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat16_3.x = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[0].xyz;
    u_xlat18 = float(1.0) / u_xlat20;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb18 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb18)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlati18 = (u_xlatb1) ? 2 : u_xlati18;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[2].xyz;
    u_xlat7.x = float(1.0) / u_xlat10;
    u_xlat7.x = u_xlat7.x * 0.5;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[3].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 3 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[4].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 4 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[5].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 5 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[6].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 6 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat6 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat6 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat16_21 = (u_xlatb0) ? 0.0 : u_xlat6;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
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
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[1].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[1].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat18 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_9.x = u_xlat18 + (-unity_LightAtten[1].x);
    u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat20;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat18 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[0].xyz;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_23 = u_xlat18 + (-unity_LightAtten[0].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb18 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb18)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlati18 = (u_xlatb1) ? 2 : u_xlati18;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[2].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[2].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[3].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[3].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 3 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[4].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[4].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 4 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[5].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[5].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 5 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[6].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[6].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 6 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat13 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat13, 0.0);
    u_xlat16_21 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_21 = u_xlat16_21 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat6 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat6 = float(1.0) / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat16_23 = (u_xlatb0) ? 0.0 : u_xlat6;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
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
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[1].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[1].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat18 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_9.x = u_xlat18 + (-unity_LightAtten[1].x);
    u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat20;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat18 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[0].xyz;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_23 = u_xlat18 + (-unity_LightAtten[0].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb18 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb18)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlati18 = (u_xlatb1) ? 2 : u_xlati18;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[2].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[2].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[3].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[3].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 3 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[4].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[4].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 4 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[5].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[5].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 5 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[6].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[6].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 6 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat13 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat13, 0.0);
    u_xlat16_21 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_21 = u_xlat16_21 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat6 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat6 = float(1.0) / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat16_23 = (u_xlatb0) ? 0.0 : u_xlat6;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
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
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[1].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[1].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat18 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_9.x = u_xlat18 + (-unity_LightAtten[1].x);
    u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat20;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat18 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[0].xyz;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_23 = u_xlat18 + (-unity_LightAtten[0].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb18 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb18)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlati18 = (u_xlatb1) ? 2 : u_xlati18;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[2].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[2].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[3].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[3].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 3 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[4].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[4].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 4 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[5].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[5].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 5 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[6].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[6].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 6 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat13 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat13, 0.0);
    u_xlat16_21 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_21 = u_xlat16_21 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat6 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat6 = float(1.0) / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat16_23 = (u_xlatb0) ? 0.0 : u_xlat6;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat27;
int u_xlati27;
bool u_xlatb28;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_34 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_34 = max(u_xlat16_34, 0.0);
        u_xlat16_8.xyz = vec3(u_xlat16_34) * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD1 = u_xlat0.x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat27;
int u_xlati27;
bool u_xlatb28;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_34 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_34 = max(u_xlat16_34, 0.0);
        u_xlat16_8.xyz = vec3(u_xlat16_34) * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD1 = u_xlat0.x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat27;
int u_xlati27;
bool u_xlatb28;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_34 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_34 = max(u_xlat16_34, 0.0);
        u_xlat16_8.xyz = vec3(u_xlat16_34) * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD1 = u_xlat0.x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat6.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat6.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat6.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat6.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat19);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat19;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat19 + 1.0;
    u_xlat19 = max(u_xlat19, 9.99999997e-07);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat19 = float(1.0) / u_xlat2.x;
    u_xlat19 = u_xlat19 * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat19;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat6.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = max(u_xlat0.x, 9.99999997e-07);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb1 = unity_LightAtten[0].w<u_xlat0.x;
#endif
    u_xlat0.x = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb7 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb7;
    u_xlat16_21 = (u_xlatb1) ? 0.0 : u_xlat0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[2].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[3].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[4].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[5].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[6].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat12 = max(u_xlat6.x, 9.99999997e-07);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat7.xyz = vec3(u_xlat12) * u_xlat7.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightAtten[7].w<u_xlat6.x);
#else
    u_xlatb12 = unity_LightAtten[7].w<u_xlat6.x;
#endif
    u_xlat6.x = unity_LightAtten[7].z * u_xlat6.x + 1.0;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb18 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat16_21 = (u_xlatb12) ? 0.0 : u_xlat6.x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat6.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat6.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat6.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat6.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat19);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat19;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat19 + 1.0;
    u_xlat19 = max(u_xlat19, 9.99999997e-07);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat19 = float(1.0) / u_xlat2.x;
    u_xlat19 = u_xlat19 * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat19;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat6.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = max(u_xlat0.x, 9.99999997e-07);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb1 = unity_LightAtten[0].w<u_xlat0.x;
#endif
    u_xlat0.x = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb7 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb7;
    u_xlat16_21 = (u_xlatb1) ? 0.0 : u_xlat0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[2].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[3].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[4].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[5].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[6].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat12 = max(u_xlat6.x, 9.99999997e-07);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat7.xyz = vec3(u_xlat12) * u_xlat7.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightAtten[7].w<u_xlat6.x);
#else
    u_xlatb12 = unity_LightAtten[7].w<u_xlat6.x;
#endif
    u_xlat6.x = unity_LightAtten[7].z * u_xlat6.x + 1.0;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb18 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat16_21 = (u_xlatb12) ? 0.0 : u_xlat6.x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat6.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat6.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat6.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat6.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat19);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat19;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat19 + 1.0;
    u_xlat19 = max(u_xlat19, 9.99999997e-07);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat19 = float(1.0) / u_xlat2.x;
    u_xlat19 = u_xlat19 * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat19;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat6.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = max(u_xlat0.x, 9.99999997e-07);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb1 = unity_LightAtten[0].w<u_xlat0.x;
#endif
    u_xlat0.x = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb7 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb7;
    u_xlat16_21 = (u_xlatb1) ? 0.0 : u_xlat0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[2].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[3].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[4].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[5].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[6].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat12 = max(u_xlat6.x, 9.99999997e-07);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat7.xyz = vec3(u_xlat12) * u_xlat7.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightAtten[7].w<u_xlat6.x);
#else
    u_xlatb12 = unity_LightAtten[7].w<u_xlat6.x;
#endif
    u_xlat6.x = unity_LightAtten[7].z * u_xlat6.x + 1.0;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb18 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat16_21 = (u_xlatb12) ? 0.0 : u_xlat6.x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat6.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat6.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat6.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat6.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat19);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat19;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat19 + 1.0;
    u_xlat19 = max(u_xlat19, 9.99999997e-07);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat19 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat19;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_9.x = u_xlat0.x + (-unity_LightAtten[1].x);
    u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat6.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999997e-07);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(1.0) / u_xlat20;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[0].xyz;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_23 = u_xlat0.x + (-unity_LightAtten[0].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[2].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[2].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[3].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[3].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[4].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[4].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[5].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[5].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[6].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[6].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightAtten[7].w<u_xlat6.x);
#else
    u_xlatb12 = unity_LightAtten[7].w<u_xlat6.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb18 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = unity_LightAtten[7].z * u_xlat6.x + 1.0;
    u_xlat6.x = max(u_xlat6.x, 9.99999997e-07);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat7.xyz = u_xlat6.xxx * u_xlat7.xyz;
    u_xlat6.x = float(1.0) / u_xlat18;
    u_xlat16_21 = (u_xlatb12) ? 0.0 : u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[7].xyz;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat16_23 = u_xlat6.x + (-unity_LightAtten[7].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat6.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat6.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat6.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat6.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat19);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat19;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat19 + 1.0;
    u_xlat19 = max(u_xlat19, 9.99999997e-07);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat19 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat19;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_9.x = u_xlat0.x + (-unity_LightAtten[1].x);
    u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat6.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999997e-07);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(1.0) / u_xlat20;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[0].xyz;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_23 = u_xlat0.x + (-unity_LightAtten[0].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[2].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[2].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[3].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[3].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[4].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[4].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[5].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[5].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[6].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[6].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightAtten[7].w<u_xlat6.x);
#else
    u_xlatb12 = unity_LightAtten[7].w<u_xlat6.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb18 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = unity_LightAtten[7].z * u_xlat6.x + 1.0;
    u_xlat6.x = max(u_xlat6.x, 9.99999997e-07);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat7.xyz = u_xlat6.xxx * u_xlat7.xyz;
    u_xlat6.x = float(1.0) / u_xlat18;
    u_xlat16_21 = (u_xlatb12) ? 0.0 : u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[7].xyz;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat16_23 = u_xlat6.x + (-unity_LightAtten[7].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat6.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat6.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat6.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat6.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat19);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat19;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat19 + 1.0;
    u_xlat19 = max(u_xlat19, 9.99999997e-07);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat19 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat19;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_9.x = u_xlat0.x + (-unity_LightAtten[1].x);
    u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat6.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999997e-07);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(1.0) / u_xlat20;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[0].xyz;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_23 = u_xlat0.x + (-unity_LightAtten[0].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[2].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[2].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[3].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[3].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[4].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[4].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[5].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[5].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[6].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[6].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat6.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightAtten[7].w<u_xlat6.x);
#else
    u_xlatb12 = unity_LightAtten[7].w<u_xlat6.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb18 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = unity_LightAtten[7].z * u_xlat6.x + 1.0;
    u_xlat6.x = max(u_xlat6.x, 9.99999997e-07);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat7.xyz = u_xlat6.xxx * u_xlat7.xyz;
    u_xlat6.x = float(1.0) / u_xlat18;
    u_xlat16_21 = (u_xlatb12) ? 0.0 : u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[7].xyz;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat16_23 = u_xlat6.x + (-unity_LightAtten[7].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
}
}
 Pass {
  LOD 80
  Tags { "LIGHTMODE" = "VertexLM" "RenderType" = "Opaque" }
  GpuProgramID 1307
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    vs_TEXCOORD2 = u_xlat1.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    vs_TEXCOORD2 = u_xlat1.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    vs_TEXCOORD2 = u_xlat1.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "ShadowCaster"
  LOD 80
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  Cull Off
  GpuProgramID 77718
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
}
}