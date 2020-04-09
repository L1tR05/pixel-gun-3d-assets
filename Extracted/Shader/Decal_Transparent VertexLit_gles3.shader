//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Decal/Transparent VertexLit" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Vertex" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Offset -1, -1
  GpuProgramID 22975
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_5;
float u_xlat18;
int u_xlati18;
mediump float u_xlat16_21;
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
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_21 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_5.xyz = vec3(u_xlat16_21) * _Color.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_5;
float u_xlat18;
int u_xlati18;
mediump float u_xlat16_21;
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
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_21 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_5.xyz = vec3(u_xlat16_21) * _Color.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_5;
float u_xlat18;
int u_xlati18;
mediump float u_xlat16_21;
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
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_21 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_5.xyz = vec3(u_xlat16_21) * _Color.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
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
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = u_xlat7 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_24 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
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
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = u_xlat7 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_24 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
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
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = u_xlat7 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_24 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_10.x = u_xlat21 + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
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
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_26 = u_xlat21 + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat15 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat15, 0.0);
    u_xlat16_24 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_24 = u_xlat16_24 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_26 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_10.x = u_xlat21 + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
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
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_26 = u_xlat21 + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat15 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat15, 0.0);
    u_xlat16_24 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_24 = u_xlat16_24 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_26 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_10.x = u_xlat21 + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
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
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_26 = u_xlat21 + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat15 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat15, 0.0);
    u_xlat16_24 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_24 = u_xlat16_24 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_26 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_9;
float u_xlat30;
int u_xlati30;
bool u_xlatb31;
mediump float u_xlat16_37;
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
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_37 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_37 = max(u_xlat16_37, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_37) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_9;
float u_xlat30;
int u_xlati30;
bool u_xlatb31;
mediump float u_xlat16_37;
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
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_37 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_37 = max(u_xlat16_37, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_37) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_9;
float u_xlat30;
int u_xlati30;
bool u_xlatb31;
mediump float u_xlat16_37;
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
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_37 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_37 = max(u_xlat16_37, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_37) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_24;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat22 = u_xlat22 * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
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
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = max(u_xlat0.x, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb1 = unity_LightAtten[0].w<u_xlat0.x;
#endif
    u_xlat0.x = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb8 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb8;
    u_xlat16_24 = (u_xlatb1) ? 0.0 : u_xlat0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat14 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat8.xyz = vec3(u_xlat14) * u_xlat8.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat7.x = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_24;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat22 = u_xlat22 * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
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
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = max(u_xlat0.x, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb1 = unity_LightAtten[0].w<u_xlat0.x;
#endif
    u_xlat0.x = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb8 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb8;
    u_xlat16_24 = (u_xlatb1) ? 0.0 : u_xlat0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat14 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat8.xyz = vec3(u_xlat14) * u_xlat8.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat7.x = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_24;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat22 = u_xlat22 * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
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
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = max(u_xlat0.x, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb1 = unity_LightAtten[0].w<u_xlat0.x;
#endif
    u_xlat0.x = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb8 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb8;
    u_xlat16_24 = (u_xlatb1) ? 0.0 : u_xlat0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat14 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat8.xyz = vec3(u_xlat14) * u_xlat8.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat7.x = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.x = u_xlat0.x + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
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
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999997e-07);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_26 = u_xlat0.x + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat21 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = max(u_xlat7.x, 9.99999997e-07);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat7.x = float(1.0) / u_xlat21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat16_26 = u_xlat7.x + (-unity_LightAtten[7].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.x = u_xlat0.x + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
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
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999997e-07);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_26 = u_xlat0.x + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat21 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = max(u_xlat7.x, 9.99999997e-07);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat7.x = float(1.0) / u_xlat21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat16_26 = u_xlat7.x + (-unity_LightAtten[7].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.x = u_xlat0.x + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
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
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999997e-07);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_26 = u_xlat0.x + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat21 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = max(u_xlat7.x, 9.99999997e-07);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat7.x = float(1.0) / u_xlat21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat16_26 = u_xlat7.x + (-unity_LightAtten[7].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "VertexLM" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Offset -1, -1
  GpuProgramID 109557
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_1.x = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=u_xlat16_1.x);
#else
    u_xlatb9 = 0.0>=u_xlat16_1.x;
#endif
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_1.x = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=u_xlat16_1.x);
#else
    u_xlatb9 = 0.0>=u_xlat16_1.x;
#endif
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_1.x = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=u_xlat16_1.x);
#else
    u_xlatb9 = 0.0>=u_xlat16_1.x;
#endif
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_1.x = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=u_xlat16_1.x);
#else
    u_xlatb9 = 0.0>=u_xlat16_1.x;
#endif
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
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
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_1.x = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=u_xlat16_1.x);
#else
    u_xlatb9 = 0.0>=u_xlat16_1.x;
#endif
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
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
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_1.x = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=u_xlat16_1.x);
#else
    u_xlatb9 = 0.0>=u_xlat16_1.x;
#endif
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "VertexLMRGBM" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Offset -1, -1
  GpuProgramID 189966
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=u_xlat16_1.x);
#else
    u_xlatb9 = 0.0>=u_xlat16_1.x;
#endif
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_1 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(4.0, 4.0, 4.0);
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
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=u_xlat16_1.x);
#else
    u_xlatb9 = 0.0>=u_xlat16_1.x;
