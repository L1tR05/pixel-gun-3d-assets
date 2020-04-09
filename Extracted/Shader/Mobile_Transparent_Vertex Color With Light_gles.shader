//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Mobile/Transparent/Vertex Color With Light" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_SpecColor ("Spec Color", Color) = (1,1,1,0)
_Emission ("Emmisive Color", Color) = (0,0,0,0)
_Shininess ("Shininess", Range(0.1, 1)) = 0.7
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Vertex" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  GpuProgramID 52109
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _Shininess;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
float u_xlat33;
int u_xlati34;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat16_40 = _Shininess * 128.0;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * in_COLOR0.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb3 = 0.0<u_xlat16_41;
        if(u_xlatb3){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_40 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        //ENDIF
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_2 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD1 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat16_1.xyz = u_xlat16_0.yzw * _Color.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    u_xlat16_1.x = u_xlat16_0.x * _Color.w;
    u_xlatb2 = 0.0>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x + u_xlat16_1.x;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _Shininess;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
float u_xlat33;
int u_xlati34;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat16_40 = _Shininess * 128.0;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * in_COLOR0.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb3 = 0.0<u_xlat16_41;
        if(u_xlatb3){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_40 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        //ENDIF
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_2 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD1 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat16_1.xyz = u_xlat16_0.yzw * _Color.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    u_xlat16_1.x = u_xlat16_0.x * _Color.w;
    u_xlatb2 = 0.0>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x + u_xlat16_1.x;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _Shininess;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
float u_xlat33;
int u_xlati34;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat16_40 = _Shininess * 128.0;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * in_COLOR0.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb3 = 0.0<u_xlat16_41;
        if(u_xlatb3){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_40 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        //ENDIF
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_2 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD1 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat16_1.xyz = u_xlat16_0.yzw * _Color.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    u_xlat16_1.x = u_xlat16_0.x * _Color.w;
    u_xlatb2 = 0.0>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x + u_xlat16_1.x;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _Shininess;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb15;
mediump vec3 u_xlat16_20;
bool u_xlatb26;
float u_xlat33;
int u_xlati34;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat16_40 = _Shininess * 128.0;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[u_xlati_loop_1].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
        u_xlatb15 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb26 = unity_LightAtten[u_xlati_loop_1].w<u_xlat36;
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat36 = u_xlat4.x * 0.5;
        u_xlat16_41 = (u_xlatb15) ? 0.0 : u_xlat36;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * in_COLOR0.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb36 = 0.0<u_xlat16_9.x;
        if(u_xlatb36){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + u_xlat3.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_40 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        //ENDIF
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_2 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD1 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat16_1.xyz = u_xlat16_0.yzw * _Color.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    u_xlat16_1.x = u_xlat16_0.x * _Color.w;
    u_xlatb2 = 0.0>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x + u_xlat16_1.x;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _Shininess;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb15;
mediump vec3 u_xlat16_20;
bool u_xlatb26;
float u_xlat33;
int u_xlati34;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat16_40 = _Shininess * 128.0;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[u_xlati_loop_1].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
        u_xlatb15 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb26 = unity_LightAtten[u_xlati_loop_1].w<u_xlat36;
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat36 = u_xlat4.x * 0.5;
        u_xlat16_41 = (u_xlatb15) ? 0.0 : u_xlat36;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * in_COLOR0.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb36 = 0.0<u_xlat16_9.x;
        if(u_xlatb36){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + u_xlat3.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_40 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        //ENDIF
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_2 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD1 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat16_1.xyz = u_xlat16_0.yzw * _Color.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    u_xlat16_1.x = u_xlat16_0.x * _Color.w;
    u_xlatb2 = 0.0>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x + u_xlat16_1.x;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _Shininess;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb15;
mediump vec3 u_xlat16_20;
bool u_xlatb26;
float u_xlat33;
int u_xlati34;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat16_40 = _Shininess * 128.0;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[u_xlati_loop_1].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
        u_xlatb15 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb26 = unity_LightAtten[u_xlati_loop_1].w<u_xlat36;
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat36 = u_xlat4.x * 0.5;
        u_xlat16_41 = (u_xlatb15) ? 0.0 : u_xlat36;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * in_COLOR0.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb36 = 0.0<u_xlat16_9.x;
        if(u_xlatb36){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + u_xlat3.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_40 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        //ENDIF
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_2 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD1 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat16_1.xyz = u_xlat16_0.yzw * _Color.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    u_xlat16_1.x = u_xlat16_0.x * _Color.w;
    u_xlatb2 = 0.0>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x + u_xlat16_1.x;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

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
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _Shininess;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb15;
mediump vec3 u_xlat16_20;
bool u_xlatb26;
float u_xlat33;
int u_xlati34;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat16_40 = _Shininess * 128.0;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[u_xlati_loop_1].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
        u_xlatb15 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb26 = unity_LightAtten[u_xlati_loop_1].w<u_xlat36;
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_41 = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_9.x = u_xlat36 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
        u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
        u_xlat16_41 = u_xlat16_41 * 0.5;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * in_COLOR0.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb36 = 0.0<u_xlat16_9.x;
        if(u_xlatb36){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + u_xlat3.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_40 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        //ENDIF
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_2 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD1 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat16_1.xyz = u_xlat16_0.yzw * _Color.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    u_xlat16_1.x = u_xlat16_0.x * _Color.w;
    u_xlatb2 = 0.0>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x + u_xlat16_1.x;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

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
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _Shininess;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb15;
mediump vec3 u_xlat16_20;
bool u_xlatb26;
float u_xlat33;
int u_xlati34;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat16_40 = _Shininess * 128.0;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[u_xlati_loop_1].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
        u_xlatb15 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb26 = unity_LightAtten[u_xlati_loop_1].w<u_xlat36;
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_41 = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_9.x = u_xlat36 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
        u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
        u_xlat16_41 = u_xlat16_41 * 0.5;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * in_COLOR0.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb36 = 0.0<u_xlat16_9.x;
        if(u_xlatb36){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + u_xlat3.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_40 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        //ENDIF
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_2 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD1 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat16_1.xyz = u_xlat16_0.yzw * _Color.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    u_xlat16_1.x = u_xlat16_0.x * _Color.w;
    u_xlatb2 = 0.0>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x + u_xlat16_1.x;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

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
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _Emission;
uniform 	mediump float _Shininess;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_2;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb15;
mediump vec3 u_xlat16_20;
bool u_xlatb26;
float u_xlat33;
int u_xlati34;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat16_40 = _Shininess * 128.0;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[u_xlati_loop_1].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
        u_xlatb15 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb26 = unity_LightAtten[u_xlati_loop_1].w<u_xlat36;
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_41 = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_9.x = u_xlat36 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
        u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
        u_xlat16_41 = u_xlat16_41 * 0.5;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * in_COLOR0.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb36 = 0.0<u_xlat16_9.x;
        if(u_xlatb36){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + u_xlat3.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_40 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        //ENDIF
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_2 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD1 = phase0_Output0_2.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat16_1.xyz = u_xlat16_0.yzw * _Color.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    u_xlat16_1.x = u_xlat16_0.x * _Color.w;
    u_xlatb2 = 0.0>=u_xlat16_1.x;
    SV_Target0.w = u_xlat16_1.x + u_xlat16_1.x;
    if(((int(u_xlatb2) * -1))!=0){discard;}
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
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
""
}
}
}
}
}