#endif
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_1 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(4.0, 4.0, 4.0);
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
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=u_xlat16_1.x);
#else
    u_xlatb9 = 0.0>=u_xlat16_1.x;
#endif
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_1 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(4.0, 4.0, 4.0);
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
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out mediump float vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    vs_TEXCOORD3 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
in mediump float vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=u_xlat16_1.x);
#else
    u_xlatb9 = 0.0>=u_xlat16_1.x;
#endif
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_1 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(4.0, 4.0, 4.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD3) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out mediump float vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    vs_TEXCOORD3 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
in mediump float vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=u_xlat16_1.x);
#else
    u_xlatb9 = 0.0>=u_xlat16_1.x;
#endif
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_1 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(4.0, 4.0, 4.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD3) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out mediump float vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    vs_TEXCOORD3 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
in mediump float vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.x = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=u_xlat16_1.x);
#else
    u_xlatb9 = 0.0>=u_xlat16_1.x;
#endif
    SV_Target0.w = u_xlat16_1.x;
    if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_1 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(4.0, 4.0, 4.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD3) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Offset -1, -1
  GpuProgramID 219583
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_5;
float u_xlat18;
int u_xlati18;
mediump float u_xlat16_21;
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
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_21 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_5.xyz = vec3(u_xlat16_21) * _Color.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_5;
float u_xlat18;
int u_xlati18;
mediump float u_xlat16_21;
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
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_21 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_5.xyz = vec3(u_xlat16_21) * _Color.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_5;
float u_xlat18;
int u_xlati18;
mediump float u_xlat16_21;
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
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_21 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_5.xyz = vec3(u_xlat16_21) * _Color.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
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
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = u_xlat7 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_24 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
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
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = u_xlat7 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_24 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
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
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = u_xlat7 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_24 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_10.x = u_xlat21 + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
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
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_26 = u_xlat21 + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat15 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat15, 0.0);
    u_xlat16_24 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_24 = u_xlat16_24 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_26 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_10.x = u_xlat21 + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
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
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_26 = u_xlat21 + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat15 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat15, 0.0);
    u_xlat16_24 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_24 = u_xlat16_24 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_26 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_10.x = u_xlat21 + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
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
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_26 = u_xlat21 + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat15 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat15, 0.0);
    u_xlat16_24 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_24 = u_xlat16_24 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_26 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    SV_Target0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 1.0);
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_9;
float u_xlat30;
int u_xlati30;
bool u_xlatb31;
mediump float u_xlat16_37;
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
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_37 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_37 = max(u_xlat16_37, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_37) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_9;
float u_xlat30;
int u_xlati30;
bool u_xlatb31;
mediump float u_xlat16_37;
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
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_37 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_37 = max(u_xlat16_37, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_37) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_9;
float u_xlat30;
int u_xlati30;
bool u_xlatb31;
mediump float u_xlat16_37;
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
    u_xlat30 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz;
    u_xlat16_7.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_37 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_37 = max(u_xlat16_37, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_37) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_24;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat22 = u_xlat22 * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
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
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = max(u_xlat0.x, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb1 = unity_LightAtten[0].w<u_xlat0.x;
#endif
    u_xlat0.x = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb8 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb8;
    u_xlat16_24 = (u_xlatb1) ? 0.0 : u_xlat0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat14 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat8.xyz = vec3(u_xlat14) * u_xlat8.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat7.x = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_24;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat22 = u_xlat22 * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
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
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = max(u_xlat0.x, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb1 = unity_LightAtten[0].w<u_xlat0.x;
#endif
    u_xlat0.x = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb8 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb8;
    u_xlat16_24 = (u_xlatb1) ? 0.0 : u_xlat0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat14 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat8.xyz = vec3(u_xlat14) * u_xlat8.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat7.x = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_24;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat22 = u_xlat22 * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
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
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = max(u_xlat0.x, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb1 = unity_LightAtten[0].w<u_xlat0.x;
#endif
    u_xlat0.x = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb8 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb8;
    u_xlat16_24 = (u_xlatb1) ? 0.0 : u_xlat0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat14 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat8.xyz = vec3(u_xlat14) * u_xlat8.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat7.x = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.x = u_xlat0.x + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
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
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999997e-07);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_26 = u_xlat0.x + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat21 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = max(u_xlat7.x, 9.99999997e-07);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat7.x = float(1.0) / u_xlat21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat16_26 = u_xlat7.x + (-unity_LightAtten[7].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.x = u_xlat0.x + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
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
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999997e-07);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_26 = u_xlat0.x + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat21 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = max(u_xlat7.x, 9.99999997e-07);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat7.x = float(1.0) / u_xlat21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat16_26 = u_xlat7.x + (-unity_LightAtten[7].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 _Color;
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
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.x = u_xlat0.x + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
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
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * _Color.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999997e-07);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_26 = u_xlat0.x + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = glstate_lightmodel_ambient.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat21 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = max(u_xlat7.x, 9.99999997e-07);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat7.x = float(1.0) / u_xlat21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * _Color.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat16_26 = u_xlat7.x + (-unity_LightAtten[7].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
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
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat16_0.w);
#else
    u_xlatb1 = 0.0>=u_xlat16_0.w;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_2.xyz + unity_FogColor.xyz;
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
}
}